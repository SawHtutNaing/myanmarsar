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
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let notifiedOrderItems = new Set(); // Keep track of order item IDs for which sound has been played
   let audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            let audioEnabled = false;
            // Function to resume audio context after user interaction
            function initAudioContext() {
                if (audioCtx.state === 'suspended') {
                    audioCtx.resume().then(() => {
                        audioEnabled = true;
                        console.log('Audio context resumed');
                    }).catch(error => {
                        console.error('Failed to resume audio context:', error);
                    });
                } else if (audioCtx.state === 'running') {
                    audioEnabled = true;
                }
            }

            // Add event listeners for user interaction (e.g., click anywhere on the page)
            document.body.addEventListener('click', initAudioContext);

            function playSound() {
                initAudioContext();
                if (!audioEnabled || audioCtx.state !== 'running') {
                    console.log('Audio context not running yet or audio disabled - sound skipped.');
                    return;
                }
                console.log('Playing notification sound.');
                const oscillator = audioCtx.createOscillator();
                const gainNode = audioCtx.createGain();
                oscillator.type = 'sine';
                oscillator.frequency.setValueAtTime(600, audioCtx.currentTime); // Slightly lower frequency for different tone
                gainNode.gain.setValueAtTime(0.7, audioCtx.currentTime); // Slightly louder
                oscillator.connect(gainNode);
                gainNode.connect(audioCtx.destination);
                oscillator.start();
                setTimeout(() => {
                    oscillator.stop();
                }, 500); // Increase duration to 500ms
            }

            function fetchOrders() {
                fetch('{{ route('kitchen.orders.fetch') }}')
                    .then(response => response.json())
                    .then(orders => {
                        const ordersList = document.getElementById('orders-list');
                        ordersList.innerHTML = ''; // Clear the list

                        let pendingItemsFound = false;

                        orders.forEach(order => {
                            order.order_items.forEach(item => {
                                if ((item.status === 'pending' || item.status === 'preparing') && !notifiedOrderItems.has(item.id)) {
                                    pendingItemsFound = true;
                                    notifiedOrderItems.add(item.id); // Add to set so it doesn't play again for this item
                                }
                            });

                            const orderCard = document.createElement('div');
                            orderCard.className = 'border rounded-lg p-4 mb-4 shadow-md ' +
                                (order.status === 'pending' ? 'bg-yellow-100' :
                                 order.status === 'preparing' ? 'bg-orange-100' :
                                 order.status === 'served' ? 'bg-green-100' : 'bg-gray-100'); // Add status-based background

                            let itemsHtml = '<ul class="list-disc pl-5 mt-2 text-sm">';
                            order.order_items.forEach(item => {
                                itemsHtml += `<li class="flex justify-between items-center py-1">
                                    <span>${item.quantity} x ${item.food_item.name} <span class="text-xs text-gray-500">(${item.status})</span></span>
                                    ${(item.status === 'pending' || item.status === 'preparing') ? `
                                        <form action="{{ route('kitchen.orders.complete-item', ['orderItemId' => 'ITEM_ID']) }}" method="POST" class="inline-block ml-2" data-item-id="${item.id}">
                                            @csrf
                                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white text-xs py-1 px-2 rounded">
                                                Mark as Served
                                            </button>
                                        </form>
                                    ` : ''}
                                </li>`;
                            });
                            itemsHtml += '</ul>';

                            // Parse total_price as float if it's a string
                            const totalPrice = parseFloat(order.total_price);
                            const formattedTotal = isNaN(totalPrice) ? '0.00' : totalPrice.toFixed(2);

                            orderCard.innerHTML = `
                                <div class="flex justify-between items-center mb-2">
                                    <h4 class="font-bold text-lg">Order #${order.id}</h4>
                                    <span class="text-sm font-semibold px-2 py-1 rounded-full
                                        ${order.status === 'pending' ? 'bg-yellow-500 text-white' :
                                          order.status === 'preparing' ? 'bg-orange-500 text-white' :
                                          order.status === 'served' ? 'bg-green-500 text-white' :
                                          'bg-gray-500 text-white'}">
                                        ${order.status.charAt(0).toUpperCase() + order.status.slice(1)}
                                    </span>
                                </div>
                                <p class="text-gray-600 mb-2">Table: ${order.table_number}</p>
                                ${itemsHtml}
                                <p class="text-right font-bold mt-3">Total: $${formattedTotal}</p>
                                <form action="{{ route('kitchen.orders.complete-order', ['orderId' => 'ORDER_ID']) }}" method="POST" class="mt-4" data-order-id="${order.id}">
                                    @csrf
                                    <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded w-full">
                                        Mark Entire Order as Served
                                    </button>
                                </form>
                            `;
                            ordersList.appendChild(orderCard);

                            // Dynamically update form actions after card is appended
                            orderCard.querySelectorAll('form[data-item-id]').forEach(form => {
                                const itemId = form.dataset.itemId;
                                form.action = form.action.replace('ITEM_ID', itemId);
                            });
                            orderCard.querySelectorAll('form[data-order-id]').forEach(form => {
                                const orderId = form.dataset.orderId;
                                form.action = form.action.replace('ORDER_ID', orderId);
                            });
                        });

                        if (pendingItemsFound) {
                            playSound();
                        }
                    });
            }
            setInterval(fetchOrders, 5000); // Poll every 5 seconds
            fetchOrders(); // Initial fetch
        });
    </script>
</x-app-layout>
