<?php

namespace App\Http\Controllers;

use App\Models\Ingredient;
use Illuminate\Http\Request;

class IngredientController extends Controller
{
    /**
     * Display a listing of the resource, ordered by sort_no.
     */
    public function index()
    {
        $ingredients = Ingredient::orderBy('sort_no')->get();
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
            'name'                    => 'required|string|max:255',
            'unit'                    => 'required|string|max:255',
            'quantity'                => 'required|integer',
            'unit_price'              => 'required|numeric',
            'low_stock_alert_quantity'=> 'nullable|numeric',
        ]);

        // Assign next sort_no
        $maxSortNo = Ingredient::max('sort_no') ?? 0;

        Ingredient::create(array_merge($request->all(), [
            'sort_no' => $maxSortNo + 1,
        ]));

        return redirect()->route('admin.ingredients.index')
            ->with('success', 'Ingredient created successfully.');
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
     * sort_no is intentionally NOT updated here.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name'                    => 'required|string|max:255',
            'unit'                    => 'required|string|max:255',
            'quantity'                => 'required',
            'unit_price'              => 'required|numeric',
            'low_stock_alert_quantity'=> 'nullable|numeric',
        ]);

        $ingredient = Ingredient::findOrFail($id);
        $ingredient->update($request->only([
            'name',
            'unit',
            'quantity',
            'unit_price',
            'low_stock_alert_quantity',
        ]));

        return redirect()->route('admin.ingredients.index')
            ->with('success', 'Ingredient updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $ingredient = Ingredient::findOrFail($id);
        $ingredient->delete();

        return redirect()->route('admin.ingredients.index')
            ->with('success', 'Ingredient deleted successfully.');
    }

    /**
     * Update sort order via drag-and-drop (AJAX).
     * Expects JSON body: { "order": [id1, id2, id3, ...] }
     */
    public function reorder(Request $request)
    {
        $request->validate([
            'order'   => 'required|array',
            'order.*' => 'integer|exists:ingredients,id',
        ]);

        foreach ($request->order as $sortNo => $id) {
            Ingredient::where('id', $id)->update(['sort_no' => $sortNo + 1]);
        }

        return response()->json(['success' => true]);
    }
}
