<x-app-layout>
    <x-slot name="header">
        <div class="flex items-center justify-between">
            <h2 class="font-semibold text-2xl text-gray-900">{{ __('Tables') }}</h2>
            <span class="text-sm text-gray-500">{{ count($tables) }} Tables</span>
        </div>
    </x-slot>

    <div class="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-7xl mx-auto">
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
                        <div class="relative bg-white rounded-xl shadow-md hover:shadow-lg transition-all duration-300 overflow-hidden h-full
                            @if($table->status == 'available')
                                border-2 border-green-500 hover:border-green-600
                            @elseif($table->status == 'occupied')
                                border-2 border-red-500 hover:border-red-600
                            @else
                                border-2 border-amber-500 hover:border-amber-600
                            @endif">

                            <!-- Status Indicator Dot -->
                            <div class="absolute top-3 right-3 w-3 h-3 rounded-full
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
                                    <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full
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
                                <div class="space-y-2 flex-1 flex flex-col justify-end">
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
        // Auto-refresh table status every 30 seconds
        document.addEventListener('DOMContentLoaded', function() {
            setInterval(function() {
                location.reload();
            }, 30000);
        });
    </script>

</x-app-layout>
