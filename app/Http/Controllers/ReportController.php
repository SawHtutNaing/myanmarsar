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
}
