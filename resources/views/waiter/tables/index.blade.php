<x-app-layout>
    <x-slot name="header">
        <div class="flex items-center justify-between">
            <h2 class="font-semibold text-2xl text-gray-900">{{ __('Tables') }}</h2>
            <span class="text-sm text-gray-500">{{ count($tables) }} Tables</span>
        </div>
    </x-slot>

    <div class="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-7xl mx-auto">
            @if (session()->has('food_item_ready_notification'))
                <div x-data="{ show: true }" x-show="show" x-transition.leave.duration.500ms
                    class="fixed bottom-4 right-4 bg-green-500 text-white p-4 rounded-lg shadow-lg flex items-center justify-between z-50">
                    <span>{{ session('food_item_ready_notification') }}</span>
                    <button @click="show = false" class="ml-4 text-white hover:text-gray-100 focus:outline-none">
                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                    <script>
                        // Ensure playSound is available in this scope
                        if (typeof playSound === 'function') {
                            playSound();
                        } else {
                            // Fallback if script loads out of order, or playSound not defined globally
                            document.addEventListener('DOMContentLoaded', function() {
                                if (typeof playSound === 'function') {
                                    playSound();
                                } else {
                                    console.error('playSound function not found, cannot play notification sound.');
                                }
                            });
                        }
                    </script>
                </div>
            @endif
            <!-- Header Section -->
            <div class="mb-8">
                <h3 class="text-xl font-bold text-gray-900 mb-2">Table Management</h3>
                <p class="text-gray-600 text-sm">Manage table orders and status</p>
            </div>

            <!-- Status Legend -->
            <div class="mb-8 grid grid-cols-1 sm:grid-cols-3 gap-4">
                <div class="flex items-center gap-3 bg-white rounded-lg p-4 shadow-sm border border-gray-200">
                    <div class="w-4 h-4 bg-green-500 rounded-full"></div>
                    <div>
                        <p class="font-semibold text-gray-900 text-sm">Available</p>
                        <p class="text-gray-600 text-xs">Ready for order</p>
                    </div>
                </div>
                <div class="flex items-center gap-3 bg-white rounded-lg p-4 shadow-sm border border-gray-200">
                    <div class="w-4 h-4 bg-red-500 rounded-full animate-pulse"></div>
                    <div>
                        <p class="font-semibold text-gray-900 text-sm">Occupied</p>
                        <p class="text-gray-600 text-xs">Table in use</p>
                    </div>
                </div>
                <div class="flex items-center gap-3 bg-white rounded-lg p-4 shadow-sm border border-gray-200">
                    <div class="w-4 h-4 bg-amber-500 rounded-full"></div>
                    <div>
                        <p class="font-semibold text-gray-900 text-sm">Reserved</p>
                        <p class="text-gray-600 text-xs">Other status</p>
                    </div>
                </div>
            </div>

            <!-- Table Grid -->
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-3 sm:gap-4">
                @foreach ($tables as $table)
                    <div class="group relative">
                        <!-- Card Background with Status Color -->
                        <div id="table-card-{{ $table->id }}" class="relative bg-white rounded-xl shadow-md hover:shadow-lg transition-all duration-300 overflow-hidden h-full
                            @if($table->status == 'available')
                                border-2 border-green-500 hover:border-green-600
                            @elseif($table->status == 'occupied')
                                border-2 border-red-500 hover:border-red-600
                            @else
                                border-2 border-amber-500 hover:border-amber-600
                            @endif">

                            <!-- Status Indicator Dot -->
                            <div id="table-status-dot-{{ $table->id }}" class="absolute top-3 right-3 w-3 h-3 rounded-full
                                @if($table->status == 'available')
                                    bg-green-500
                                @elseif($table->status == 'occupied')
                                    bg-red-500 animate-pulse
                                @else
                                    bg-amber-500
                                @endif"></div>

                            <!-- Content -->
                            <div class="p-4 sm:p-5 flex flex-col h-full">
                                <!-- Table Number -->
                                <div class="mb-3 sm:mb-4">
                                    <p class="text-3xl sm:text-4xl font-bold text-gray-900">{{ $table->table_number }}</p>
                                    <p class="text-xs text-gray-500 mt-1">Table</p>
                                </div>

                                <!-- Status Badge -->
                                <div class="mb-4 inline-block w-fit">
                                    <span id="table-status-badge-{{ $table->id }}" class="inline-block px-2 py-1 text-xs font-semibold rounded-full
                                        @if($table->status == 'available')
                                            bg-green-100 text-green-800
                                        @elseif($table->status == 'occupied')
                                            bg-red-100 text-red-800
                                        @else
                                            bg-amber-100 text-amber-800
                                        @endif">
                                        {{ ucfirst($table->status) }}
                                    </span>
                                </div>

                                <!-- Actions -->
                                <div id="table-actions-{{ $table->id }}" class="space-y-2 flex-1 flex flex-col justify-end">
                                    @if($table->status == 'available')
                                        <a href="{{ route('waiter.orders.create') }}?table_number={{ $table->table_number }}"
                                            class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-white bg-green-600 hover:bg-green-700 rounded-lg transition-colors duration-200">
                                            Place Order
                                        </a>
                                    @endif

                                    @if($table->status == 'occupied')
                                        <a href="{{ route('waiter.orders.add-to-current') }}?table_number={{ $table->table_number }}"
                                            class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors duration-200">
                                            Add Order
                                        </a>
                                        @if($table->orders->isNotEmpty())
                                            @php
                                                $latestOrder = $table->orders->first();
                                            @endphp
                                            <div id="latest-order-summary-{{ $table->id }}" class="mt-2 p-2 bg-blue-50 border-l-4 border-blue-400 text-blue-800 text-xs rounded-r">
                                                <p class="font-bold">Latest Order #{{ $latestOrder->id }} ({{ ucfirst($latestOrder->status) }})</p>
                                                <ul class="list-disc list-inside mt-1">
                                                    @foreach($latestOrder->orderItems as $item)
                                                        <li>{{ $item->quantity }}x {{ $item->foodItem->name }}</li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        @endif
                                    @endif

                                    <a href="{{ route('waiter.tables.show', $table->id) }}"
                                        class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-gray-700 bg-gray-200 hover:bg-gray-300 rounded-lg transition-colors duration-200">
                                        View Orders
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <!-- Empty State -->
            @if(count($tables) == 0)
                <div class="flex flex-col items-center justify-center py-12">
                    <div class="text-center">
                        <p class="text-gray-500 text-lg font-medium">No tables available</p>
                        <p class="text-gray-400 text-sm mt-2">Please configure tables first</p>
                    </div>
                </div>
            @endif
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let previousTableStatuses = {}; // Store previous full table objects for comparison
            let notifiedOrdersForWaiter = new Set(); // To track completed orders for sound notification
            let audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            let audioEnabled = false;

            function ucfirst(string) {
                return string.charAt(0).toUpperCase() + string.slice(1);
            }

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

            function fetchTableData() {
                fetch('{{ route('waiter.tables.fetch-statuses') }}')
                    .then(response => response.json())
                    .then(data => { // Change 'tables' to 'data' to destructure
                        const tables = data.tables;
                        const notifications = data.notifications;

                        // --- Process Notifications ---
                        if (notifications && (notifications.food_item_ready || notifications.order_complete)) {
                            playSound(); // Play sound for any notification

                            let notificationMessage = '';
                            let notificationTypeClass = ''; // For distinct styling

                            if (notifications.food_item_ready) {
                                notificationMessage = notifications.food_item_ready.message;
                                notificationTypeClass = 'bg-green-500'; // Green for item ready
                            } else if (notifications.order_complete) {
                                notificationMessage = notifications.order_complete.message;
                                notificationTypeClass = 'bg-blue-500'; // Blue for order complete
                            }

                            if (notificationMessage) {
                                const notificationContainer = document.getElementById('waiter-notification-container');
                                if (!notificationContainer) {
                                    // Create a container if it doesn't exist
                                    const body = document.querySelector('body');
                                    const newContainer = document.createElement('div');
                                    newContainer.id = 'waiter-notification-container';
                                    body.appendChild(newContainer);
                                }
                                // Use Alpine.js to create a new notification div
                                const notificationDiv = document.createElement('div');
                                notificationDiv.setAttribute('x-data', '{ show: true }');
                                notificationDiv.setAttribute('x-show', 'show');
                                notificationDiv.setAttribute('x-transition:leave.duration.500ms', '');
                                notificationDiv.className = `fixed bottom-4 right-4 ${notificationTypeClass} text-white p-4 rounded-lg shadow-lg flex items-center justify-between z-50`;
                                notificationDiv.innerHTML = `
                                    <span>${notificationMessage}</span>
                                    <button @click="show = false" class="ml-4 text-white hover:text-gray-100 focus:outline-none">
                                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                        </svg>
                                    </button>
                                `;
                                document.getElementById('waiter-notification-container').appendChild(notificationDiv);

                                // Automatically dismiss after some time (e.g., 5 seconds)
                                setTimeout(() => {
                                    notificationDiv.remove();
                                }, 5000);
                            }
                        }
                        // --- End Process Notifications ---

                        tables.forEach(table => {
                            const tableCard = document.getElementById(`table-card-${table.id}`);
                            if (!tableCard) return; // Skip if card not found (e.g., table removed)

                            const oldTableState = previousTableStatuses[table.id]; // Get previous full object

                            // --- Sound notification logic for order completion ---
                            if (table.latest_order && oldTableState && oldTableState.latest_order) {
                                const oldOrderStatus = oldTableState.latest_order.status;
                                const newOrderStatus = table.latest_order.status;
                                const orderId = table.latest_order.id;

                                if ((oldOrderStatus === 'pending' || oldOrderStatus === 'preparing') &&
                                    newOrderStatus === 'served' &&
                                    !notifiedOrdersForWaiter.has(orderId)) {
                                    // playSound(); // Sound is now handled by the generic notification above
                                    notifiedOrdersForWaiter.add(orderId); // Mark as notified
                                }
                            }
                            // --- End sound notification logic ---

                            // Update previous status for next poll cycle
                            previousTableStatuses[table.id] = table; // Store the new full table object

                            const newStatus = table.status;

                            // Update UI elements
                            // Update status dot
                            const statusDot = document.getElementById(`table-status-dot-${table.id}`);
                            if (statusDot) {
                                statusDot.className = `absolute top-3 right-3 w-3 h-3 rounded-full ${
                                    newStatus === 'available' ? 'bg-green-500' :
                                    newStatus === 'occupied' ? 'bg-red-500 animate-pulse' :
                                    'bg-amber-500'
                                }`;
                            }

                            // Update status badge
                            const statusBadge = document.getElementById(`table-status-badge-${table.id}`);
                            if (statusBadge) {
                                statusBadge.className = `inline-block px-2 py-1 text-xs font-semibold rounded-full ${
                                    newStatus === 'available' ? 'bg-green-100 text-green-800' :
                                    newStatus === 'occupied' ? 'bg-red-100 text-red-800' :
                                    'bg-amber-100 text-amber-800'
                                }`;
                                statusBadge.textContent = ucfirst(newStatus);
                            }

                            // Update card border color
                            if (tableCard) {
                                tableCard.className = `relative bg-white rounded-xl shadow-md hover:shadow-lg transition-all duration-300 overflow-hidden h-full ${
                                    newStatus === 'available' ? 'border-2 border-green-500 hover:border-green-600' :
                                    newStatus === 'occupied' ? 'border-2 border-red-500 hover:border-red-600' :
                                    'border-2 border-amber-500 hover:border-amber-600'
                                }`;
                            }

                            // Update action buttons and order summary
                            const tableActionsDiv = document.getElementById(`table-actions-${table.id}`);

                            let actionsHtml = '';
                            if (newStatus === 'available') {
                                actionsHtml += `
                                    <a href="/waiter/orders/create?table_number=${table.table_number}"
                                        class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-white bg-green-600 hover:bg-green-700 rounded-lg transition-colors duration-200">
                                        Place Order
                                    </a>
                                `;
                            } else if (newStatus === 'occupied') {
                                actionsHtml += `
                                    <a href="/waiter/orders/add-to-current?table_number=${table.table_number}"
                                        class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors duration-200">
                                        Add Order
                                    </a>
                                `;
                                if (table.latest_order) {
                                    // Order items are not fetched by fetchTableStatuses, so we just show order ID and status
                                    actionsHtml += `
                                        <div id="latest-order-summary-${table.id}" class="mt-2 p-2 bg-blue-50 border-l-4 border-blue-400 text-blue-800 text-xs rounded-r" style="display: block;">
                                            <p class="font-bold">Latest Order # ${table.latest_order.id} (${ucfirst(table.latest_order.status)})</p>
                                            <ul class="list-disc list-inside mt-1">
                                                <!-- Order items not available from fetchTableStatuses -->
                                            </ul>
                                        </div>
                                    `;
                                } else {
                                     actionsHtml += `<div id="latest-order-summary-${table.id}" style="display: none;"></div>`;
                                }
                            }
                            actionsHtml += `
                                <a href="/waiter/tables/${table.id}"
                                    class="block w-full text-center px-3 py-2 text-xs sm:text-sm font-semibold text-gray-700 bg-gray-200 hover:bg-gray-300 rounded-lg transition-colors duration-200">
                                    View Orders
                                </a>
                            `;
                            if (tableActionsDiv) {
                                tableActionsDiv.innerHTML = actionsHtml;
                            }
                        });
                    });
            }

            // Initial fetch to populate previousTableStatuses and update UI
            fetch('{{ route('waiter.tables.fetch-statuses') }}')
                .then(response => response.json())
                .then(data => { // Change 'tables' to 'data' to destructure
                    const tables = data.tables;
                    tables.forEach(table => {
                        previousTableStatuses[table.id] = table; // Store the full table object initially
                    });
                    // Start polling after initial state is set
                    setInterval(fetchTableData, 5000); // Poll every 5 seconds
                });
        });
    </script>

</x-app-layout>
