<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ကုန်ကျစရိတ်အသေးစိတ်ကို တည်းဖြတ်ပါ။') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-md mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">ကုန်ကျစရိတ်အသေးစိတ်ကို တည်းဖြတ်ပါ။</h3>

                    <form method="POST" action="{{ auth()->user()->hasRole('supplier') ? route('supplier.expense_details.update', $expenseDetail->id) : route('admin.expense_details.update', $expenseDetail->id) }}">
                        @csrf
                        @method('PATCH')

                        <!-- Expense Group -->
                        <div class="mb-4">
                            <x-input-label for="expense_group_id" :value="__('ကုန်ကျစရိတ်အုပ်စု')" />
                            <select id="expense_group_id" name="expense_group_id" class="block mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm" required>
                                <option value="">အုပ်စုတစ်ခုကို ရွေးချယ်ပါ</option>
                                @foreach ($expenseGroups as $group)
                                    <option value="{{ $group->id }}" {{ old('expense_group_id', $expenseDetail->expense_group_id) == $group->id ? 'selected' : '' }}>
                                        {{ $group->name }}
                                    </option>
                                @endforeach
                            </select>
                            <x-input-error :messages="$errors->get('expense_group_id')" class="mt-2" />
                        </div>

                        <!-- Title -->
                        <div class="mb-4">
                            <x-input-label for="title" :value="__('ခေါင်းစဉ်')" />
                            <x-text-input id="title" class="block mt-1 w-full" type="text" name="title" :value="old('title', $expenseDetail->title)" required />
                            <x-input-error :messages="$errors->get('title')" class="mt-2" />
                        </div>

                        <!-- Date -->
                        <div class="mb-4">
                            <x-input-label for="date" :value="__('ရက်စွဲ')" />
                            <x-text-input id="date" class="block mt-1 w-full" type="date" name="date" :value="old('date', $expenseDetail->date->format('Y-m-d'))" required />
                            <x-input-error :messages="$errors->get('date')" class="mt-2" />
                        </div>

                        <!-- Amount -->
                        <div class="mb-4">
                            <x-input-label for="amount" :value="__('ပမာဏ')" />
                            <x-text-input id="amount" class="block mt-1 w-full" type="number" step="0.01" name="amount" :value="old('amount', $expenseDetail->amount)" required />
                            <x-input-error :messages="$errors->get('amount')" class="mt-2" />
                        </div>

                        <div class="flex items-center justify-end mt-4">
                            <x-primary-button class="ml-4">
                                {{ __('ကုန်ကျစရိတ်ကို အပ်ဒိတ်လုပ်ပါ။') }}
                            </x-primary-button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>