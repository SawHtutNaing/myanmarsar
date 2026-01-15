<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ပါဝင်ပစ္စည်း တင်သွင်းမှု အစီရင်ခံစာ') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
              @if($lowStockIngredients->isNotEmpty())
                        <div class="mb-8">
                            <h4 class="text-lg font-bold mb-2 text-red-600">ပစ္စည်းပြတ်လပ်သတိပေးချက်များ</h4>
                            <table class="min-w-full bg-white">
                                <thead>
                                    <tr>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">ပါဝင်ပစ္စည်းအမည်</th>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">လက်ရှိပမာဏ</th>
                                        <th class="py-2 px-4 border-b border-gray-200 bg-red-100 text-left text-sm font-semibold text-gray-700">ပစ္စည်းပြတ်လပ်သတိပေး ပမာဏ</th>
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
                    <h3 class="text-lg font-bold mb-4">ရက်စွဲအလိုက် တင်သွင်းမှုများကို စစ်ထုတ်ပါ။</h3>
                    <form action="{{ route('supplier.reports.ingredient-imports') }}" method="GET" class="mb-6 flex items-end space-x-4">
                        <div>
                            <label for="start_date" class="block text-sm font-medium text-gray-700">စတင်သည့်ရက်စွဲ</label>
                            <input type="date" name="start_date" id="start_date" value="{{ request('start_date') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        </div>
                        <div>
                            <label for="end_date" class="block text-sm font-medium text-gray-700">ပြီးဆုံးသည့်ရက်စွဲ</label>
                            <input type="date" name="end_date" id="end_date" value="{{ request('end_date') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        </div>
                        <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                            စစ်ထုတ်ပါ။
                        </button>
                        <a href="{{ route('supplier.reports.ingredient-imports') }}" class="inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            စစ်ထုတ်မှု ရှင်းလင်းပါ။
                        </a>
                    </form>

                    <h3 class="text-lg font-bold mb-4">ပါဝင်ပစ္စည်း တင်သွင်းမှု မှတ်တမ်းများ</h3>
                    @if($imports->isEmpty())
                        <p>ရွေးချယ်ထားသော ကာလအတွက် ပါဝင်ပစ္စည်း တင်သွင်းမှု မတွေ့ပါ။</p>
                    @else
                      <div class="mt-6 p-4 bg-gray-50 rounded-lg shadow-sm">
                            <p class="text-md font-bold text-gray-800">စုစုပေါင်း တင်သွင်းခဲ့သော ပမာဏ: <span class="text-blue-600">{{ $totalQuantity }}</span></p>
                            <p class="text-md font-bold text-gray-800">စုစုပေါင်း တင်သွင်းမှု ကုန်ကျစရိတ်: <span class="text-red-600">${{ number_format($totalCost, 2) }}</span></p>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ရက်စွဲ
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            အချိန်
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ပါဝင်ပစ္စည်း
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ကုဒ်
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ပမာဏ
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ယူနစ်စျေးနှုန်း
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            စုစုပေါင်းကုန်ကျစရိတ် (ပစ္စည်း)
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            လုပ်ဆောင်ချက်များ
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
                                                <a href="{{ route('supplier.ingredient-imports.edit', $import->id) }}" class="text-blue-600 hover:text-blue-900">တည်းဖြတ်ရန်</a>
                                                {{-- <form action="{{ route('supplier.ingredient-imports.destroy', $import->id) }}" method="POST" onsubmit="return confirm('ဤတင်သွင်းမှုကို ဖျက်ပစ်ရန် သေချာပါသလား။');">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="text-red-600 hover:text-red-900">ဖျက်ပစ်ပါ</button>
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