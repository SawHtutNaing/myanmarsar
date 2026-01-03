<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class IngredientImport extends Model
{
    use HasFactory;

    protected $fillable = [
        'ingredient_id',
        'code',
        'quantity',
        'unit_price',
        'date',
    ];

    protected $casts = [
        'date' => 'date',
    ];

    public function ingredient(): BelongsTo
    {
        return $this->belongsTo(Ingredient::class);
    }
}
