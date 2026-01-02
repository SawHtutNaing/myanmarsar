<?php

namespace App\Http\Controllers;

use App\Models\Table;
use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Facades\Log;

class TableController extends Controller
{
    public function index()
    {
        $tables = Table::all();
        return view('waiter.tables.index', compact('tables'));
    }

    public function show(string $id)
    {
        $table = Table::findOrFail($id);
        $orders = Order::where('table_number', $table->table_number)->with('orderItems.foodItem')->get();
        return view('waiter.tables.show', compact('table', 'orders'));
    }

    public function fetchOrders(string $id)
    {
        
        $table = Table::findOrFail($id);
        $orders = Order::where('table_number', $table->table_number)->with('orderItems.foodItem')->get();
        return response()->json($orders);
    }
}
