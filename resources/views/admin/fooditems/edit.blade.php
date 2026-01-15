<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('အစားအစာကို တည်းဖြတ်ပါ။') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <form action="{{ route('admin.fooditems.update', $fooditem->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="mb-4">
                            <label for="name" class="block text-sm font-medium text-gray-700">အမည်</label>
                            <input type="text" name="name" id="name" value="{{ $fooditem->name }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                        </div>
                        <div class="mb-4">
                            <label for="price" class="block text-sm font-medium text-gray-700">စျေးနှုန်း</label>
                            <input type="number" step="0.01" name="price" id="price" value="{{ $fooditem->price }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                        </div>
                        <div class="mb-4">
                            <label for="quantity" class="block text-sm font-medium text-gray-700">ပမာဏ</label>
                            <input type="number" name="quantity" id="quantity" value="{{ $fooditem->quantity }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                        </div>
                        <div class="mb-4">
                            <label for="description" class="block text-sm font-medium text-gray-700">ဖော်ပြချက်</label>
                            <textarea name="description" id="description" rows="3" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">{{ $fooditem->description }}</textarea>
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700">ပါဝင်ပစ္စည်းများ (အသုံးပြုသည့်ပမာဏကို ထည့်ပါ)</label>
                            @php
                                $currentQuantities = $fooditem->ingredients->pluck('pivot.quantity', 'id')->toArray();
                            @endphp
                            @foreach ($ingredients as $ingredient)
                                <div class="flex items-center mb-2">
                                    <input type="number" name="ingredient_quantities[{{ $ingredient->id }}]" id="qty_{{ $ingredient->id }}" value="{{ $currentQuantities[$ingredient->id] ?? '' }}" min="0" step="0.01" class="w-24 mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50">
                                    <label for="qty_{{ $ingredient->id }}" class="ml-2 text-sm text-gray-700">{{ $ingredient->name }} ({{ $ingredient->unit }})</label>
                                </div>
                            @endforeach
                        </div>
                        <div>
                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                အပ်ဒိတ်လုပ်ပါ
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>