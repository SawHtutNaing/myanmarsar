<?php

namespace App\Http\Controllers;

use App\Models\FoodItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Table;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
        $request->validate([
            'table_number' => 'required|integer|exists:tables,table_number',
            'items' => 'required|array',
        ]);

        $table = Table::where('table_number', $request->table_number)->firstOrFail();
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
                $ingredient->quantity -= $ingredient->pivot->quantity * $data['quantity'];
                $ingredient->save();
            }
        }

        // Update table status
        $table->status = 'occupied';
        $table->save();

        return redirect()->route('waiter.dashboard')->with('success', 'Order placed successfully.');
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
