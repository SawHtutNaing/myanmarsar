<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Table ' . $table->table_number . ' Records') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <div id="table-status-div" class="mb-4 p-4 border rounded-lg text-center
                        @if($table->status == 'available') bg-green-200
                        @elseif($table->status == 'occupied') bg-red-200
                        @else bg-yellow-200 @endif">
                        <p class="text-2xl font-bold">Table {{ $table->table_number }}</p>
                        <p id="table-status-text">{{ ucfirst($table->status) }}</p>
                    </div>
                    <h3 class="text-lg font-bold mb-4">Order History</h3>
                    <div id="table-orders-list" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        {{-- Orders will be loaded here via polling --}}
                    </div>
                    <div class="mt-4">
                        <button id="toggle-status-btn" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            Toggle Status
                        </button>
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

            function fetchTableOrders() {
                fetch('{{ route('waiter.tables.fetchOrders', $table->id) }}')
                    .then(response => response.json())
                    .then(data => {
                        const orders = data.orders;
                        const tableStatus = data.table_status;

                        // Update table status dynamically
                        const statusDiv = document.getElementById('table-status-div');
                        statusDiv.className = 'mb-4 p-4 border rounded-lg text-center ' +
                            (tableStatus === 'available' ? 'bg-green-200' :
                             tableStatus === 'occupied' ? 'bg-red-200' : 'bg-yellow-200');
                        const statusText = document.getElementById('table-status-text');
                        statusText.textContent = tableStatus.charAt(0).toUpperCase() + tableStatus.slice(1);

                        const ordersList = document.getElementById('table-orders-list');
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

                            orderCard.innerHTML = `
                                <h4 class="font-bold">Order #${order.id}</h4>
                                <p>Status: ${order.status}</p>
                                ${itemsHtml}
                                <p>Total: $${formattedTotal}</p>
                            `;
                            ordersList.appendChild(orderCard);
                        });
                    });
            }

            document.getElementById('toggle-status-btn').addEventListener('click', function () {
                fetch('{{ route('waiter.tables.toggleStatus', $table->id) }}', {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Content-Type': 'application/json',
                    },
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Toggle failed');
                    }
                    return response.json();
                })
                .then(data => {
                    // The polling will update the status automatically
                    fetchTableOrders(); // Optional: immediate refresh
                })
                .catch(error => {
                    console.error('Error toggling status:', error);
                });
            });

            setInterval(fetchTableOrders, 5000); // Poll every 5 seconds
            fetchTableOrders(); // Initial fetch
        });
    </script>
</x-app-layout>
