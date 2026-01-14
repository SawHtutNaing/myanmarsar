<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Ingredient extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'unit',
        'quantity',
        'unit_price',
        'low_stock_alert_quantity',
    ];

    /**
     * The food items that use this ingredient.
     */
    public function foodItems(): BelongsToMany
    {
        return $this->belongsToMany(FoodItem::class)->withPivot('quantity');
    }
}

