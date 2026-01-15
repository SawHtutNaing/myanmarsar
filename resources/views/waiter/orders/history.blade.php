<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အော်ဒါမှတ်တမ်း') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 ">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <!-- Date Filter Section -->
                    <div class="mb-6 bg-gray-50 p-4 rounded-lg">
                        <h4 class="text-md font-semibold mb-3">ရက်စွဲအလိုက် အော်ဒါများကို စစ်ထုတ်ပါ။</h4>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label for="date_from" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲမှ</label>
                                <input type="date" id="date_from" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div>
                                <label for="date_to" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲအထိ</label>
                                <input type="date" id="date_to" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div class="flex items-end gap-2">
                                <button id="apply_filter" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                                    စစ်ထုတ်ပါ။
                                </button>
                                <button id="reset_filter" class="px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
                                    ပြန်လည်စတင်ပါ
                                </button>
                            </div>
                        </div>
                    </div>

                    <h3 class="text-lg font-bold mb-4">ကျွန်ုပ်၏ အော်ဒါမှတ်တမ်း</h3>
                    <div id="order-history-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {{-- Orders will be loaded here --}}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let dateFrom = '';
            let dateTo = '';

            // Set today's date as default
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('date_from').value = today;
            document.getElementById('date_to').value = today;
            dateFrom = today;
            dateTo = today;


            // Apply Filter Button
            document.getElementById('apply_filter').addEventListener('click', function() {
                dateFrom = document.getElementById('date_from').value;
                dateTo = document.getElementById('date_to').value;
                fetchOrderHistory();
            });

            // Reset Filter Button
            document.getElementById('reset_filter').addEventListener('click', function() {
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('date_from').value = today;
                document.getElementById('date_to').value = today;
                dateFrom = today;
                dateTo = today;
                fetchOrderHistory();
            });

            function createOrderCard(order) {
                const orderCard = document.createElement('div');
                orderCard.className = `border rounded-lg p-6 shadow-md bg-gray-50`;

                let statusColor = 'text-green-600';

                let itemsHtml = '<ul class="space-y-2">';
                order.order_items.forEach(item => {
                    itemsHtml += `<li class="flex items-center justify-between">
                        <span>${item.quantity} x ${item.food_item.name}</span>
                    </li>`;
                });
                itemsHtml += '</ul>';

                const totalPrice = parseFloat(order.total_price);
                const formattedTotal = isNaN(totalPrice) ? '0.00' : totalPrice.toFixed(2);

                // Format date
                const orderDate = new Date(order.created_at);
                const formattedDate = orderDate.toLocaleString();

                orderCard.innerHTML = `
                    <h4 class="font-bold text-lg mb-2">အော်ဒါ #${order.id}</h4>
                    <p class="text-xs text-gray-500 mb-2">${formattedDate}</p>
                    <p class="text-md font-semibold mb-1">စားပွဲ #${order.table_number}</p>
                    <p class="text-sm mb-4">အခြေအနေ: <span class="${statusColor} font-semibold">${order.status}</span></p>
                    ${itemsHtml}
                    <p class="mt-4 text-base font-semibold">စုစုပေါင်း: $${formattedTotal}</p>
                `;
                return orderCard;
            }

            function fetchOrderHistory() {
                let url = '{{ route('waiter.order-history.fetch') }}';
                const params = new URLSearchParams();

                if (dateFrom) params.append('date_from', dateFrom);
                if (dateTo) params.append('date_to', dateTo);

                if (params.toString()) {
                    url += '?' + params.toString();
                }

                fetch(url)
                    .then(response => response.json())
                    .then(orders => {
                        const ordersList = document.getElementById('order-history-list');
                        ordersList.innerHTML = ''; // Clear existing orders

                        orders.sort((a, b) => b.id - a.id); // Sort by ID descending

                        if (orders.length === 0) {
                            ordersList.innerHTML = '<p class="text-gray-500 text-center py-8 col-span-full">ရွေးချယ်ထားသော ရက်စွဲအပိုင်းအခြားအတွက် ပြီးစီးသောအော်ဒါများ မတွေ့ပါ။</p>';
                        } else {
                            orders.forEach(order => {
                                const orderCard = createOrderCard(order);
                                ordersList.appendChild(orderCard);
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error fetching order history:', error);
                    });
            }

            fetchOrderHistory();
        });
    </script>

</x-app-layout>