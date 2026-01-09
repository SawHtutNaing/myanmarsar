<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Table;
use Illuminate\Http\Request;

class KitchenController extends Controller
{
    public function index()
    {
        return view('kitchen.dashboard');
    }

    public function orders()
    {
        return view('kitchen.orders');
    }

    public function fetchOrders()
    {
        $orders = Order::whereHas('orderItems', function ($query) {
            $query->whereIn('status', ['pending', 'cooked']);

        })->with('orderItems.foodItem')->get()
        ->map(function ($order) {
    $order->updated_human = $order->updated_at
        ? $order->updated_at->diffForHumans()
        : null;
    return $order;
});

        ;
        return response()->json($orders);
    }

    public function completeOrderItem(Request $request, $orderItemId)
    {
        $orderItem = \App\Models\OrderItem::findOrFail($orderItemId);
        $orderItem->status = 'cooked';
        $orderItem->save();

        $order = $orderItem->order;

        // --- Cross-user notification for waiter (using Cache) ---
        $waiterId = $order->user_id; // Assuming order belongs to the waiter who placed it
        $foodItemName = $orderItem->foodItem->name ?? 'Unknown Item';
        $tableNumber = $order->table_number ?? 'Unknown Table';

        $notificationData = [
            'id' => $orderItem->id, // Use order_item_id to track
            'type' => 'food_item_ready',
            'message' => "Order #{$order->id}: {$foodItemName} for Table {$tableNumber} is ready!",
            'order_id' => $order->id,
            'table_number' => $tableNumber,
            'food_item_name' => $foodItemName,
            'timestamp' => now()->toDateTimeString(),
        ];

        // Store notification in cache for the specific waiter
        \Illuminate\Support\Facades\Cache::forever("waiter_notification:{$waiterId}", $notificationData);
        // --- End cross-user notification ---


        // Check if all order items for this order are now served
        $allServed = $order->orderItems->every(function ($item) {
            return $item->status === 'cooked';
        });

        if ($allServed) {
            $order->status = 'cooked';
            $order->save();
        }

                return view('kitchen.orders');

    }

    public function completeOrder(Request $request, $orderId)
    {
        $order = \App\Models\Order::findOrFail($orderId);
        $order->status = 'cooked'; // Consistency: changed from 'completed' to 'cooked'
        $order->save();

        // Optionally, mark all associated order items as served
        foreach ($order->orderItems as $orderItem) {
            $orderItem->status = 'cooked';
            $orderItem->save();
        }

        // --- Cross-user notification for waiter (using Cache) ---
        $waiterId = $order->user_id;
        $tableNumber = $order->table_number ?? 'Unknown Table';
        $notificationData = [
            'id' => $order->id, // Use order_id to track
            'type' => 'order_ready',
            'message' => "Order #{$order->id} for Table {$tableNumber} is completed by the kitchen!",
            'order_id' => $order->id,
            'table_number' => $tableNumber,
            'timestamp' => now()->toDateTimeString(),
        ];
        \Illuminate\Support\Facades\Cache::forever("waiter_notification:{$waiterId}:order_complete", $notificationData);
        // --- End cross-user notification ---

        // Redirect back or return a success response
        return redirect()->route('kitchen.orders')->with('success', 'Order ' . $order->id . ' marked as cooked.');
    }
}
