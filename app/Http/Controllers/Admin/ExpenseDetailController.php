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
        if (auth()->user()->hasRole('admin')) {
            $expenseDetails = ExpenseDetail::with('expenseGroup')->latest()->paginate(10);
        } else {
            $expenseDetails = ExpenseDetail::whereHas('expenseGroup', function ($query) {
                $query->where('type', 'kitchen');
            })->with('expenseGroup')->latest()->paginate(10);
        }
        return view('admin.expenses.details.index', compact('expenseDetails'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        if (auth()->user()->hasRole('admin')) {
            $expenseGroups = ExpenseGroup::all();
        } else {
            $expenseGroups = ExpenseGroup::where('type', 'kitchen')->get();
        }
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

        if (!auth()->user()->hasRole('admin')) {
            $expenseGroup = ExpenseGroup::find($request->expense_group_id);
            if ($expenseGroup->type !== 'kitchen') {
                return redirect()->back()->withErrors(['expense_group_id' => 'You are not authorized to create an expense detail for this group.'])->withInput();
            }
        }

        ExpenseDetail::create($request->all());

        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';

        return redirect()->route($redirectRoute)
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
        if (!auth()->user()->hasRole('admin') && $expenseDetail->expenseGroup->type !== 'kitchen') {
            $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';
            return redirect()->route($redirectRoute)->with('error', 'You are not authorized to edit this expense detail.');
        }

        if (auth()->user()->hasRole('admin')) {
            $expenseGroups = ExpenseGroup::all();
        } else {
            $expenseGroups = ExpenseGroup::where('type', 'kitchen')->get();
        }

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

        if (!auth()->user()->hasRole('admin')) {
            $expenseGroup = ExpenseGroup::find($request->expense_group_id);
            if ($expenseGroup->type !== 'kitchen' || $expenseDetail->expenseGroup->type !== 'kitchen') {
                $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';
                return redirect()->route($redirectRoute)->with('error', 'You are not authorized to update this expense detail.');
            }
        }

        $expenseDetail->update($request->all());

        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';

        return redirect()->route($redirectRoute)
                         ->with('success', 'Expense detail updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExpenseDetail $expenseDetail)
    {
        if (!auth()->user()->hasRole('admin') && $expenseDetail->expenseGroup->type !== 'kitchen') {
            $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';
            return redirect()->route($redirectRoute)->with('error', 'You are not authorized to delete this expense detail.');
        }

        $expenseDetail->delete();
        
        $redirectRoute = auth()->user()->hasRole('supplier') ? 'supplier.expense_details.index' : 'admin.expense_details.index';

        return redirect()->route($redirectRoute)
                         ->with('success', 'Expense detail deleted successfully.');
    }
}
