<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('စားပွဲဘေလ်ထုတ် မှတ်တမ်းများ') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">ဘေလ်ထုတ် မှတ်တမ်းများကို စစ်ထုတ်ပါ။</h3>
                    <form method="GET" action="{{ route('admin.reports.table_bill_outs.index') }}">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label for="date_from" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲမှ</label>
                                <input type="date" id="date_from" name="date_from" value="{{ $dateFrom }}" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div>
                                <label for="date_to" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲအထိ</label>
                                <input type="date" id="date_to" name="date_to" value="{{ $dateTo }}" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div class="flex items-end gap-2">
                                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                                    စစ်ထုတ်ပါ။
                                </button>
                                <a href="{{ route('admin.reports.table_bill_outs.index') }}" class="px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
                                    ပြန်လည်စတင်ပါ
                                </a>
                            </div>
                        </div>
                    </form>

                    <div class="mt-6">
                        <h3 class="text-lg font-bold">စုစုပေါင်း ဘေလ်ထုတ်ငွေ: ${{ number_format($totalAmount, 2) }}</h3>
                    </div>

                    <h3 class="text-lg font-bold mb-4 mt-6">စားပွဲဘေလ်ထုတ် မှတ်တမ်းသမိုင်း</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        ဘေလ်ထုတ်ခဲ့သည့်အချိန်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        စားပွဲထိုး
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        စားပွဲနံပါတ်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        အော်ဒါအမှတ်စဉ်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        စုစုပေါင်းငွေ
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach ($billOutRecords as $record)
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            {{ $record->billed_at }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            {{ $record->user->name ?? 'N/A' }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            {{ $record->table->table_number ?? 'N/A' }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            {{ $record->order->id ?? 'N/A' }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            ${{ number_format($record->total_money, 2) }}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4">
                        {{ $billOutRecords->appends(request()->query())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>