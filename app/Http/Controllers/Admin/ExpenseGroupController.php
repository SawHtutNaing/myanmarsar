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
        if (auth()->user()->hasRole('admin')) {
            $expenseGroups = ExpenseGroup::paginate(10);
        } else {
            $expenseGroups = ExpenseGroup::where('type', 'kitchen')->paginate(10);
        }
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
            'type' => 'required|in:restaurant,kitchen',
        ]);

        $data = $request->all();

        if (!auth()->user()->hasRole('admin')) {
            $data['type'] = 'kitchen';
        }

        ExpenseGroup::create($data);

        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_groups.index' : 'admin.expense_groups.index';

        return redirect()->route($redirectRoute)
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
            'type' => 'required|in:restaurant,kitchen',
        ]);

        if (!auth()->user()->hasRole('admin') && $expenseGroup->type !== 'kitchen') {
            return redirect()->route(auth()->user()->hasRole('supplier') ? 'supplier.expense_groups.index' : 'admin.expense_groups.index')->with('error', 'You are not authorized to edit this expense group.');
        }

        $data = $request->all();

        if (!auth()->user()->hasRole('admin')) {
            $data['type'] = 'kitchen';
        }

        $expenseGroup->update($data);

        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_groups.index' : 'admin.expense_groups.index';

        return redirect()->route($redirectRoute)
                         ->with('success', 'Expense group updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExpenseGroup $expenseGroup)
    {
        if (!auth()->user()->hasRole('admin') && $expenseGroup->type !== 'kitchen') {
            return redirect()->route(auth()->user()->hasRole('supplier') ? 'supplier.expense_groups.index' : 'admin.expense_groups.index')->with('error', 'You are not authorized to delete this expense group.');
        }

        $expenseGroup->delete();

        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_groups.index' : 'admin.expense_groups.index';

        return redirect()->route($redirectRoute)
                         ->with('success', 'Expense group deleted successfully.');
    }
}
