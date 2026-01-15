<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Ingredient Import Report') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
              @if($lowStockIngredients->isNotEmpty())
                        <div class="mb-8">
                            <h4 class="text-lg font-bold mb-2 text-red-600">Low Stock Alerts</h4>
                            <table class="min-w-full bg-white">
                                <thead>
                                    <tr>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">Ingredient Name</th>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">Current Quantity</th>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">Low Stock Alert Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($lowStockIngredients as $ingredient)
                                        <tr>
                                            <td class="py-2 px-4 border-b border-gray-200">{{ $ingredient->name }}</td>
                                            <td class="py-2 px-4 border-b border-gray-200">{{ $ingredient->quantity }}</td>
                                            <td class="py-2 px-4 border-b border-gray-200">{{ $ingredient->low_stock_alert_quantity }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif

            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">


                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">Filter Imports by Date</h3>
                    <form action="{{ route('supplier.reports.ingredient-imports') }}" method="GET" class="mb-6 flex items-end space-x-4">
                        <div>
                            <label for="start_date" class="block text-sm font-medium text-gray-700">Start Date</label>
                            <input type="date" name="start_date" id="start_date" value="{{ request('start_date') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        </div>
                        <div>
                            <label for="end_date" class="block text-sm font-medium text-gray-700">End Date</label>
                            <input type="date" name="end_date" id="end_date" value="{{ request('end_date') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        </div>
                        <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                            Filter
                        </button>
                        <a href="{{ route('supplier.reports.ingredient-imports') }}" class="inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Clear Filter
                        </a>
                    </form>

                    <h3 class="text-lg font-bold mb-4">Ingredient Import Records</h3>
                    @if($imports->isEmpty())
                        <p>No ingredient imports found for the selected period.</p>
                    @else
                      <div class="mt-6 p-4 bg-gray-50 rounded-lg shadow-sm">
                            <p class="text-md font-bold text-gray-800">Total Imported Quantity: <span class="text-blue-600">{{ $totalQuantity }}</span></p>
                            <p class="text-md font-bold text-gray-800">Total Import Cost: <span class="text-red-600">${{ number_format($totalCost, 2) }}</span></p>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Date
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Time
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Ingredient
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Code
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Quantity
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Unit Price
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Total Cost (Item)
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Actions
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    @foreach($imports as $import)
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {{ $import->date->format('Y-m-d') }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {{ $import->time ? $import->time->format('H:i') : '' }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {{ $import->ingredient->name }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {{ $import->code }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {{ $import->quantity }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                ${{ number_format($import->unit_price, 2) }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                ${{ number_format($import->quantity * $import->unit_price, 2) }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 flex space-x-2">
                                                <a href="{{ route('supplier.ingredient-imports.edit', $import->id) }}" class="text-blue-600 hover:text-blue-900">Edit</a>
                                                {{-- <form action="{{ route('supplier.ingredient-imports.destroy', $import->id) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this import?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="text-red-600 hover:text-red-900">Delete</button>
                                                </form> --}}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>


                    @endif
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
