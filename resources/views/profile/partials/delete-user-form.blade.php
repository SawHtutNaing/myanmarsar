<section class="space-y-6">
    <header>
        <h2 class="text-lg font-medium text-gray-900">
            {{ __('အကောင့်ဖျက်ပါ။') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600">
            {{ __('သင့်အကောင့်ကို ဖျက်လိုက်သည်နှင့် ၎င်း၏ရင်းမြစ်များနှင့် ဒေတာအားလုံး အပြီးတိုင် ဖျက်သွားပါမည်။ သင့်အကောင့်ကို မဖျက်မီ၊ သင်ထိန်းသိမ်းလိုသည့် မည်သည့်ဒေတာ သို့မဟုတ် အချက်အလက်ကိုမဆို ဒေါင်းလုဒ်လုပ်ပါ။') }}
        </p>
    </header>

    <x-danger-button
        x-data=""
        x-on:click.prevent="$dispatch('open-modal', 'confirm-user-deletion')"
    >{{ __('အကောင့်ဖျက်ပါ။') }}</x-danger-button>

    <x-modal name="confirm-user-deletion" :show="$errors->userDeletion->isNotEmpty()" focusable>
        <form method="post" action="{{ route('profile.destroy') }}" class="p-6">
            @csrf
            @method('delete')

            <h2 class="text-lg font-medium text-gray-900">
                {{ __('သင့်အကောင့်ကို ဖျက်ပစ်ရန် သေချာပါသလား။') }}
            </h2>

            <p class="mt-1 text-sm text-gray-600">
                {{ __('သင့်အကောင့်ကို ဖျက်လိုက်သည်နှင့် ၎င်း၏ရင်းမြစ်များနှင့် ဒေတာအားလုံး အပြီးတိုင် ဖျက်သွားပါမည်။ သင့်အကောင့်ကို အပြီးတိုင်ဖျက်ပစ်လိုကြောင်း အတည်ပြုရန် သင်၏စကားဝှက်ကို ထည့်ပါ။') }}
            </p>

            <div class="mt-6">
                <x-input-label for="password" value="{{ __('စကားဝှက်') }}" class="sr-only" />

                <x-text-input
                    id="password"
                    name="password"
                    type="password"
                    class="mt-1 block w-3/4"
                    placeholder="{{ __('စကားဝှက်') }}"
                />

                <x-input-error :messages="$errors->userDeletion->get('password')" class="mt-2" />
            </div>

            <div class="mt-6 flex justify-end">
                <x-secondary-button x-on:click="$dispatch('close')">
                    {{ __('ဖျက်သိမ်းမည်') }}
                </x-secondary-button>

                <x-danger-button class="ms-3">
                    {{ __('အကောင့်ဖျက်ပါ။') }}
                </x-danger-button>
            </div>
        </form>
    </x-modal>
</section>