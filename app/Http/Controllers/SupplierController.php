<?php

namespace App\Http\Controllers;

use App\Models\IngredientImport;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    public function ingredientImportReport(Request $request)
    {
        $query = IngredientImport::with('ingredient');

        if ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $request->start_date);
        }

        if ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $request->end_date);
        }

        $imports = $query->orderBy('date', 'desc')->get();

        $totalQuantity = $imports->sum('quantity');
        $totalCost = $imports->sum(function ($import) {
            return $import->quantity * $import->unit_price;
        });

        return view('supplier.reports.ingredient_imports', compact('imports', 'totalQuantity', 'totalCost'));
    }

    public function editIngredientImport($id)
    {
        $import = IngredientImport::findOrFail($id);
        return view('supplier.reports.edit_ingredient_import', compact('import'));
    }

    public function updateIngredientImport(Request $request, $id)
    {
        $import = IngredientImport::findOrFail($id);
        $oldQuantity = $import->quantity;

        $request->validate([
            'quantity' => 'required|numeric|min:0',
            'unit_price' => 'required|numeric|min:0',
            'date' => 'required|date',
        ]);

        $import->update($request->all());

        $ingredient = $import->ingredient;
        $ingredient->quantity = $ingredient->quantity - $oldQuantity + $request->quantity;
        $ingredient->save();

        return redirect()->route('supplier.reports.ingredient-imports')->with('success', 'Ingredient import updated successfully.');
    }

    public function destroyIngredientImport($id)
    {
        $import = IngredientImport::findOrFail($id);
        $ingredient = $import->ingredient;
        $ingredient->quantity -= $import->quantity;
        $ingredient->save();
        $import->delete();

        return redirect()->route('supplier.reports.ingredient-imports')->with('success', 'Ingredient import deleted successfully.');
    }
}
