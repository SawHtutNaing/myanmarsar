<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function salesReport()
    {
        $completedOrders = Order::where('status', 'completed')->with('orderItems.foodItem')->get();
        $totalRevenue = $completedOrders->sum('total_price');

        return view('admin.reports.sales', compact('completedOrders', 'totalRevenue'));
    }

    public function profitLossReport()
    {
        $completedOrders = Order::where('status', 'completed')->with('orderItems')->get();
        
        $totalRevenue = $completedOrders->sum('total_price');
        $totalCost = $completedOrders->flatMap->orderItems->sum('cost');
        $profit = $totalRevenue - $totalCost;

        return view('admin.reports.profit_loss', compact('completedOrders', 'totalRevenue', 'totalCost', 'profit'));
    }

    public function ingredientImportReport(Request $request)
    {
        $query = \App\Models\IngredientImport::with('ingredient');

        if ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $request->end_date);
        }

        $imports = $query->orderBy('date', 'desc')->get();

        $totalQuantity = $imports->sum('quantity');
        $totalCost = $imports->sum(function ($import) {
            return $import->quantity * $import->unit_price;
        });

        return view('admin.reports.ingredient_imports', compact('imports', 'totalQuantity', 'totalCost'));
    }
}
