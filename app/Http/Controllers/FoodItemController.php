<?php

namespace App\Http\Controllers;

use App\Models\FoodItem;
use Illuminate\Http\Request;
use App\Models\Ingredient;

class FoodItemController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $fooditems = FoodItem::all();
        return view('admin.fooditems.index', compact('fooditems'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $ingredients = Ingredient::all();
        return view('admin.fooditems.create', compact('ingredients'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
     $request->validate([
    'name' => 'required|string|max:255',
    'price' => 'required|numeric',
    'quantity' => 'required|integer',
    'description' => 'nullable|string',
    'ingredient_quantities.*' => 'nullable|numeric|min:0',
]);

$ingredientQuantities = $request->input('ingredient_quantities', []);
$attachData = [];
foreach ($ingredientQuantities as $ingredientId => $quantity) {
    $quantity = (float) $quantity; // Cast to float for decimals
    if ($quantity > 0) {
        $attachData[$ingredientId] = ['quantity' => $quantity];
    }
}

        if (empty($attachData)) {
            return back()->withErrors(['ingredient_quantities' => 'At least one ingredient with quantity > 0 is required.'])->withInput();
        }

        $foodItem = FoodItem::create($request->only('name', 'price', 'quantity', 'description'));
        $foodItem->ingredients()->attach($attachData);

        return redirect()->route('admin.fooditems.index')->with('success', 'Food item created successfully.');
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
        $fooditem = FoodItem::findOrFail($id);
        $ingredients = Ingredient::all();
        return view('admin.fooditems.edit', compact('fooditem', 'ingredients'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
     $request->validate([
  'name' => 'required|string|max:255',
    'price' => 'required|numeric',
    'quantity' => 'required|integer',
    'description' => 'nullable|string',
    'ingredient_quantities.*' => 'nullable|numeric|min:0',
]);

$ingredientQuantities = $request->input('ingredient_quantities', []);
$syncData = [];
foreach ($ingredientQuantities as $ingredientId => $quantity) {
    $quantity = (float) $quantity;
    if ($quantity > 0) {
        $syncData[$ingredientId] = ['quantity' => $quantity];
    }
}

        if (empty($syncData)) {
            return back()->withErrors(['ingredient_quantities' => 'At least one ingredient with quantity > 0 is required.'])->withInput();
        }

        $fooditem = FoodItem::findOrFail($id);
        $fooditem->update($request->only('name', 'price', 'quantity', 'description'));
        $fooditem->ingredients()->sync($syncData);

        return redirect()->route('admin.fooditems.index')->with('success', 'Food item updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $fooditem = FoodItem::findOrFail($id);
        $fooditem->ingredients()->detach();
        $fooditem->delete();

        return redirect()->route('admin.fooditems.index')->with('success', 'Food item deleted successfully.');
    }
}
