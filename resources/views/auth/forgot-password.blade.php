<x-guest-layout>
    <div class="mb-4 text-sm text-gray-600">
        {{ __('စကားဝှက်မေ့သွားသလား? ပြဿနာမရှိပါဘူး။ သင့်အီးမေးလ်လိပ်စာကို ကျွန်ုပ်တို့အား အသိပေးပါ၊ သင့်အား စကားဝှက်ပြန်လည်သတ်မှတ်ခြင်းလင့်ခ်ကို အီးမေးလ်ပို့ပေးပါမည်။') }}
    </div>

    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form method="POST" action="{{ route('password.email') }}">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('အီးမေးလ်')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <div class="flex items-center justify-end mt-4">
            <x-primary-button>
                {{ __('စကားဝှက်ပြန်လည်သတ်မှတ်လင့်ခ်ကို အီးမေးလ်ပို့ပါ။') }}
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>
