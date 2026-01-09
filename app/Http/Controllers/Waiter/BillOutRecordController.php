<?php

namespace App\Http\Controllers\Waiter;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TableBillOutRecord;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class BillOutRecordController extends Controller
{
    public function index(Request $request)
    {
        $waiterId = Auth::id();

        $query = TableBillOutRecord::where('user_id', $waiterId)
                                     ->with(['user', 'table', 'order']);

        $dateFrom = $request->input('date_from');
        $dateTo = $request->input('date_to');

        // If no date filters are provided, default to today's date
        if (!$dateFrom && !$dateTo) {
            $dateFrom = Carbon::today()->toDateString();
            $dateTo = Carbon::today()->toDateString();
        } else {
            // Ensure both are set if one is, to avoid partial filtering issues
            if (!$dateFrom) {
                $dateFrom = Carbon::parse($dateTo)->toDateString();
            }
            if (!$dateTo) {
                $dateTo = Carbon::parse($dateFrom)->toDateString();
            }
        }

        if ($dateFrom) {
            $query->whereDate('billed_at', '>=', Carbon::parse($dateFrom));
        }
        if ($dateTo) {
            $query->whereDate('billed_at', '<=', Carbon::parse($dateTo));
        }

        $totalAmount = $query->sum('total_money');

        $billOutRecords = $query->latest()->paginate(10);

        return view('waiter.reports.bill_outs.index', compact('billOutRecords', 'totalAmount', 'dateFrom', 'dateTo'));
    }
}
