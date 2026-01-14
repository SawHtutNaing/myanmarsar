<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;


use App\Models\Order;
use App\Models\FoodItem;
use App\Models\Ingredient;
use App\Models\OrderItem; // Added this line


 use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index()
    {
        $lowStockIngredients = Ingredient::whereNotNull('low_stock_alert_quantity')
            ->whereColumn('quantity', '<=', 'low_stock_alert_quantity')
            ->get();

        return view('admin.dashboard', compact('lowStockIngredients'));
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
    public function cancelOrder(Order $order)
    {
        if ($order->status === 'cancelled' || $order->status === 'completed') {
            return redirect()->route('admin.orders.index')->with('error', 'Order is already ' . $order->status . '.');
        }

        try {
            foreach ($order->orderItems as $orderItem) {
                if ($orderItem->status !== 'cancelled' && $orderItem->status !== 'completed') {
                    $orderItem->status = 'cancelled';
                    $orderItem->save();

                    $foodItem = $orderItem->foodItem;
                    if ($foodItem) {
                        foreach ($foodItem->ingredients as $ingredient) {
                            $pivotQuantity = $ingredient->pivot->quantity;
                            $orderItemQuantity = $orderItem->quantity;
                            $restockQuantity = $pivotQuantity * $orderItemQuantity;
                            $ingredient->quantity += $restockQuantity;
                            $ingredient->save();
                        }
                    }
                }
            }

            $order->status = 'cancelled';
            $order->total_price = 0;
            $order->save();

            return redirect()->route('admin.orders.index')->with('success', 'Order cancelled and all ingredients restocked successfully.');
        } catch (\Exception $e) {
            return redirect()->route('admin.orders.index')->with('error', 'Error cancelling order: ' . $e->getMessage());
        }
    }


public function downloadDatabase()
{
    try {
        $fileName = 'backup-' . now()->format('Y-m-d_H-i-s') . '.sql';
        $filePath = 'backup/' . $fileName;

        Storage::makeDirectory('backup');

        $database = config('database.connections.mysql.database');
        $tables = DB::select('SHOW TABLES');
        $sql = '';

        foreach ($tables as $table) {
            $tableName = array_values((array)$table)[0];

            // Get table structure
            $createTable = DB::select("SHOW CREATE TABLE `{$tableName}`")[0];
            $sql .= "\n\n-- Table structure for `{$tableName}`\n\n";
            $sql .= "DROP TABLE IF EXISTS `{$tableName}`;\n";
            $sql .= $createTable->{'Create Table'} . ";\n\n";

            // Get table data
            $rows = DB::table($tableName)->get();

            if ($rows->count() > 0) {
                $sql .= "-- Dumping data for table `{$tableName}`\n\n";

                foreach ($rows as $row) {
                    $row = (array)$row;
                    $values = array_map(function($value) {
                        return is_null($value) ? 'NULL' : "'" . addslashes($value) . "'";
                    }, $row);

                    $sql .= "INSERT INTO `{$tableName}` VALUES (" . implode(', ', $values) . ");\n";
                }
            }
        }

        Storage::put($filePath, $sql);

        return response()->download(Storage::path($filePath), $fileName, [
            'Content-Type' => 'application/sql',
        ])->deleteFileAfterSend(true);

    } catch (\Exception $exception) {
        if (isset($filePath) && Storage::exists($filePath)) {
            Storage::delete($filePath);
        }

        return redirect()->back()->with('error', 'Database backup failed: ' . $exception->getMessage());
    }
}
}
