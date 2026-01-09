<?php
namespace App\Http\Controllers;

use App\Models\FoodItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Table;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;

class WaiterController extends Controller
{
    public function index()
    {
        return view('waiter.dashboard');
    }

    public function menu()
    {
        $fooditems = FoodItem::all();
        return view('waiter.menu', compact('fooditems'));
    }

    public function createOrder(Request $request)
    {
        $fooditems = FoodItem::all();
        $table_number = $request->query('table_number');
        return view('waiter.orders.create', compact('fooditems', 'table_number'));
    }

    public function storeOrder(Request $request)
    {
        Log::info('Store Order Request Data: ', $request->all());
        $request->validate([
            'table_number' => 'required|integer|exists:tables,table_number',
            'items' => 'required|array',
            'remark' => 'nullable|string',
        ]);

        $table = Table::where('table_number', $request->table_number)->firstOrFail();
        Log::info('Table Status: ' . $table->status);

        if ($table->status !== 'available') {
            return back()->withErrors(['table_number' => 'Table is not available.'])->withInput();
        }

        $totalPrice = 0;
        $itemData = [];

        foreach ($request->items as $fooditemId => $quantity) {
            $quantity = (int) $quantity;
            if ($quantity > 0) {
                $fooditem = FoodItem::with('ingredients')->findOrFail($fooditemId);
                $price = $fooditem->price * $quantity;
                $cost = 0;

                foreach ($fooditem->ingredients as $ingredient) {
                    $needed = $ingredient->pivot->quantity * $quantity;
                    if ($ingredient->quantity < $needed) {
                        return back()->withErrors(['items' => "Not enough {$ingredient->name} for {$fooditem->name}."])->withInput();
                    }
                    $cost += $ingredient->pivot->quantity * $ingredient->unit_price;
                }

                $itemData[] = [
                    'food_item_id' => $fooditemId,
                    'quantity' => $quantity,
                    'price' => $price,
                    'cost' => $cost * $quantity,
                    'fooditem' => $fooditem,
                ];

                $totalPrice += $price;
            }
        }

        if (empty($itemData)) {
            return back()->withErrors(['items' => 'At least one item is required.'])->withInput();
        }

        $order = Order::create([
            'user_id' => Auth::id(),
            'table_number' => $request->table_number,
            'status' => 'pending',
            'total_price' => $totalPrice,
            'remark' => $request->remark,
        ]);

        foreach ($itemData as $data) {
            OrderItem::create([
                'order_id' => $order->id,
                'food_item_id' => $data['food_item_id'],
                'quantity' => $data['quantity'],
                'price' => $data['price'],
                'cost' => $data['cost'],
                'status' => 'pending',
            ]);

            foreach ($data['fooditem']->ingredients as $ingredient) {
                $ingredient->quantity -= $ingredient->pivot->quantity * $data['quantity'];
                $ingredient->save();
            }
        }

        $table->status = 'occupied';
        $table->save();

        return redirect()->route('waiter.tables.index')->with('success', 'Order placed successfully.');
    }

    public function createAdditionalOrder(Request $request)
    {
        $table_number = $request->query('table_number');
        $table = Table::where('table_number', $table_number)->firstOrFail();

        if ($table->status !== 'occupied') {
            return redirect()->route('waiter.tables.index')->with('error', 'Table is not occupied.');
        }

        $currentOrder = Order::where('table_number', $table_number)
            ->whereIn('status', ['pending', 'preparing', 'served'])
            ->latest()
            ->first();

        if (!$currentOrder) {
            $currentOrder = Order::create([
                'user_id' => Auth::id(),
                'table_number' => $table_number,
                'status' => 'pending',
                'total_price' => 0,
            ]);
        }

        $fooditems = FoodItem::all();
        $currentItems = $currentOrder->orderItems()->get()->keyBy('food_item_id');

        return view('waiter.orders.add', compact('fooditems', 'table_number', 'currentOrder', 'currentItems'));
    }

    public function addItemsToOrder(Request $request, string $id)
    {
        $order = Order::findOrFail($id);
        $table = Table::where('table_number', $order->table_number)->firstOrFail();

        $hasItems = false;
        foreach ($request->items ?? [] as $quantity) {
            if ((int)$quantity > 0) {
                $hasItems = true;
                break;
            }
        }

        if (!$hasItems) {
            return back()->withErrors(['items' => 'Please select at least one item to add to the order.'])->withInput();
        }

        $additionalPrice = 0;
        $itemData = [];

        foreach ($request->items as $fooditemId => $quantity) {
            $quantity = (int) $quantity;
            if ($quantity > 0) {
                $fooditem = FoodItem::with('ingredients')->find($fooditemId);

                if (!$fooditem) {
                    return back()->withErrors(['items' => 'One or more selected items are invalid.'])->withInput();
                }

                $price = $fooditem->price * $quantity;
                $cost = 0;

                foreach ($fooditem->ingredients as $ingredient) {
                    $needed = $ingredient->pivot->quantity * $quantity;
                    if ($ingredient->quantity < $needed) {
                        return back()->withErrors([
                            'items' => "Insufficient ingredients: Not enough {$ingredient->name} available for {$quantity} x {$fooditem->name}. Available: {$ingredient->quantity}, Required: {$needed}"
                        ])->withInput();
                    }
                    $cost += $ingredient->pivot->quantity * $ingredient->unit_price;
                }

                $itemData[] = [
                    'food_item_id' => $fooditemId,
                    'quantity' => $quantity,
                    'price' => $price,
                    'cost' => $cost * $quantity,
                    'fooditem' => $fooditem,
                ];

                $additionalPrice += $price;
            }
        }

        foreach ($itemData as $data) {
            $existingItem = OrderItem::where('order_id', $order->id)
                ->where('food_item_id', $data['food_item_id'])
                ->whereIn('status', ['pending', 'preparing'])
                ->first();

            if ($existingItem) {
                $existingItem->quantity += $data['quantity'];
                $existingItem->price += $data['price'];
                $existingItem->cost += $data['cost'];
                $existingItem->save();
            } else {
                OrderItem::create([
                    'order_id' => $order->id,
                    'food_item_id' => $data['food_item_id'],
                    'quantity' => $data['quantity'],
                    'price' => $data['price'],
                    'cost' => $data['cost'],
                    'status' => 'pending',
                ]);
            }

            foreach ($data['fooditem']->ingredients as $ingredient) {
                $ingredient->quantity -= $ingredient->pivot->quantity * $data['quantity'];
                $ingredient->save();
            }
        }

        $order->total_price += $additionalPrice;
        $order->save();

        return redirect()->route('waiter.tables.index')
            ->with('success', "Successfully added items to Order #{$order->id}. New total: $" . number_format($order->total_price, 2));
    }

    public function orders()
    {
        return view('waiter.orders.index');
    }

    public function fetchMyOrders(Request $request)
    {
        $query = Auth::user()
    ->orders()
    ->whereNotIn('status', ['completed', 'canceled'])
    ->with('orderItems.foodItem');

        // Apply date filters
        if ($request->has('date_from') && $request->date_from) {
            $dateFrom = Carbon::parse($request->date_from)->startOfDay();
            $query->where('created_at', '>=', $dateFrom);
        }

        if ($request->has('date_to') && $request->date_to) {
            $dateTo = Carbon::parse($request->date_to)->endOfDay();
            $query->where('created_at', '<=', $dateTo);
        }

        // If no date filters, default to today's orders for performance
        if (!$request->has('date_from') && !$request->has('date_to')) {
            $query->whereDate('created_at', Carbon::today());
        }

        $orders = $query->get();
        return response()->json($orders);
    }

    public function editOrder(Order $order)
    {
        $order->load('orderItems.foodItem');
        $fooditems = FoodItem::all();
        return view('waiter.orders.edit', compact('order', 'fooditems'));
    }

    public function updateOrderItems(Request $request, Order $order)
    {
        $request->validate([
            'items' => 'required|array',
            'items.*' => 'numeric|min:0',
            'remark' => 'nullable|string',
        ]);

        if ($order->status === 'completed' || $order->status === 'cancelled') {
            return redirect()->route('waiter.orders.edit', $order->id)
                             ->with('error', 'Cannot modify a ' . $order->status . ' order.');
        }

        $newTotalPrice = 0;
        $foodItemsToProcess = [];

        foreach ($request->items as $orderItemId => $newQuantity) {
            $orderItem = OrderItem::where('order_id', $order->id)->where('id', $orderItemId)->first();

            if (!$orderItem) {
                continue;
            }

            $oldQuantity = $orderItem->quantity;
            $quantityDifference = $newQuantity - $oldQuantity;

            if ($quantityDifference === 0) {
                $newTotalPrice += $orderItem->price;
                continue;
            }

            $foodItem = $orderItem->foodItem()->with('ingredients')->first();

            if ($foodItem) {
                if ($quantityDifference > 0) {
                    foreach ($foodItem->ingredients as $ingredient) {
                        $needed = $ingredient->pivot->quantity * $quantityDifference;
                        if ($ingredient->quantity < $needed) {
                            throw ValidationException::withMessages([
                                'items' => "Insufficient ingredients: Not enough {$ingredient->name} available for {$quantityDifference} additional {$foodItem->name}. Available: {$ingredient->quantity}, Required: {$needed}"
                            ]);
                        }
                        $foodItemsToProcess[] = ['type' => 'deduct', 'ingredient' => $ingredient, 'amount' => $needed];
                    }
                } else {
                    foreach ($foodItem->ingredients as $ingredient) {
                        $restockAmount = $ingredient->pivot->quantity * abs($quantityDifference);
                        $foodItemsToProcess[] = ['type' => 'restock', 'ingredient' => $ingredient, 'amount' => $restockAmount];
                    }
                }
            }

            if ($newQuantity === 0) {
                $orderItem->delete();
            } else {
                $orderItem->quantity = $newQuantity;
                $orderItem->price = $foodItem->price * $newQuantity;
                $totalCostPerFoodItem = 0;
                foreach ($foodItem->ingredients as $ingredient) {
                    $totalCostPerFoodItem += $ingredient->pivot->quantity * $ingredient->unit_price;
                }
                $orderItem->cost = $totalCostPerFoodItem * $newQuantity;
                $orderItem->save();
                $newTotalPrice += $orderItem->price;
            }
        }

        foreach ($foodItemsToProcess as $item) {
            if ($item['type'] === 'deduct') {
                $item['ingredient']->quantity -= $item['amount'];
            } else {
                $item['ingredient']->quantity += $item['amount'];
            }
            $item['ingredient']->save();
        }

        $order->total_price = $newTotalPrice;
        if ($newTotalPrice === 0 && $order->orderItems()->count() === 0) {
            $order->status = 'cancelled';
        }
        $order->remark = $request->remark;
        $order->save();

        return redirect()->route('waiter.orders.edit', $order->id)->with('success', 'Order items updated successfully.');
    }

    public function takeOrderItem(Request $request, $id)
    {
        $orderItem = OrderItem::findOrFail($id);
        $orderItem->status = 'served';
        $orderItem->save();

        $order = $orderItem->order;
        $allServed = $order->orderItems->every(function ($item) {
            return $item->status === 'served';
        });

        if ($allServed) {
            $order->status = 'served';
            $order->save();
        }

        return redirect()->route('waiter.my-orders')->with('success', 'Item taken.');
    }

    public function takeAll(Order $order)
    {
        foreach ($order->orderItems as $orderItem) {
            $orderItem->status = 'served';
            $orderItem->save();
        }

        $order->status = 'served';
        $order->save();

        return redirect()->route('waiter.tables.index')->with('success', 'All items for Order #' . $order->id . ' have been taken.');
    }

    public function orderHistory()
    {
        return view('waiter.orders.history');
    }

    public function fetchOrderHistory(Request $request)
    {
        $query = Auth::user()->orders()
            ->where('status', 'completed')
            ->with('orderItems.foodItem');

        // Apply date filters
        if ($request->has('date_from') && $request->date_from) {
            $dateFrom = Carbon::parse($request->date_from)->startOfDay();
            $query->where('created_at', '>=', $dateFrom);
        }

        if ($request->has('date_to') && $request->date_to) {
            $dateTo = Carbon::parse($request->date_to)->endOfDay();
            $query->where('created_at', '<=', $dateTo);
        }

        $orders = $query->latest()->get();
        return response()->json($orders);
    }
}
