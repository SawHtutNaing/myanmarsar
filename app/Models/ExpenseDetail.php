<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ExpenseDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'expense_group_id',
        'title',
        'date',
        'amount',
    ];

    protected $casts = [
        'date' => 'date',
    ];

    /**
     * Get the expense group that owns the expense detail.
     */
    public function expenseGroup(): BelongsTo
    {
        return $this->belongsTo(ExpenseGroup::class);
    }
}
