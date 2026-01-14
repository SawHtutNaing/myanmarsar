<?php

namespace App\Http\Controllers;

use App\Models\Ingredient;
use Illuminate\Http\Request;

class IngredientController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $ingredients = Ingredient::all();
        return view('admin.ingredients.index', compact('ingredients'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.ingredients.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'unit' => 'required|string|max:255',
            'quantity' => 'required|integer',
            'unit_price' => 'required|numeric',
            'low_stock_alert_quantity' => 'nullable|numeric',
        ]);

        Ingredient::create($request->all());

        return redirect()->route('admin.ingredients.index')->with('success', 'Ingredient created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $ingredient = Ingredient::findOrFail($id);
        return view('admin.ingredients.edit', compact('ingredient'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'unit' => 'required|string|max:255',
            'quantity' => 'required',
            'unit_price' => 'required|numeric',
            'low_stock_alert_quantity' => 'nullable|numeric',
        ]);

        $ingredient = Ingredient::findOrFail($id);
        $ingredient->update($request->all());

        return redirect()->route('admin.ingredients.index')->with('success', 'Ingredient updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $ingredient = Ingredient::findOrFail($id);
        $ingredient->delete();

        return redirect()->route('admin.ingredients.index')->with('success', 'Ingredient deleted successfully.');
    }
}
