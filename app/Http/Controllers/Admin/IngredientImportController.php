<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Ingredient;
use App\Http\Requests\IngredientImportRequest;
use App\Models\IngredientImport;
use Illuminate\Http\Request;

class IngredientImportController extends Controller
{
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\IngredientImport  $ingredientImport
     * @return \Illuminate\Http\Response
     */
    public function edit(IngredientImport $ingredientImport)
    {
        $ingredients = Ingredient::all();
        return view('admin.ingredients.edit_import', compact('ingredientImport', 'ingredients'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\IngredientImportRequest  $request
     * @param  \App\Models\IngredientImport  $ingredientImport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, IngredientImport $ingredientImport)
    {
        $request->validate([
            'ingredient_id' => 'required|exists:ingredients,id',
            'quantity' => 'required|numeric|min:0',
            'unit_price' => 'required|numeric|min:0',
            'date' => 'required|date',
        ]);

        $originalQuantity = $ingredientImport->quantity;

        // Update the ingredient import record
        $ingredientImport->update($request->all());

        // Update the ingredient's stock
        $ingredient = Ingredient::findOrFail($request->ingredient_id);
        $quantityDifference = $request->quantity - $originalQuantity;
        $ingredient->quantity += $quantityDifference;
        $ingredient->save();

        return redirect()->route('admin.reports.ingredient-imports')->with('success', 'Ingredient import updated successfully.');
    }
}
