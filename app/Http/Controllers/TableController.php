<?php

namespace App\Http\Controllers;

use App\Models\Table;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\TableBillOutRecord; // Added
use Illuminate\Support\Facades\Auth; // Added
use Illuminate\Support\Facades\Log;

class TableController extends Controller
{
    public function index()
    {
        $tables = Table::with(['orders' => function($query) {
            $query->whereIn('status', ['pending', 'preparing'])
                  ->with('orderItems.foodItem')
                  ->orderBy('created_at', 'desc');
        }])->get();
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
        $orders = Order::where('table_number', $table->table_number)
            ->with('orderItems.foodItem')
            ->orderBy('created_at', 'desc') // Order by created_at descending
            ->get();
        return response()->json([
            'orders' => $orders,
            'table_status' => $table->status,
        ]);
    }

    public function toggleStatus(string $id)
    {
        $table = Table::findOrFail($id);
        $oldStatus = $table->status; // Store old status

        if ($table->status === 'available') {
            $table->status = 'occupied';
        } elseif ($table->status === 'occupied') {
            $table->status = 'available';
        } else {
            return response()->json(['error' => 'Cannot toggle this status.'], 400);
        }

        $table->save();

        // If table transitioned from occupied to available, and there was a completed order
                    if ($oldStatus === 'occupied' && $table->status === 'available') {
                        $currentOrder = Order::where('table_number', $table->table_number)
                                             ->whereIn('status', ['pending', 'preparing', 'served']) // Only consider active orders
                                             ->latest()
                                             ->first();
        
                        if ($currentOrder) {
                            $currentOrder->status = 'completed';
                            $currentOrder->save();
        
                            // Create a TableBillOutRecord
                            TableBillOutRecord::create([
                                'user_id' => Auth::id(),
                                'table_id' => $table->id, // Store table's actual ID
                                'order_id' => $currentOrder->id,
                                'total_money' => $currentOrder->total_price,
                                'billed_at' => now(),
                            ]);
                        }
                    }

        return response()->json(['table_status' => $table->status]);
    }

            public function fetchTableStatuses()

            {

                $tables = Table::all(['id', 'status', 'table_number']);

                $tableData = [];



                foreach ($tables as $table) {

                    $latestOrder = null;

                    if ($table->status === 'occupied') {

                        $latestOrder = Order::where('table_number', $table->table_number)

                                            ->whereIn('status', ['pending', 'preparing', 'served']) // Include served to track completion

                                            ->orderBy('created_at', 'desc')

                                            ->first(['id', 'status']);

                    }



                    $tableData[] = [

                        'id' => $table->id,

                        'status' => $table->status,

                        'table_number' => $table->table_number,

                        'latest_order' => $latestOrder

                    ];

                }



                // --- Fetch and clear notifications for the current waiter ---

                $waiterNotifications = [];

                $waiterId = \Illuminate\Support\Facades\Auth::id();



                if ($waiterId) {

                    // Check for individual item ready notification

                    $foodItemReadyNotification = \Illuminate\Support\Facades\Cache::get("waiter_notification:{$waiterId}");

                    if ($foodItemReadyNotification) {

                        $waiterNotifications['food_item_ready'] = $foodItemReadyNotification;

                        \Illuminate\Support\Facades\Cache::forget("waiter_notification:{$waiterId}"); // Clear from cache

                    }



                    // Check for full order complete notification

                    $orderCompleteNotification = \Illuminate\Support\Facades\Cache::get("waiter_notification:{$waiterId}:order_complete");

                    if ($orderCompleteNotification) {

                        $waiterNotifications['order_complete'] = $orderCompleteNotification;

                        \Illuminate\Support\Facades\Cache::forget("waiter_notification:{$waiterId}:order_complete"); // Clear from cache

                    }

                }

                // --- End fetch and clear notifications ---



                return response()->json([

                    'tables' => $tableData,

                    'notifications' => $waiterNotifications,

                ]);

            }

        }




