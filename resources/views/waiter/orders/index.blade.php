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
                    console.log('Audio context not running yet - sound skipped until user interaction');
                    return;
                }
                const oscillator = audioCtx.createOscillator();
                const gainNode = audioCtx.createGain();
                oscillator.type = 'sine';
                oscillator.frequency.setValueAtTime(800, audioCtx.currentTime);
                oscillator.connect(gainNode);
                gainNode.connect(audioCtx.destination);
                gainNode.gain.setValueAtTime(0.5, audioCtx.currentTime);
                oscillator.start();
                setTimeout(() => {
                    oscillator.stop();
                }, 200);
            }

            function fetchMyOrders() {
                fetch('{{ route('waiter.my-orders.fetch') }}')
                    .then(response => response.json())
                    .then(orders => {
                        const ordersList = document.getElementById('my-orders-list');
                        ordersList.innerHTML = ''; // Clear the list

                        orders.forEach(order => {
                            if (order.status === 'completed' && !completedOrders.has(order.id)) {
                                playSound();
                                completedOrders.add(order.id);
                            }

                            const orderCard = document.createElement('div');
                            orderCard.className = 'border rounded-lg p-4';

                            let itemsHtml = '<ul>';
                            order.order_items.forEach(item => {
                                itemsHtml += `<li>${item.quantity} x ${item.food_item.name}</li>`;
                            });
                            itemsHtml += '</ul>';

                            // Parse total_price as float if it's a string
                            const totalPrice = parseFloat(order.total_price);
                            const formattedTotal = isNaN(totalPrice) ? '0.00' : totalPrice.toFixed(2);

                            let editButtonHtml = '';
                            if (order.status !== 'completed' && order.status !== 'cancelled') {
                                editButtonHtml = `<a href="/waiter/orders/${order.id}/edit" class="mt-2 inline-flex items-center px-3 py-1 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition ease-in-out duration-150">Edit Order</a>`;
                            }

                            orderCard.innerHTML = `
                                <h4 class="font-bold">Order #${order.id}</h4>
                                <p>Table: ${order.table_number}</p>
                                <p>Status: ${order.status}</p>
                                ${itemsHtml}
                                <p>Total: $${formattedTotal}</p>
                                ${editButtonHtml}
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
