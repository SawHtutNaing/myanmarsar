<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit Expense Group') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-md mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-bold mb-4">Edit Expense Group</h3>

                    <form method="POST" action="{{ auth()->user()->hasRole('supplier') ? route('supplier.expense_groups.update', $expenseGroup->id) : route('admin.expense_groups.update', $expenseGroup->id) }}">
                        @csrf
                        @method('PATCH')

                        <!-- Name -->
                        <div>
                            <x-input-label for="name" :value="__('Group Name')" />
                            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name', $expenseGroup->name)" required autofocus />
                            <x-input-error :messages="$errors->get('name')" class="mt-2" />
                        </div>

                        <!-- Type -->
                        <div class="mt-4">
                            <x-input-label for="type" :value="__('Type')" />
                            @if(auth()->user()->hasRole('admin'))
                                <select name="type" id="type" class="block mt-1 w-full">
                                    <option value="restaurant" @if($expenseGroup->type == 'restaurant') selected @endif>Restaurant</option>
                                    <option value="kitchen" @if($expenseGroup->type == 'kitchen') selected @endif>Kitchen</option>
                                </select>
                            @else
                                <input type="hidden" name="type" value="kitchen">
                                <p>{{ ucfirst($expenseGroup->type) }}</p>
                            @endif
                        </div>

                        <div class="flex items-center justify-end mt-4">
                            <x-primary-button class="ml-4">
                                {{ __('Update Group') }}
                            </x-primary-button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
