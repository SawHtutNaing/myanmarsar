<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit Order #') }}{{ $order->id }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if ($errors->any())
                <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                    <strong class="font-bold">Oops! Something went wrong:</strong>
                    <ul class="mt-2 list-disc list-inside">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @if (session('success'))
                <div class="mb-4 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                    {{ session('success') }}
                </div>
            @endif

            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">Order Details (Table: {{ $order->table_number }})</h3>
                    <p class="mb-2"><strong>Status:</strong> {{ ucfirst($order->status) }}</p>
                    <p class="mb-4"><strong>Current Total:</strong> <span id="current_total_price">${{ number_format($order->total_price, 2) }}</span></p>

                    <form action="{{ route('waiter.orders.updateItems', $order->id) }}" method="POST">
                        @csrf
                        @method('PATCH')

                        <div class="mb-4">
                            <h4 class="font-bold text-md mb-2">Order Items:</h4>
                            @foreach ($order->orderItems as $orderItem)
                                <div class="flex items-center justify-between mb-4 p-4 border rounded-lg">
                                    <div class="flex-grow">
                                        <h4 class="font-bold text-md">{{ $orderItem->foodItem->name }}</h4>
                                        <p class="text-sm text-gray-600">Unit Price: ${{ number_format($orderItem->foodItem->price, 2) }}</p>
                                    </div>
                                    <div class="flex items-center">
                                        <button
                                        @disabled($orderItem->status == 'served')
                                        type="button" onclick="decrementOrderItemQty({{ $orderItem->id }}, {{ $orderItem->foodItem->price }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-l">-</button>
                                        <input type="number"
                                        @disabled($orderItem->status == 'served')
                                        name="items[{{ $orderItem->id }}]" id="order_item_qty_{{ $orderItem->id }}" value="{{ $orderItem->quantity }}" min="0" class="w-16 text-center border-t border-b border-gray-300" onchange="updateOrderItemTotal()">
                                        <button
                                        @disabled($orderItem->status == 'served')
                                        type="button" onclick="incrementOrderItemQty({{ $orderItem->id }}, {{ $orderItem->foodItem->price }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-r">+</button>
                                    </div>
                                </div>
                            @endforeach
                        </div>

                        <div class="mb-4">
                            <h3 class="text-lg font-bold">New Total: <span id="new_total_price">$0.00</span></h3>
                        </div>

                        <div>
                            <x-primary-button type="submit">
                                Save Changes
                            </x-primary-button>
                            <a href="{{ route('waiter.tables.show', ['id' => $order->table_number]) }}" class="ml-4 inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150">
                                Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const orderItems = @json($order->orderItems->keyBy('id')->map(function($item) {
            return ['quantity' => $item->quantity, 'price_per_item' => $item->foodItem->price];
        }));

        let initialOrderTotalPrice = parseFloat({{ $order->total_price }});

        document.addEventListener('DOMContentLoaded', function() {
            updateOrderItemTotal(); // Calculate initial total on page load
        });

        function updateOrderItemTotal() {
            let newTotal = 0;
            for (const orderItemId in orderItems) {
                const input = document.getElementById(`order_item_qty_${orderItemId}`);
                const currentQty = parseInt(input.value) || 0;
                newTotal += currentQty * orderItems[orderItemId].price_per_item;
            }
            document.getElementById('new_total_price').textContent = `$${newTotal.toFixed(2)}`;
        }

        function incrementOrderItemQty(id, pricePerItem) {
            const input = document.getElementById(`order_item_qty_${id}`);
            input.value = parseInt(input.value) + 1;
            updateOrderItemTotal();
        }

        function decrementOrderItemQty(id, pricePerItem) {
            const input = document.getElementById(`order_item_qty_${id}`);
            if (parseInt(input.value) > 0) {
                input.value = parseInt(input.value) - 1;
                updateOrderItemTotal();
            }
        }
    </script>
</x-app-layout>
