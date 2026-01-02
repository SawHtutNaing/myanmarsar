<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('My Orders') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">My Placed Orders</h3>
                    <div id="my-orders-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        {{-- Orders will be loaded here via polling --}}
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let completedOrders = new Set();
            const audio = new Audio('https://interactive-examples.mdn.mozilla.net/media/cc0-audio/t-rex-roar.mp3'); // Default browser sound

            function fetchMyOrders() {
                fetch('{{ route('waiter.my-orders.fetch') }}')
                    .then(response => response.json())
                    .then(orders => {
                        const ordersList = document.getElementById('my-orders-list');
                        ordersList.innerHTML = ''; // Clear the list

                        orders.forEach(order => {
                            if (order.status === 'completed' && !completedOrders.has(order.id)) {
                                audio.play();
                                completedOrders.add(order.id);
                            }

                            const orderCard = document.createElement('div');
                            orderCard.className = 'border rounded-lg p-4';

                            let itemsHtml = '<ul>';
                            order.order_items.forEach(item => {
                                itemsHtml += `<li>${item.quantity} x ${item.food_item.name}</li>`;
                            });
                            itemsHtml += '</ul>';

                            orderCard.innerHTML = `
                                <h4 class="font-bold">Order #${order.id}</h4>
                                <p>Table: ${order.table_number}</p>
                                <p>Status: ${order.status}</p>
                                ${itemsHtml}
                            `;
                            ordersList.appendChild(orderCard);
                        });
                    });
            }

            setInterval(fetchMyOrders, 5000); // Poll every 5 seconds
            fetchMyOrders(); // Initial fetch
        });
    </script>
    
</x-app-layout>
