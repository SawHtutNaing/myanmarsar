<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အော်ဒါတင်ပါ။') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <form action="{{ route('waiter.orders.store') }}" method="POST">
                        @csrf
                        <input type="hidden" name="table_number" value="{{ $table_number ?? '' }}">
                        <div class="mb-4">
                            <label for="table_number" class="block text-sm font-medium text-gray-700">စားပွဲနံပါတ်</label>
                            <input type="number" name="table_number" id="table_number" value="{{ $table_number ?? '' }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700">အစားအစာများ (တစ်ခုစီအတွက် ပမာဏထည့်ပါ)</label>
                            @foreach ($fooditems as $fooditem)
                                <div class="flex items-center mb-2">
                                    <input type="number" name="items[{{ $fooditem->id }}]" id="qty_{{ $fooditem->id }}" min="0" step="1" class="w-24 mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                                    <label for="qty_{{ $fooditem->id }}" class="ml-2 text-sm text-gray-700">{{ $fooditem->name }} (${{ number_format($fooditem->price, 2) }})</label>
                                </div>
                            @endforeach
                        </div>
                        <div>
                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                အော်ဒါတင်ပါ။
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>