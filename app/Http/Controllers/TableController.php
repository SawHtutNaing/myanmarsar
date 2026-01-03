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
        return response()->json([
            'orders' => $orders,
            'table_status' => $table->status,
        ]);
    }

    public function toggleStatus(string $id)
    {
        $table = Table::findOrFail($id);

        if ($table->status === 'available') {
            $table->status = 'occupied';
        } elseif ($table->status === 'occupied') {
            $table->status = 'available';
        } else {
            return response()->json(['error' => 'Cannot toggle this status.'], 400);
        }

        $table->save();

        return response()->json(['table_status' => $table->status]);
    }
}
