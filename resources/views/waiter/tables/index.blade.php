<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Tables') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">Table Status</h3>
                    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                        @foreach ($tables as $table)
                            <div class="p-4 border rounded-lg text-center
                               @if($table->status == 'available') bg-green-200
                               @elseif($table->status == 'occupied') bg-red-200
                               @else bg-yellow-200 @endif">
                                <p class="text-2xl font-bold">{{ $table->table_number }}</p>
                                <p>{{ ucfirst($table->status) }}</p>
                                @if($table->status == 'available')
                                    <a href="{{ route('waiter.orders.create') }}?table_number={{ $table->table_number }}" class="text-sm text-blue-500 hover:underline">Place Order</a>
                                @else
                                    <a href="{{ route('waiter.tables.show', $table->id) }}" class="text-sm text-blue-500 hover:underline">View Orders</a>
                                @endif
                            </div>
                        @endforeach
                    </div>
                    <div class="mt-4">
                        <h4 class="text-md font-bold mb-2">Legend:</h4>
                        <p class="text-green-700">Green: Available (click to place order)</p>
                        <p class="text-red-700">Red: Occupied (click to view orders)</p>
                        <p class="text-yellow-700">Yellow: Other (e.g., Reserved; click to view orders)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
