<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အော်ဒါ #') }}{{ $order->id }} ကို တည်းဖြတ်ပါ။
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if ($errors->any())
                <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                    <strong class="font-bold">အမှားတစ်ခုခု ဖြစ်သွားပါပြီ။</strong>
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
                    <h3 class="text-lg font-bold mb-4">အော်ဒါအသေးစိတ် (စားပွဲ: {{ $order->table_number }})</h3>
                    <p class="mb-2"><strong>အခြေအနေ:</strong> {{ ucfirst($order->status) }}</p>
                    <p class="mb-4"><strong>လက်ရှိစုစုပေါင်း:</strong> <span id="current_total_price">${{ number_format($order->total_price, 2) }}</span></p>

                    <div class="mb-4">
                        <label for="remark" class="block text-gray-700 text-sm font-bold mb-2">မှတ်ချက်:</label>
                        <textarea name="remark" id="remark" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">{{ old('remark', $order->remark) }}</textarea>
                    </div>

                    <form action="{{ route('waiter.orders.updateItems', $order->id) }}" method="POST">
                        @csrf
                        @method('PATCH')

                        <div class="mb-4">
                            <h4 class="font-bold text-md mb-2">အော်ဒါပစ္စည်းများ:</h4>
                            @foreach ($order->orderItems as $orderItem)
                                <div class="flex items-center justify-between mb-4 p-4 border rounded-lg">
                                    <div class="flex-grow">
                                        <h4 class="font-bold text-md">{{ $orderItem->foodItem->name }}</h4>
                                        <p class="text-sm text-gray-600">ယူနစ်စျေးနှုန်း: ${{ number_format($orderItem->foodItem->price, 2) }}</p>
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
                            <h3 class="text-lg font-bold">စုစုပေါင်းအသစ်: <span id="new_total_price">$0.00</span></h3>
                        </div>

                        <div>
                            <x-primary-button type="submit">
                                ပြောင်းလဲမှုများကို သိမ်းဆည်းပါ။
                            </x-primary-button>
                            <a href="{{ route('waiter.my-orders', ['id' => $order->table_number]) }}" class="ml-4 inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150">
                                ဖျက်သိမ်းမည်
                            </a>
                        </div>
                    </form>

                    <hr class="my-6">

                    <h3 class="text-lg font-bold mb-4">ပစ္စည်းများ ထပ်ထည့်ပါ။</h3>
                    <form action="{{ route('waiter.orders.add-items', $order->id) }}" method="POST">
                        @csrf
                        <div class="mb-4">
                            @foreach ($fooditems as $fooditem)
                                <div class="flex items-center justify-between mb-4 p-4 border rounded-lg">
                                    <div class="flex-grow">
                                        <h4 class="font-bold text-md">{{ $fooditem->name }}</h4>
                                        <p class="text-sm text-gray-600">{{ $fooditem->description }}</p>
                                        <p class="text-sm font-semibold text-green-600">${{ number_format($fooditem->price, 2) }}</p>
                                    </div>
                                    <div class="flex items-center">
                                        <button type="button" onclick="decrementNewQty({{ $fooditem->id }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-l">-</button>
                                        <input type="number" name="items[{{ $fooditem->id }}]" id="new_qty_{{ $fooditem->id }}" value="0" min="0" class="w-16 text-center border-t border-b border-gray-300" readonly>
                                        <button type="button" onclick="incrementNewQty({{ $fooditem->id }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-r">+</button>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">ပစ္စည်းအသစ်စုစုပေါင်း: <span id="new_items_total_price">$0.00</span></h3>
                        </div>
                        <div>
                            <x-primary-button type="submit">
                                ပစ္စည်းများ ထည့်ပါ။
                            </x-primary-button>
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
    <script>
        const newPrices = @json($fooditems->pluck('price', 'id'));

        function updateNewTotal() {
            let total = 0;
            for (const id in newPrices) {
                const qty = parseInt(document.getElementById(`new_qty_${id}`).value) || 0;
                total += qty * newPrices[id];
            }
            document.getElementById('new_items_total_price').textContent = `$${total.toFixed(2)}`;
        }

        function incrementNewQty(id) {
            const input = document.getElementById(`new_qty_${id}`);
            input.value = parseInt(input.value) + 1;
            updateNewTotal();
        }

        function decrementNewQty(id) {
            const input = document.getElementById(`new_qty_${id}`);
            if (parseInt(input.value) > 0) {
                input.value = parseInt(input.value) - 1;
                updateNewTotal();
            }
        }
    </script>
</x-app-layout>