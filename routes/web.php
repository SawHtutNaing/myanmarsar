<?php

use App\Http\Controllers\Admin\TableController as AdminTableController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\Admin\ExpenseGroupController; // Added
use App\Http\Controllers\Admin\ExpenseDetailController; // Added
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
    Route::resource('expense_groups', ExpenseGroupController::class); // Added
    Route::resource('expense_details', ExpenseDetailController::class); // Added
    Route::get('/reports/sales', [ReportController::class, 'salesReport'])->name('reports.sales');
    Route::get('/reports/profit-loss', [ReportController::class, 'profitLossReport'])->name('reports.profit_loss');
    Route::get('/reports/ingredient-imports', [ReportController::class, 'ingredientImportReport'])->name('reports.ingredient-imports');
    Route::delete('/reports/ingredient-imports/{id}', [ReportController::class, 'destroyIngredientImport'])->name('reports.ingredient-imports.destroy');
    Route::get('/reports/table-bill-outs', [\App\Http\Controllers\Admin\TableBillOutRecordController::class, 'index'])->name('reports.table_bill_outs.index');
    Route::get('/orders', [AdminController::class, 'ordersIndex'])->name('orders.index');

    Route::patch('/order-items/{orderItem}/cancel', [AdminController::class, 'cancelOrderItem'])->name('order_items.cancel');
    Route::patch('/orders/{order}/cancel', [AdminController::class, 'cancelOrder'])->name('orders.cancel');
    Route::get('/download-database', [AdminController::class, 'downloadDatabase'])->name('download.database');
});

Route::middleware(['auth', 'role:supplier'])->prefix('supplier')->name('supplier.')->group(function () {
Route::get('/', [IngredientImportController::class, 'create'])->name('ingredients.import.create');
    Route::post('/ingredients/import', [IngredientImportController::class, 'store'])->name('ingredients.import.store');
    Route::get('/reports/ingredient-imports', [ReportController::class, 'ingredientImportReport'])->name('reports.ingredient-imports');
    Route::resource('expense_groups', ExpenseGroupController::class);
    Route::resource('expense_details', ExpenseDetailController::class);
});


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

use App\Http\Controllers\TableController;
use App\Http\Controllers\Waiter\BillOutRecordController as WaiterBillOutRecordController;

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
    Route::get('/order-history', [WaiterController::class, 'orderHistory'])->name('order-history');
    Route::get('/order-history/fetch', [WaiterController::class, 'fetchOrderHistory'])->name('order-history.fetch');
    Route::get('/bill-outs', [WaiterBillOutRecordController::class, 'index'])->name('reports.bill_outs.index');
    Route::post('/tables/{id}/toggle-status', [TableController::class, 'toggleStatus'])->name('tables.toggleStatus');
    Route::get('tables/{id}/fetch-orders', [TableController::class, 'fetchOrders'])->name('tables.fetchOrders');
    Route::get('/orders/add-to-current', [WaiterController::class, 'createAdditionalOrder'])->name('orders.add-to-current');
    Route::post('/orders/{order}/add-items', [WaiterController::class, 'addItemsToOrder'])->name('orders.add-items');
    Route::get('/orders/{order}/edit', [WaiterController::class, 'editOrder'])->name('orders.edit');
    Route::patch('/orders/{order}/update-items', [WaiterController::class, 'updateOrderItems'])->name('orders.updateItems');
    Route::get('/fetch-statuses', [TableController::class, 'fetchTableStatuses'])->name('tables.fetch-statuses');
    Route::post('/orders/items/{id}/take', [WaiterController::class, 'takeOrderItem'])->name('orders.items.take');
    Route::post('/orders/{order}/take-all', [WaiterController::class, 'takeAll'])->name('orders.take-all');
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
