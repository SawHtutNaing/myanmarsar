<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('စားပွဲထိုး ဒိုင်ခွက်') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    @if (session('success'))
                        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                            <span class="block sm:inline">{{ session('success') }}</span>
                        </div>
                    @endif

                    <h3 class="text-lg font-bold mb-4">စားပွဲထိုး ဒိုင်ခွက်</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <a href="{{ route('waiter.menu') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            မီနူးကို ကြည့်ရှုပါ။
                        </a>
                        <a href="{{ route('waiter.orders.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            အော်ဒါတင်ပါ။
                        </a>
                        <a href="{{ route('waiter.my-orders') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            ကျွန်ုပ်၏ အော်ဒါများ
                        </a>
                        <a href="{{ route('waiter.tables.index') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            စားပွဲများ
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
