<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ExpenseGroup; // Added

class ExpenseGroupController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $expenseGroups = ExpenseGroup::paginate(10);
        return view('admin.expenses.groups.index', compact('expenseGroups'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.expenses.groups.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:expense_groups,name',
        ]);

        ExpenseGroup::create($request->all());

        return redirect()->route('admin.expense_groups.index')
                         ->with('success', 'Expense group created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(ExpenseGroup $expenseGroup)
    {
        // Not typically needed for a simple group, can redirect to edit or list.
        return redirect()->route('admin.expense_groups.edit', $expenseGroup);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExpenseGroup $expenseGroup)
    {
        return view('admin.expenses.groups.edit', compact('expenseGroup'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ExpenseGroup $expenseGroup)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:expense_groups,name,' . $expenseGroup->id,
        ]);

        $expenseGroup->update($request->all());

        return redirect()->route('admin.expense_groups.index')
                         ->with('success', 'Expense group updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExpenseGroup $expenseGroup)
    {
        $expenseGroup->delete();

        return redirect()->route('admin.expense_groups.index')
                         ->with('success', 'Expense group deleted successfully.');
    }
}
