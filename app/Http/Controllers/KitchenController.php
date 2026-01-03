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
        $orders = Order::where('status', 'pending')->with('orderItems.foodItem')->get();
        return response()->json($orders);
    }

    public function completeOrder(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->status = 'completed';
        $order->save();

        // Check if there are any pending orders left for this table
        // $pendingOrders = Order::where('table_number', $order->table_number)
        //                       ->where('status', 'pending')
        //                       ->count();

        // if ($pendingOrders === 0) {
        //     $table = Table::where('table_number', $order->table_number)->first();
        //     if ($table) {
        //         $table->status = 'available';
        //         $table->save();
        //     }
        // }

               return view('kitchen.orders');


    }
}
