<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ကုန်ကျစရိတ်အသေးစိတ်') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if (session('success'))
                <div class="mb-4 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                    {{ session('success') }}
                </div>
            @endif
            @if (session('error'))
                <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                    {{ session('error') }}
                </div>
            @endif

            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-bold">ကုန်ကျစရိတ်အသေးစိတ်များကို စီမံခန့်ခွဲပါ။</h3>
                        <a href="{{ auth()->user()->hasRole('supplier') ? route('supplier.expense_details.create') : route('admin.expense_details.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            ကုန်ကျစရိတ်အသစ်ထည့်ပါ။
                        </a>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        အမှတ်စဉ်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        အုပ်စု
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        ခေါင်းစဉ်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        ရက်စွဲ
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        ပမာဏ
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        လုပ်ဆောင်ချက်များ
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach ($expenseDetails as $expense)
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap">{{ $expense->id }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap">{{ $expense->expenseGroup->name ?? 'N/A' }} ({{ $expense->expenseGroup->type }}) </td>
                                        <td class="px-6 py-4 whitespace-nowrap">{{ $expense->title }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap">{{ $expense->date->format('Y-m-d') }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap">${{ number_format($expense->amount, 2) }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <a href="{{ auth()->user()->hasRole('supplier') ? route('supplier.expense_details.edit', $expense->id) : route('admin.expense_details.edit', $expense->id) }}" class="text-indigo-600 hover:text-indigo-900 mr-3">တည်းဖြတ်ရန်</a>
                                            <form action="{{ auth()->user()->hasRole('supplier') ? route('supplier.expense_details.destroy', $expense->id) : route('admin.expense_details.destroy', $expense->id) }}" method="POST" class="inline-block" onsubmit="return confirm('ဤကုန်ကျစရိတ်အသေးစိတ်ကို ဖျက်ပစ်ရန် သေချာပါသလား။');">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="text-red-600 hover:text-red-900">ဖျက်ပစ်ပါ</button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4">
                        {{ $expenseDetails->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>