<?php

namespace App\Http\Controllers;

use App\Models\FoodItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Table;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

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
        ]);

        $table = Table::where('table_number', $request->table_number)->firstOrFail();
        Log::info('Table Status: ' . $table->status);

        if ($table->status !== 'available') {
            return back()->withErrors(['table_number' => 'Table is not available.'])->withInput();
        }

        $totalPrice = 0;
        $itemData = []; // Collect for later creation

        // First loop: Check quantities and calculate
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
                    'fooditem' => $fooditem, // For deduct loop
                ];

                $totalPrice += $price;
            }
        }

        if (empty($itemData)) {
            return back()->withErrors(['items' => 'At least one item is required.'])->withInput();
        }

        // All checks passed: Create order
        $order = Order::create([
            'user_id' => Auth::id(),
            'table_number' => $request->table_number,
            'status' => 'pending',
            'total_price' => $totalPrice,
        ]);

        // Second loop: Create items and deduct ingredients
        foreach ($itemData as $data) {
            OrderItem::create([
                'order_id' => $order->id,
                'food_item_id' => $data['food_item_id'],
                'quantity' => $data['quantity'],
                'price' => $data['price'],
                'cost' => $data['cost'],
            ]);

            foreach ($data['fooditem']->ingredients as $ingredient) {
                Log::info('Deducting Ingredient: ' . $ingredient->name);
                Log::info('Current Quantity: ' . $ingredient->quantity);
                Log::info('Deduction Amount: ' . ($ingredient->pivot->quantity * $data['quantity']));

                $ingredient->quantity -= $ingredient->pivot->quantity * $data['quantity'];

                Log::info('New Quantity: ' . $ingredient->quantity);
                $ingredient->save();
            }
        }

        // Update table status
        $table->status = 'occupied';
        $table->save();

        return redirect()->route('waiter.dashboard')->with('success', 'Order placed successfully.');
    }

    public function createAdditionalOrder(Request $request)
    {
        $table_number = $request->query('table_number');
        $table = Table::where('table_number', $table_number)->firstOrFail();

        if ($table->status !== 'occupied') {
            return redirect()->route('waiter.tables.index')->with('error', 'Table is not occupied.');
        }

        $currentOrder = Order::where('table_number', $table_number)
            ->where('status', 'pending')
            ->latest()
            ->first();

        if (!$currentOrder) {
            return redirect()->route('waiter.tables.index')->with('error', 'No pending order found for this table.');
        }

        $fooditems = FoodItem::all();
        $currentItems = $currentOrder->orderItems()->get()->keyBy('food_item_id');

        return view('waiter.orders.add', compact('fooditems', 'table_number', 'currentOrder', 'currentItems'));
    }

    public function addItemsToOrder(Request $request, string $id)
    {
        $order = Order::findOrFail($id);

        if ($order->status !== 'pending') {
            return back()->withErrors(['error' => 'Order is not pending.']);
        }

        $table = Table::where('table_number', $order->table_number)->firstOrFail();

        if ($table->status !== 'occupied') {
            return back()->withErrors(['table_number' => 'Table is not occupied.']);
        }

        $request->validate([
            'items' => 'required|array',
        ]);

        $additionalPrice = 0;
        $itemData = [];

        // First loop: Check quantities and calculate
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

                $additionalPrice += $price;
            }
        }

        if (empty($itemData)) {
            return back()->withErrors(['items' => 'At least one item is required.'])->withInput();
        }

        // All checks passed: Add items to order
        foreach ($itemData as $data) {
            $existingItem = OrderItem::where('order_id', $order->id)
                ->where('food_item_id', $data['food_item_id'])
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
                ]);
            }

            // Deduct ingredients
            foreach ($data['fooditem']->ingredients as $ingredient) {
                Log::info('Deducting Ingredient: ' . $ingredient->name);
                Log::info('Current Quantity: ' . $ingredient->quantity);
                Log::info('Deduction Amount: ' . ($ingredient->pivot->quantity * $data['quantity']));

                $ingredient->quantity -= $ingredient->pivot->quantity * $data['quantity'];

                Log::info('New Quantity: ' . $ingredient->quantity);
                $ingredient->save();
            }
        }

        // Update total price
        $order->total_price += $additionalPrice;
        $order->save();

        return redirect()->route('waiter.dashboard')->with('success', 'Items added to order successfully.');
    }

    public function orders()
    {
        return view('waiter.orders.index');
    }

    public function fetchMyOrders()
    {
        $orders = Auth::user()->orders()->with('orderItems.foodItem')->get();
        return response()->json($orders);
    }
}
