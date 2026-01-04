<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('table_bill_out_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users'); // Waiter who billed out
            $table->foreignId('table_id')->constrained('tables'); // Table being billed out
            $table->foreignId('order_id')->constrained('orders'); // The order that was completed
            $table->decimal('total_money', 8, 2); // Total money collected for the order
            $table->timestamp('billed_at')->useCurrent(); // Time of billing
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('table_bill_out_records');
    }
};
