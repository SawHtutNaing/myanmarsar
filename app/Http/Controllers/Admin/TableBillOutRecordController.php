<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TableBillOutRecord; // Add this

class TableBillOutRecordController extends Controller
{
    public function index()
    {
        $billOutRecords = TableBillOutRecord::with(['user', 'table', 'order'])
                                            ->latest()
                                            ->paginate(10); // Or retrieve all, depending on needs

        return view('admin.reports.table_bill_outs.index', compact('billOutRecords'));
    }
}
