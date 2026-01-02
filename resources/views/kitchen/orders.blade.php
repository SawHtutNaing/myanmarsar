<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Orders') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    @if (session('success'))
                        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                            <span class="block sm:inline">{{ session('success') }}</span>
                        </div>
                    @endif

                    <h3 class="text-lg font-bold mb-4">Incoming Orders</h3>
                    <div id="orders-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        {{-- Orders will be loaded here via polling --}}
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let lastOrderCount = 0;
            const audio = new Audio('https://interactive-examples.mdn.mozilla.net/media/cc0-audio/t-rex-roar.mp3'); // Default browser sound

            function fetchOrders() {
                fetch('{{ route('kitchen.orders.fetch') }}')
                    .then(response => response.json())
                    .then(orders => {
                        const ordersList = document.getElementById('orders-list');
                        ordersList.innerHTML = ''; // Clear the list

                        if (orders.length > lastOrderCount) {
                            audio.play();
                        }
                        lastOrderCount = orders.length;

                        orders.forEach(order => {
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
                                <form action="/kitchen/orders/${order.id}/complete" method="POST" class="mt-4">
                                    @csrf
                                    <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
                                        Mark as Complete
                                    </button>
                                </form>
                            `;
                            ordersList.appendChild(orderCard);
                        });
                    });
            }

            setInterval(fetchOrders, 5000); // Poll every 5 seconds
            fetchOrders(); // Initial fetch
        });
    </script>
    @endpush
</x-app-layout>
