<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Order;
use App\Models\FoodItem;
use App\Models\Ingredient;
use App\Models\OrderItem; // Added this line


class AdminController extends Controller
{
    public function index()
    {
        return view('admin.dashboard');
    }

    public function ordersIndex()
    {
        $orders = Order::with(['table', 'user', 'orderItems.foodItem.ingredients'])->latest()->paginate(10);
        return view('admin.orders.index', compact('orders'));
    }

    public function cancelOrderItem(OrderItem $orderItem)
    {
        // Ensure the order item is not already cancelled or completed
        if ($orderItem->status === 'cancelled' || $orderItem->status === 'completed') {
            return redirect()->route('admin.orders.index')->with('error', 'Order item is already ' . $orderItem->status . '.');
        }

        $order = $orderItem->order; // Get the parent order
        if (!$order) {
            return redirect()->route('admin.orders.index')->with('error', 'Parent order not found for this item.');
        }

        try {
            // Update order item status
            $orderItem->status = 'cancelled';
            $orderItem->save();

            // Restock ingredients for this specific order item
            $foodItem = $orderItem->foodItem;
            if ($foodItem) {
                foreach ($foodItem->ingredients as $ingredient) {
                    $pivotQuantity = $ingredient->pivot->quantity; // Quantity of ingredient per food item
                    $orderItemQuantity = $orderItem->quantity;     // Quantity of food item in this order item

                    // Calculate total quantity of ingredient to restock
                    $restockQuantity = $pivotQuantity * $orderItemQuantity;

                    // Increment ingredient quantity
                    $ingredient->quantity += $restockQuantity;
                    $ingredient->save();
                }
            }

            // Update parent order's total price
            $order->total_price -= $orderItem->price;
            $order->save();

            // Check if all other items in the order are now cancelled or completed
            $allOtherItemsCancelled = $order->orderItems()
                                             ->where('id', '!=', $orderItem->id)
                                             ->whereNotIn('status', ['cancelled', 'completed'])
                                             ->doesntExist();

            if ($allOtherItemsCancelled) {
                $order->status = 'cancelled';
                $order->save();
            }

            return redirect()->route('admin.orders.index')->with('success', 'Order item cancelled and ingredients restocked successfully.');
        } catch (\Exception $e) {
            return redirect()->route('admin.orders.index')->with('error', 'Error cancelling order item: ' . $e->getMessage());
        }
    }
}
