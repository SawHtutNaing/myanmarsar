<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Table;
use Illuminate\Http\Request;

class TableController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $tables = Table::all();
        return view('admin.tables.index', compact('tables'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.tables.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'table_number' => 'required|integer|unique:tables,table_number',
            'status' => 'required|string|in:available,occupied,reserved,cleaning',
        ]);

        Table::create($validatedData);

        return redirect()->route('admin.tables.index')->with('success', 'Table created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Table $table)
    {
        // For a simple CRUD, show is often combined with edit or not needed as a separate view.
        // We'll redirect to the edit page for viewing/editing for simplicity.
        return redirect()->route('admin.tables.edit', $table);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Table $table)
    {
        return view('admin.tables.edit', compact('table'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Table $table)
    {
        $validatedData = $request->validate([
            'table_number' => 'required|integer|unique:tables,table_number,' . $table->id,
            'status' => 'required|string|in:available,occupied,reserved,cleaning',
        ]);

        $table->update($validatedData);

        return redirect()->route('admin.tables.index')->with('success', 'Table updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Table $table)
    {
        $table->delete();

        return redirect()->route('admin.tables.index')->with('success', 'Table deleted successfully!');
    }
}
