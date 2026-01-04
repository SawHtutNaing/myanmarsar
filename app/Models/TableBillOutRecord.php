<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TableBillOutRecord extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'table_id',
        'order_id',
        'total_money',
        'billed_at',
    ];

    /**
     * The waiter who billed out the table.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * The table that was billed out.
     */
    public function table(): BelongsTo
    {
        return $this->belongsTo(Table::class);
    }

    /**
     * The order that was billed out.
     */
    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }
}
