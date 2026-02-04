<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ပါဝင်ပစ္စည်းများ') }}
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

                    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
                        <h3 class="text-lg font-bold">ပါဝင်ပစ္စည်းစာရင်း</h3>
                        <div class="flex flex-wrap gap-2">
                            <a href="{{ route('admin.ingredients.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded transition">
                                ပါဝင်ပစ္စည်းထည့်ပါ။
                            </a>
                            @if(auth()->user()->hasRole('supplier'))
                                <a href="{{ route('supplier.ingredients.import.create') }}" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded transition">
                                    ပါဝင်ပစ္စည်းများ တင်သွင်းပါ။
                                </a>
                            @endif
                        </div>
                    </div>

                    <div class="w-full overflow-x-auto border border-gray-200 rounded-lg">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">အမည်</th>
                                    <th scope="col" class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ယူနစ်</th>
                                    <th scope="col" class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ပမာဏ</th>
                                    <th scope="col" class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ယူနစ်စျေးနှုန်း</th>
                                    <th scope="col" class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">သတိပေးချက်</th>
                                    <th scope="col" class="relative px-4 py-3">
                                        <span class="sr-only">တည်းဖြတ်ရန်</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach ($ingredients as $ingredient)
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-4 py-4 whitespace-nowrap text-sm">{{ $ingredient->name }}</td>
                                        <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-600">{{ $ingredient->unit }}</td>
                                        <td class="px-4 py-4 whitespace-nowrap text-sm font-medium">{{ $ingredient->quantity }}</td>
                                        <td class="px-4 py-4 whitespace-nowrap text-sm">{{ $ingredient->unit_price }}</td>
                                        <td class="px-4 py-4 whitespace-nowrap text-sm">
                                            <span class="{{ $ingredient->quantity <= $ingredient->low_stock_alert_quantity ? 'text-red-600 font-bold' : 'text-gray-500' }}">
                                                {{ $ingredient->low_stock_alert_quantity }}
                                            </span>
                                        </td>
                                        <td class="px-4 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <div class="flex justify-end gap-3">
                                                <a href="{{ route('admin.ingredients.edit', $ingredient->id) }}" class="text-indigo-600 hover:text-indigo-900">တည်းဖြတ်ရန်</a>
                                                <form action="{{ route('admin.ingredients.destroy', $ingredient->id) }}" method="POST" class="inline" onsubmit="return confirm('ဖျက်မှာ သေချာပါသလား?');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="text-red-600 hover:text-red-900">ဖျက်ပစ်ပါ</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    </div>
            </div>
        </div>
    </div>
</x-app-layout>
