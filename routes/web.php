<?php

use App\Http\Controllers\Admin\TableController as AdminTableController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\IngredientController;
use App\Http\Controllers\FoodItemController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WaiterController;
use App\Http\Controllers\KitchenController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;

Route::get('/', function () {
    return view('welcome');
});

use App\Http\Controllers\ReportController;

use App\Http\Controllers\IngredientImportController;

// Admin Routes
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [AdminController::class, 'index'])->name('dashboard');

    Route::resource('ingredients', IngredientController::class);
    Route::resource('fooditems', FoodItemController::class);
    Route::resource('users', UserController::class);
    Route::resource('tables', AdminTableController::class);
    Route::get('/reports/sales', [ReportController::class, 'salesReport'])->name('reports.sales');
    Route::get('/reports/profit-loss', [ReportController::class, 'profitLossReport'])->name('reports.profit_loss');
    Route::get('/reports/ingredient-imports', [ReportController::class, 'ingredientImportReport'])->name('reports.ingredient-imports');
    Route::get('/orders', [AdminController::class, 'ordersIndex'])->name('orders.index');
    Route::patch('/order-items/{orderItem}/cancel', [AdminController::class, 'cancelOrderItem'])->name('order_items.cancel');
});

Route::middleware(['auth', 'role:supplier'])->prefix('supplier')->name('supplier.')->group(function () {
Route::get('/', [IngredientImportController::class, 'create'])->name('ingredients.import.create');
    Route::post('/ingredients/import', [IngredientImportController::class, 'store'])->name('ingredients.import.store');
    Route::get('/reports/ingredient-imports', [ReportController::class, 'ingredientImportReport'])->name('reports.ingredient-imports');
});


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

use App\Http\Controllers\TableController;

// Waiter Routes
Route::middleware(['auth', 'role:waiter'])->prefix('waiter')->name('waiter.')->group(function () {
    Route::get('/', [WaiterController::class, 'index'])->name('dashboard');
    Route::get('/menu', [WaiterController::class, 'menu'])->name('menu');
    Route::get('/tables', [TableController::class, 'index'])->name('tables.index');
    Route::get('/tables/{id}', [TableController::class, 'show'])->name('tables.show');
    Route::get('/orders/create', [WaiterController::class, 'createOrder'])->name('orders.create');
    Route::post('/orders', [WaiterController::class, 'storeOrder'])->name('orders.store');
    Route::get('/my-orders', [WaiterController::class, 'orders'])->name('my-orders');
    Route::get('/my-orders/fetch', [WaiterController::class, 'fetchMyOrders'])->name('my-orders.fetch');
    Route::post('/tables/{id}/toggle-status', [TableController::class, 'toggleStatus'])->name('tables.toggleStatus');
    Route::get('tables/{id}/fetch-orders', [TableController::class, 'fetchOrders'])->name('tables.fetchOrders');
    Route::get('/orders/add-to-current', [WaiterController::class, 'createAdditionalOrder'])->name('orders.add-to-current');
    Route::post('/orders/{order}/add-items', [WaiterController::class, 'addItemsToOrder'])->name('orders.add-items');
    Route::get('/orders/{order}/edit', [WaiterController::class, 'editOrder'])->name('orders.edit');
    Route::patch('/orders/{order}/update-items', [WaiterController::class, 'updateOrderItems'])->name('orders.updateItems');
    Route::get('/fetch-statuses', [TableController::class, 'fetchTableStatuses'])->name('tables.fetch-statuses');
});

// Kitchen Routes
Route::middleware(['auth', 'role:kitchen'])->prefix('kitchen')->name('kitchen.')->group(function () {
    Route::get('/', [KitchenController::class, 'index'])->name('dashboard');
    Route::get('/orders', [KitchenController::class, 'orders'])->name('orders');
    Route::get('/orders/fetch', [KitchenController::class, 'fetchOrders'])->name('orders.fetch');
    Route::post('/orders/{orderItemId}/complete-item', [KitchenController::class, 'completeOrderItem'])->name('orders.complete-item');
    Route::post('/orders/{orderId}/complete', [KitchenController::class, 'completeOrder'])->name('orders.complete-order');
});

require __DIR__.'/auth.php';
