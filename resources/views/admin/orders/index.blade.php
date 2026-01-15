<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အော်ဒါစီမံခန့်ခွဲမှု') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if (session('success'))
                <div class="mb-4 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                    <span class="block sm:inline">{{ session('success') }}</span>
                </div>
            @endif
            @if (session('error'))
                <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                    <span class="block sm:inline">{{ session('error') }}</span>
                </div>
            @endif

            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">အော်ဒါအားလုံး</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        အော်ဒါအသေးစိတ်
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        စုစုပေါင်းစျေးနှုန်း
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        အော်ဒါအခြေအနေ
                                    </th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        လုပ်ဆောင်ချက်များ
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                @foreach ($orders as $order)
                                    <tr class="bg-gray-100">
                                        <td colspan="4" class="px-6 py-4 whitespace-nowrap text-lg font-semibold flex justify-between items-center">
                                            <span>
                                                အော်ဒါ #{{ $order->id }} (စားပွဲ: {{ $order->table->table_number ?? 'N/A' }}, စားပွဲထိုး: {{ $order->user->name ?? 'ဧည့်သည်' }})
                                                @if ($order->remark)
                                                    <p class="text-sm text-gray-500">မှတ်ချက်: {{ $order->remark }}</p>
                                                @endif
                                            </span>
                                            @if ($order->status !== 'cancelled' && $order->status !== 'completed')
                                                <form action="{{ route('admin.orders.cancel', $order->id) }}" method="POST" onsubmit="return confirm('ဤဘေလ်တစ်ခုလုံးကို ဖျက်သိမ်းရန် သေချာပါသလား။ ၎င်းသည် ဤအော်ဒါအတွက် ပါဝင်ပစ္စည်းများအားလုံးကို ပြန်လည်ဖြည့်တင်းပါမည်။');">
                                                    @csrf
                                                    @method('PATCH')
                                                    <x-danger-button>
                                                        ဘေလ်ကို ဖျက်ပါ။
                                                    </x-danger-button>
                                                </form>
                                            @endif
                                        </td>
                                    </tr>
                                    @foreach ($order->orderItems as $orderItem)
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap pl-8">
                                                {{ $orderItem->foodItem->name }} (x{{ $orderItem->quantity }})
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                ${{ number_format($orderItem->price, 2) }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                {{ ucfirst($orderItem->status) }}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                @if ($orderItem->status == 'pending')
                                                    <form action="{{ route('admin.order_items.cancel', $orderItem->id) }}" method="POST" onsubmit="return confirm('ဤပစ္စည်းကို ဖျက်သိမ်းရန် သေချာပါသလား။ ၎င်းသည် ပါဝင်ပစ္စည်းများကို ပြန်လည်ဖြည့်တင်းပါမည်။');">
                                                        @csrf
                                                        @method('PATCH')
                                                        <x-danger-button>
                                                            ပစ္စည်းကို ဖျက်ပါ။
                                                        </x-danger-button>
                                                    </form>
                                                @else
                                                    <span class="text-gray-500">{{ ucfirst($orderItem->status) }}</span>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                    <tr class="border-b border-gray-200">
                                        <td colspan="4" class="p-2"></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4">
                        {{ $orders->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>