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

                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-bold">ပါဝင်ပစ္စည်းစာရင်း</h3>
                        <a href="{{ route('admin.ingredients.create') }}"
                           class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            + အသစ်ထည့်ပါ
                        </a>
                    </div>

                    @if(session('success'))
                        <div class="mb-4 p-3 bg-green-100 text-green-800 rounded">
                            {{ session('success') }}
                        </div>
                    @endif

                    <p class="text-sm text-gray-500 mb-3">
                        ☰ အတန်းများကို ဆွဲ‌ဖြင့် အစီအစဉ်ပြောင်းနိုင်သည်။
                    </p>

                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">#</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">အမည်</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ယူနစ်</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ပမာဏ</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ယူနစ်စျေးနှုန်း</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">သတိပေးပမာဏ</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">လုပ်ဆောင်ချက်</th>
                                </tr>
                            </thead>
                            <tbody id="sortable-tbody" class="bg-white divide-y divide-gray-200">
                                @foreach($ingredients as $ingredient)
                                    <tr data-id="{{ $ingredient->id }}" class="cursor-grab hover:bg-gray-50">
                                        <td class="px-3 py-4 text-gray-400 drag-handle select-none">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none"
                                                 viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                      d="M4 6h16M4 12h16M4 18h16"/>
                                            </svg>
                                            <span class="ml-1 text-xs text-gray-400">{{ $ingredient->sort_no }}</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $ingredient->name }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $ingredient->unit }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $ingredient->quantity }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${{ number_format($ingredient->unit_price, 2) }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ $ingredient->low_stock_alert_quantity ?? '-' }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm flex space-x-2">
                                            <a href="{{ route('admin.ingredients.edit', $ingredient->id) }}"
                                               class="text-blue-600 hover:text-blue-900">တည်းဖြတ်</a>
                                            <form action="{{ route('admin.ingredients.destroy', $ingredient->id) }}"
                                                  method="POST"
                                                  onsubmit="return confirm('ဖျက်ပစ်ရန် သေချာပါသလား?')">
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

                </div>
            </div>
        </div>
    </div>

    {{-- SortableJS CDN --}}
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>
    <script>
        const tbody = document.getElementById('sortable-tbody');

        Sortable.create(tbody, {
            animation: 150,
            handle: '.drag-handle',
            ghostClass: 'bg-blue-50',
            onEnd: function () {
                const rows = tbody.querySelectorAll('tr[data-id]');
                const order = Array.from(rows).map(row => parseInt(row.dataset.id));

                fetch('{{ route('admin.ingredients.reorder') }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    },
                    body: JSON.stringify({ order }),
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        // Update displayed sort numbers
                        rows.forEach((row, idx) => {
                            const badge = row.querySelector('.drag-handle span');
                            if (badge) badge.textContent = idx + 1;
                        });
                    }
                })
                .catch(err => console.error('Sort save failed', err));
            }
        });
    </script>
</x-app-layout>
