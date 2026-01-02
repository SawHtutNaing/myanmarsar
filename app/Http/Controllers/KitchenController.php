<?php

namespace App\Http\Controllers;

use App\Models\Order;
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
        $orders = Order::with('orderItems.foodItem')
            ->whereIn('status', ['pending', 'preparing'])
            ->get();

        return response()->json($orders);
    }

    public function completeOrder(string $id)
    {
        $order = Order::findOrFail($id);
        $order->status = 'completed';
        $order->save();

        return redirect()->route('kitchen.orders')->with('success', 'Order marked as completed.');
    }
}
