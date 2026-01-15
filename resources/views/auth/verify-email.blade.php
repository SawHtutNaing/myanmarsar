<x-guest-layout>
    <div class="mb-4 text-sm text-gray-600">
        {{ __('စာရင်းသွင်း 주셔서 감사합니다! စတင်ခြင်းမပြုမီ၊ ကျွန်ုပ်တို့ထံ အီးမေးလ်ပို့လိုက်သော လင့်ခ်ကိုနှိပ်ခြင်းဖြင့် သင့်အီးမေးလ်လိပ်စာကို အတည်ပြုပေးနိုင်မလား။ အကယ်၍ သင်သည် အီးမေးလ်ကို လက်ခံမရရှိပါက၊ ကျွန်ုပ်တို့သည် သင့်အား အခြားတစ်ခုကို ဝမ်းမြောက်စွာ ပေးပို့ပါမည်။') }}
    </div>

    @if (session('status') == 'verification-link-sent')
        <div class="mb-4 font-medium text-sm text-green-600">
            {{ __('မှတ်ပုံတင်ခြင်းပြုလုပ်စဉ်က သင် வழங்கிய အီးမေးလ်လိပ်စာသို့ အတည်ပြုလင့်ခ်အသစ်တစ်ခု ပေးပို့လိုက်ပါသည်။') }}
        </div>
    @endif

    <div class="mt-4 flex items-center justify-between">
        <form method="POST" action="{{ route('verification.send') }}">
            @csrf

            <div>
                <x-primary-button>
                    {{ __('အတည်ပြုအီးမေးလ်ကို ပြန်လည်ပို့ပါ။') }}
                </x-primary-button>
            </div>
        </form>

        <form method="POST" action="{{ route('logout') }}">
            @csrf

            <button type="submit" class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                {{ __('ထွက်ရန်') }}
            </button>
        </form>
    </div>
</x-guest-layout>
