<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ပါဝင်ပစ္စည်း တင်သွင်းမှုကို တည်းဖြတ်ပါ။') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <form action="{{ route('admin.ingredient-imports.update', $ingredientImport->id) }}" method="POST">
                        @csrf
                        @method('PUT')

                        <div class="mb-4">
                            <label for="ingredient_id" class="block text-sm font-medium text-gray-700">ပါဝင်ပစ္စည်း</label>
                            <select name="ingredient_id" id="ingredient_id" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                                @foreach($ingredients as $ingredient)
                                    <option value="{{ $ingredient->id }}" {{ $ingredientImport->ingredient_id == $ingredient->id ? 'selected' : '' }}>
                                        {{ $ingredient->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-4">
                            <label for="quantity" class="block text-sm font-medium text-gray-700">ပမာဏ</label>
                            <input type="number" name="quantity" id="quantity" value="{{ old('quantity', $ingredientImport->quantity) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                        </div>

                        <div class="mb-4">
                            <label for="unit_price" class="block text-sm font-medium text-gray-700">ယူနစ်စျေးနှုန်း</label>
                            <input type="number" step="0.01" name="unit_price" id="unit_price" value="{{ old('unit_price', $ingredientImport->unit_price) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                        </div>

                        <div class="mb-4">
                            <label for="date" class="block text-sm font-medium text-gray-700">ရက်စွဲ</label>
                            <input type="date" name="date" id="date" value="{{ old('date', $ingredientImport->date->format('Y-m-d')) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm" required>
                        </div>

                        <div class="mb-4">
                            <label for="time" class="block text-sm font-medium text-gray-700">အချိန်</label>
                            <input type="time" name="time" id="time" value="{{ old('time', $ingredientImport->time ? $ingredientImport->time->format('H:i') : '') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                        </div>

                        <div class="flex items-center justify-end mt-4">
                            <button type="submit" class="ml-4 inline-flex items-center px-4 py-2 bg-blue-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-blue-700 active:bg-blue-900 focus:outline-none focus:border-blue-900 focus:ring ring-blue-300 disabled:opacity-25 transition ease-in-out duration-150">
                                {{ __('အပ်ဒိတ်လုပ်ပါ') }}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>