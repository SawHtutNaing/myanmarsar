<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ExpenseDetail; // Added
use App\Models\ExpenseGroup;  // Added

class ExpenseDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $expenseDetails = ExpenseDetail::with('expenseGroup')->latest()->paginate(10);
        return view('admin.expenses.details.index', compact('expenseDetails'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $expenseGroups = ExpenseGroup::all();
        return view('admin.expenses.details.create', compact('expenseGroups'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'expense_group_id' => 'required|exists:expense_groups,id',
            'title' => 'required|string|max:255',
            'date' => 'required|date',
            'amount' => 'required|numeric|min:0',
        ]);

        ExpenseDetail::create($request->all());

        return redirect()->route('admin.expense_details.index')
                         ->with('success', 'Expense detail created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(ExpenseDetail $expenseDetail)
    {
        // Not typically needed for a simple detail
        return redirect()->route('admin.expense_details.edit', $expenseDetail);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExpenseDetail $expenseDetail)
    {
        $expenseGroups = ExpenseGroup::all();
        return view('admin.expenses.details.edit', compact('expenseDetail', 'expenseGroups'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ExpenseDetail $expenseDetail)
    {
        $request->validate([
            'expense_group_id' => 'required|exists:expense_groups,id',
            'title' => 'required|string|max:255',
            'date' => 'required|date',
            'amount' => 'required|numeric|min:0',
        ]);

        $expenseDetail->update($request->all());

        return redirect()->route('admin.expense_details.index')
                         ->with('success', 'Expense detail updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExpenseDetail $expenseDetail)
    {
        $expenseDetail->delete();

        return redirect()->route('admin.expense_details.index')
                         ->with('success', 'Expense detail deleted successfully.');
    }
}
