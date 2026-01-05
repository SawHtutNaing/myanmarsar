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
                    <div id="my-orders-list" class="space-y-8">
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

            function createSection(title, orders, bgClass) {
                if (orders.length === 0) return null;

                const section = document.createElement('div');
                section.innerHTML = `
                    <h4 class="text-md font-semibold mb-2">${title}</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"></div>
                `;
                const grid = section.querySelector('div');

                orders.forEach(order => {
                    const orderCard = document.createElement('div');
                    orderCard.className = `border rounded-lg p-6 shadow-md ${bgClass}`;

                    let statusColor = '';
                    switch (order.status) {
                        case 'pending':
                            statusColor = 'text-yellow-600';
                            break;
                        case 'in_progress':
                            statusColor = 'text-blue-600';
                            break;
                        case 'completed':
                            statusColor = 'text-green-600';
                            break;
                        case 'cancelled':
                            statusColor = 'text-red-600';
                            break;
                        default:
                            statusColor = 'text-gray-600';
                    }

                    let itemsHtml = '<ul class="space-y-2">';
                    order.order_items.forEach(item => {
                        let itemStatusColor = '';
                        switch (item.status) {
                            case 'pending':
                                itemStatusColor = 'text-yellow-600';
                                break;
                            case 'cooking':
                                itemStatusColor = 'text-orange-600';
                                break;
                            case 'cooked':
                                itemStatusColor = 'text-green-600';
                                break;
                            case 'served':
                                itemStatusColor = 'text-blue-600';
                                break;
                            case 'cancelled':
                                itemStatusColor = 'text-red-600';
                                break;
                            default:
                                itemStatusColor = 'text-gray-600';
                        }

                        itemsHtml += `<li class="flex items-center justify-between">
                            <span>${item.quantity} x ${item.food_item.name} - <span class="${itemStatusColor}">${item.status}</span></span>`;
                        if (item.status === 'cooked') {
                            itemsHtml += `
                                <form action="/waiter/orders/items/${item.id}/take" method="POST" class="inline-block ml-2">
                                    @csrf
                                    <button type="submit" onclick="return confirm('Are you sure you want to take this item?');" class="bg-green-500 hover:bg-green-700 text-white text-sm font-medium py-2 px-4 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                        Take
                                    </button>
                                </form>
                            `;
                        }
                        itemsHtml += `</li>`;
                    });
                    itemsHtml += '</ul>';

                    // Parse total_price as float if it's a string
                    const totalPrice = parseFloat(order.total_price);
                    const formattedTotal = isNaN(totalPrice) ? '0.00' : totalPrice.toFixed(2);

                    let editButtonHtml = '';
                    if (order.status !== 'completed' && order.status !== 'cancelled') {
                        editButtonHtml = `<a href="/waiter/orders/${order.id}/edit" onclick="return confirm('Are you sure you want to edit this order?');" class="mt-4 inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-lg text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition ease-in-out duration-150">Edit Order</a>`;
                    }

                    orderCard.innerHTML = `
                        <h4 class="font-bold text-lg mb-2">Order #${order.id}</h4>
                        <p class="text-md font-semibold mb-1">Table #${order.table_number}</p>
                        <p class="text-sm mb-4">Status: <span class="${statusColor} font-semibold">${order.status}</span></p>
                        ${itemsHtml}
                        <p class="mt-4 text-base font-semibold">Total: $${formattedTotal}</p>
                        ${editButtonHtml}
                    `;
                    grid.appendChild(orderCard);
                });

                return section;
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
                        });

                        // Sort orders by id descending (assuming higher id is newer)
                        orders.sort((a, b) => b.id - a.id);

                        // Group orders
                        let ready = []; // Have cooked items, not completed/cancelled
                        let preparing = []; // In progress or pending, no cooked items
                        let completed = [];
                        let cancelled = [];

                        orders.forEach(order => {
                            if (order.status === 'completed') {
                                completed.push(order);
                            } else if (order.status === 'cancelled') {
                                cancelled.push(order);
                            } else {
                                const hasCooked = order.order_items.some(item => item.status === 'cooked');
                                if (hasCooked) {
                                    ready.push(order);
                                } else {
                                    preparing.push(order);
                                }
                            }
                        });

                        // Create sections in order: cooked/ready first, then pending/preparing, then completed, then cancelled
                        const readySection = createSection('Ready to Serve', ready, 'bg-green-50');
                        if (readySection) ordersList.appendChild(readySection);

                        const preparingSection = createSection('Serving', preparing, 'bg-yellow-50');
                        if (preparingSection) ordersList.appendChild(preparingSection);

                        const completedSection = createSection('Completed', completed, 'bg-blue-50');
                        if (completedSection) ordersList.appendChild(completedSection);

                        const cancelledSection = createSection('Cancelled', cancelled, 'bg-red-50');
                        if (cancelledSection) ordersList.appendChild(cancelledSection);
                    });
            }

            setInterval(fetchMyOrders, 5000); // Poll every 5 seconds
            fetchMyOrders(); // Initial fetch
        });
    </script>

</x-app-layout>
