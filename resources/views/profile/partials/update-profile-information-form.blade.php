<section>
    <header>
        <h2 class="text-lg font-medium text-gray-900">
            {{ __('ပရိုဖိုင် အချက်အလက်') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600">
            {{ __("သင့်အကောင့်၏ ပရိုဖိုင်အချက်အလက်နှင့် အီးမေးလ်လိပ်စာကို အပ်ဒိတ်လုပ်ပါ။") }}
        </p>
    </header>

    <form id="send-verification" method="post" action="{{ route('verification.send') }}">
        @csrf
    </form>

    <form method="post" action="{{ route('profile.update') }}" class="mt-6 space-y-6">
        @csrf
        @method('patch')

        <div>
            <x-input-label for="name" :value="__('အမည်')" />
            <x-text-input id="name" name="name" type="text" class="mt-1 block w-full" :value="old('name', $user->name)" required autofocus autocomplete="name" />
            <x-input-error class="mt-2" :messages="$errors->get('name')" />
        </div>

        <div>
            <x-input-label for="email" :value="__('အီးမေးလ်')" />
            <x-text-input id="email" name="email" type="email" class="mt-1 block w-full" :value="old('email', $user->email)" required autocomplete="username" />
            <x-input-error class="mt-2" :messages="$errors->get('email')" />

            @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && ! $user->hasVerifiedEmail())
                <div>
                    <p class="text-sm mt-2 text-gray-800">
                        {{ __('သင်၏အီးမေးလ်လိပ်စာကို အတည်မပြုရသေးပါ။') }}

                        <button form="send-verification" class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            {{ __('အတည်ပြုအီးမေးလ်ကို ပြန်လည်ပို့ရန် ဤနေရာကိုနှိပ်ပါ။') }}
                        </button>
                    </p>

                    @if (session('status') === 'verification-link-sent')
                        <p class="mt-2 font-medium text-sm text-green-600">
                            {{ __('သင်၏အီးမေးလ်လိပ်စာသို့ အတည်ပြုလင့်ခ်အသစ်တစ်ခု ပေးပို့လိုက်ပါသည်။') }}
                        </p>
                    @endif
                </div>
            @endif
        </div>

        <div class="flex items-center gap-4">
            <x-primary-button>{{ __('သိမ်းဆည်းပါ') }}</x-primary-button>

            @if (session('status') === 'profile-updated')
                <p
                    x-data="{ show: true }"
                    x-show="show"
                    x-transition
                    x-init="setTimeout(() => show = false, 2000)"
                    class="text-sm text-gray-600"
                >{{ __('သိမ်းဆည်းပြီးပါပြီ။') }}</p>
            @endif
        </div>
    </form>
</section>