<?php

namespace App\Http\Controllers;

use App\Models\Ingredient;
use App\Models\IngredientImport;
use Illuminate\Http\Request;

class IngredientImportController extends Controller
{
    public function create()
    {
        $ingredients = Ingredient::all();
        return view('admin.ingredients.import', compact('ingredients'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'ingredient_id' => 'required|exists:ingredients,id',
            'code' => 'nullable|string',
            'quantity' => 'required|integer',
            'unit_price' => 'required|numeric',
            'date' => 'required|date',
        ]);

        IngredientImport::create($request->all());

        $ingredient = Ingredient::findOrFail($request->ingredient_id);
        $ingredient->quantity += $request->quantity;
        $ingredient->unit_price = $request->unit_price;
        $ingredient->save();

        return redirect()->route('supplier.reports.ingredient-imports')->with('success', 'Ingredient imported successfully.');
    }
}
