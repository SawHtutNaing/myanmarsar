<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('လက်ရှိအော်ဒါထဲသို့ ထည့်ပါ။') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <!-- Display Validation Errors -->
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

                    <h3 class="text-lg font-bold mb-4">လက်ရှိအော်ဒါ #{{ $currentOrder->id }} စားပွဲ {{ $table_number }}အတွက်</h3>
                    <div class="mb-6">
                        <h4 class="text-md font-semibold mb-2">လက်ရှိပစ္စည်းများ:</h4>
                        <ul class="list-disc pl-5">
                            @foreach ($currentItems as $item)
                                <li>{{ $item->quantity }} x {{ $item->foodItem->name }} - ${{ number_format($item->price, 2) }}</li>
                            @endforeach
                        </ul>
                        <p class="mt-2 font-bold">လက်ရှိစုစုပေါင်း: ${{ number_format($currentOrder->total_price, 2) }}</p>
                    </div>

                    <form action="{{ route('waiter.orders.add-items', $currentOrder->id) }}" method="POST">
                        @csrf
                        <input type="hidden" name="table_number" value="{{ $table_number }}">
                        <div class="mb-4">
                            <h3 class="text-lg font-bold mb-2">ပစ္စည်းများ ထပ်ထည့်ပါ။</h3>
                            @foreach ($fooditems as $fooditem)
                                <div class="flex items-center justify-between mb-4 p-4 border rounded-lg">
                                    <div class="flex-grow">
                                        <h4 class="font-bold text-md">{{ $fooditem->name }}</h4>
                                        <p class="text-sm text-gray-600">{{ $fooditem->description }}</p>
                                        <p class="text-sm font-semibold text-green-600">${{ number_format($fooditem->price, 2) }}</p>
                                        @if (isset($currentItems[$fooditem->id]))
                                            <p class="text-sm text-gray-500">လက်ရှိ: {{ $currentItems[$fooditem->id]->quantity }} x</p>
                                        @endif
                                    </div>
                                    <div class="flex items-center">
                                        <button type="button" onclick="decrementQty({{ $fooditem->id }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-l">-</button>
                                        <input type="number" name="items[{{ $fooditem->id }}]" id="qty_{{ $fooditem->id }}" value="{{ old('items.'.$fooditem->id, 0) }}" min="0" class="w-16 text-center border-t border-b border-gray-300" readonly>
                                        <button type="button" onclick="incrementQty({{ $fooditem->id }})" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-1 px-2 rounded-r">+</button>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="mb-4">
                            <h3 class="text-lg font-bold">ထပ်တိုးစုစုပေါင်း: <span id="total_price">$0.00</span></h3>
                        </div>
                        <div>
                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                ပစ္စည်းများ ထည့်ပါ။
                            </button>
                            <a href="{{ route('waiter.tables.index') }}" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded ml-2">
                                ဖျက်သိမ်းမည်
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const prices = @json($fooditems->pluck('price', 'id'));

        function updateTotal() {
            let total = 0;
            for (const id in prices) {
                const qty = parseInt(document.getElementById(`qty_${id}`).value) || 0;
                total += qty * prices[id];
            }
            document.getElementById('total_price').textContent = `$${total.toFixed(2)}`;
        }

        function incrementQty(id) {
            const input = document.getElementById(`qty_${id}`);
            input.value = parseInt(input.value) + 1;
            updateTotal();
        }

        function decrementQty(id) {
            const input = document.getElementById(`qty_${id}`);
            if (parseInt(input.value) > 0) {
                input.value = parseInt(input.value) - 1;
                updateTotal();
            }
        }

        // Initialize total on page load
        document.addEventListener('DOMContentLoaded', function() {
            updateTotal();
        });
    </script>
</x-app-layout>