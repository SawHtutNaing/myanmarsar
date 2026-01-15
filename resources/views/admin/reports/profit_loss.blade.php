<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အမြတ်နှင့်အရှုံး အစီရင်ခံစာ') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <form action="{{ route('admin.reports.profit_loss') }}" method="GET" class="mb-4">
                        <div class="flex items-center space-x-4">
                            <div>
                                <label for="start_date" class="block text-sm font-medium text-gray-700">စတင်သည့်ရက်စွဲ</label>
                                <input type="date" id="start_date" name="start_date" value="{{ request('start_date') }}" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                            </div>
                            <div>
                                <label for="end_date" class="block text-sm font-medium text-gray-700">ပြီးဆုံးသည့်ရက်စွဲ</label>
                                <input type="date" id="end_date" name="end_date" value="{{ request('end_date') }}" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                            </div>
                            <div>
                                <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 mt-5">
                                    စစ်ထုတ်ပါ။
                                </button>
                            </div>
                        </div>
                    </form>
                    <h3 class="text-lg font-bold mb-4">အမြတ်နှင့်အရှုံး အစီရင်ခံစာ</h3>
                    <div class="mb-4">
                        <strong>စုစုပေါင်းဝင်ငွေ: ${{ number_format($totalRevenue, 2) }}</strong>
                    </div>
                    <div class="mb-4">
                        <strong>ရောင်းကုန် စုစုပေါင်းကုန်ကျစရိတ်: ${{ number_format($totalCost, 2) }}</strong>
                    </div>
                    <div class="mb-4">
                        <strong>စုစုပေါင်းကုန်ကျစရိတ်: ${{ number_format($totalExpenses, 2) }}</strong>
                    </div>
                    <div class="mb-4">
                        <strong>အမြတ်: ${{ number_format($profit, 2) }}</strong>
                    </div>

                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    အော်ဒါအမှတ်စဉ်
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    စုစုပေါင်းစျေးနှုန်း
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    ကုန်ကျစရိတ်
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    အမြတ်
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach ($completedOrders as $order)
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap">{{ $order->id }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">${{ number_format($order->total_price, 2) }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">${{ number_format($order->orderItems->sum('cost'), 2) }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">${{ number_format($order->total_price - $order->orderItems->sum('cost'), 2) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>