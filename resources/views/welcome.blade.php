<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Styles -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        <style>
            /* Custom styles if needed */
            .hero-bg {
                background-image: url('/images/hero-bg.jpg'); /* Example background image */
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body class="antialiased font-sans bg-gray-100">
        <div class="min-h-screen flex flex-col">
            <!-- Navigation -->
            <nav class="bg-white shadow-md">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div class="flex justify-between h-16">
                        <div class="flex-shrink-0 flex items-center">
                            <a href="{{ url('/') }}">
                                <img src="{{ asset('logo.jpg') }}" alt="Logo" class="block h-9 w-auto">
                            </a>
                        </div>
                        <div class="flex items-center">
                            @if (Route::has('login'))
                                <div class="space-x-4">
                                    @auth
                                        @if(Auth::user()->hasRole('admin'))
                                            <a href="{{ route('admin.dashboard') }}" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">ဒိုင်ခွက်</a>
                                        @elseif(Auth::user()->hasRole('waiter'))
                                            <a href="{{ route('waiter.dashboard') }}" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">ဒိုင်ခွက်</a>
                                        @elseif(Auth::user()->hasRole('kitchen'))
                                            <a href="{{ route('kitchen.dashboard') }}" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">ဒိုင်ခွက်</a>
                                        @elseif(Auth::user()->hasRole('supplier'))
                                            <a href="{{ route('supplier.ingredients.import.create') }}" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">ဒိုင်ခွက်</a>
                                        @endif
                                    @else
                                        <a href="{{ route('login') }}" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">လော့ဂ်အင်</a>
                                    @endauth
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Hero Section -->
            <header class="flex-1 flex items-center justify-center text-center py-20 px-4 bg-gray-50">
                <div class="max-w-3xl mx-auto">
                    <img src="{{ asset('logo.jpg') }}" alt="Company Logo" class="mx-auto h-24 sm:h-32 mb-6">
                    <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-gray-900 leading-tight mb-4">
                        ကျွန်ုပ်တို့၏ စားသောက်ဆိုင် စီမံခန့်ခွဲမှုစနစ်မှ ကြိုဆိုပါတယ်။
                    </h1>
                    <p class="text-lg sm:text-xl text-gray-600 mb-8">
                        သင်၏လုပ်ငန်းဆောင်တာများကို ချောမွေ့စေခြင်း၊ အော်ဒါများကို စီမahaခန့်ခွဲခြင်း၊ ကုန်ပစ္စည်းคงคลังကို ခြေရာခံခြင်းနှင့် သင်၏စားသောက်ဆိုင်၏ စွမ်းဆောင်ရည်ကို မြှင့်တင်ပါ။
                    </p>
                    @if (!Auth::check())
                        <a href="{{ route('login') }}" class="inline-flex items-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                            စတင်လိုက်ပါ
                        </a>
                    @endif
                </div>
            </header>

            <!-- Optional: Features Section -->
            <section class="py-16 bg-white">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <h2 class="text-3xl font-extrabold text-gray-900 text-center mb-12">အဓိကအင်္ဂါရပ်များ</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <!-- Feature 1 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-md text-center">
                            <div class="mb-4 text-indigo-500">
                                <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">အော်ဒါစီမံခန့်ခွဲမှု</h3>
                            <p class="text-gray-600">ဖောက်သည်အော်ဒါများကို ထိရောက်စွာလက်ခံပြီး ခြေရာခံပါ၊ စားပွဲများသို့ သတ်မှတ်ပေးပြီး မီးဖိုချောင်လုပ်ငန်းစဉ်ကို စီမံခန့်ခွဲပါ။</p>
                        </div>
                        <!-- Feature 2 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-md text-center">
                            <div class="mb-4 text-green-500">
                                <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">ကုန်ပစ္စည်းคงคลัง ထိန်းချုပ်ရေး</h3>
                            <p class="text-gray-600">သင်၏ပါဝင်ပစ္စည်းများကို ခြေရာခံပါ၊ အလေအလွင့်မဖြစ်အောင် ကာကွယ်ပါ၊ နှင့် ပေးသွင်းသူသွင်းကုန်များကို ချောမွေ့စွာ စီမံခန့်ခွဲပါ။</p>
                        </div>
                        <!-- Feature 3 -->
                        <div class="bg-gray-50 p-6 rounded-lg shadow-md text-center">
                            <div class="mb-4 text-red-500">
                                <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path></svg>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">အစီရင်ခံခြင်းနှင့် သုံးသပ်ခြင်း</h3>
                            <p class="text-gray-600">အသိပေးဆုံးဖြတ်ချက်များအတွက် အရောင်းအစီရင်ခံစာများ၊ အမြတ်/အရှုံးရှင်းတမ်းများနှင့် ငွေတောင်းခံလွှာမှတ်တမ်းများကို ဖန်တီးပါ။</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <footer class="bg-gray-800 text-white py-8">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                    <p>&copy; {{ date('Y') }} {{ config('app.name', 'Laravel') }}. အခွင့်အရေးအားလုံး လက်ဝယ်ရှိသည်။</p>
                </div>
            </footer>
        </div>
    </body>
</html>
