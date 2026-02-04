<nav x-data="{ open: false }" class="bg-white border-b border-gray-100">
    <!-- Primary Navigation Menu -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex">
                <!-- Logo -->
                <div class="shrink-0 flex items-center">
                    @if(Auth::user()->hasRole('admin'))
                        <a href="{{ route('admin.dashboard') }}">
                    @elseif(Auth::user()->hasRole('waiter'))
                        <a href="{{ route('waiter.dashboard') }}">
                    @elseif(Auth::user()->hasRole('kitchen'))
                        <a href="{{ route('kitchen.dashboard') }}">
                    @endif
                        <x-application-logo class="block h-9 w-auto fill-current text-gray-800" />
                    </a>
                </div>

                <!-- Navigation Links -->
                <div class="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
                    @if(Auth::user()->hasRole('admin'))
                        <x-nav-link :href="route('admin.dashboard')" :active="request()->routeIs('admin.dashboard')">
                            {{ __('ဒိုင်ခွက်') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.ingredients.index')" :active="request()->routeIs('admin.ingredients.index')">
                            {{ __('ပါဝင်ပစ္စည်းများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.fooditems.index')" :active="request()->routeIs('admin.fooditems.index')">
                            {{ __('အစားအစာများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.users.index')" :active="request()->routeIs('admin.users.index')">
                            {{ __('အသုံးပြုသူများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.tables.index')" :active="request()->routeIs('admin.tables.index')">
                            {{ __('စားပွဲများ') }}
                        </x-nav-link>


                        <x-nav-link :href="route('admin.orders.index')" :active="request()->routeIs('admin.orders.index')">
                            {{ __('အော်ဒါများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.food-item-orders.index')" :active="request()->routeIs('admin.food-item-orders.index')">
                            {{ __('ဟင်းပွဲ အော်ဒါများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.reports.table_bill_outs.index')" :active="request()->routeIs('admin.reports.table_bill_outs.index')">
                            {{ __('စားပွဲဘေလ်') }}
                        </x-nav-link>



                        <x-nav-link :href="route('admin.reports.sales')" :active="request()->routeIs('admin.reports.sales')">
                            {{ __('အရောင်းအစီရင်ခံစာ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.reports.profit_loss')" :active="request()->routeIs('admin.reports.profit_loss')">
                            {{ __('အမြတ်နှင့်အရှုံး') }}
                        </x-nav-link>
                        <x-nav-link :href="route('admin.reports.ingredient-imports')" :active="request()->routeIs('admin.reports.ingredient-imports')">
                            {{ __('ပါဝင်ပစ္စည်း တင်သွင်းမှုများ') }}
                        </x-nav-link>
                        @elseif(Auth::user()->hasRole('supplier'))

<x-nav-link :href="route('supplier.ingredients.import.create')" :active="request()->routeIs('supplier.ingredients.import.create')">
                            {{ __('ပါဝင်ပစ္စည်း တင်သွင်းခြင်း') }}
                        </x-nav-link>
<x-nav-link :href="route('supplier.reports.ingredient-imports')" :active="request()->routeIs('supplier.reports.ingredient-imports')">
                            {{ __('ပါဝင်ပစ္စည်း တင်သွင်းမှုများ') }}
                        </x-nav-link>


                    @elseif(Auth::user()->hasRole('waiter'))
                        <x-nav-link :href="route('waiter.dashboard')" :active="request()->routeIs('waiter.dashboard')">
                            {{ __('ဒိုင်ခွက်') }}
                        </x-nav-link>
                        <x-nav-link :href="route('waiter.menu')" :active="request()->routeIs('waiter.menu')">
                            {{ __('မီနူး') }}
                        </x-nav-link>
                        {{-- <x-nav-link :href="route('waiter.orders.create')" :active="request()->routeIs('waiter.orders.create')">
                            {{ __('Place Order') }}
                        </x-nav-link> --}}
                        <x-nav-link :href="route('waiter.my-orders')" :active="request()->routeIs('waiter.my-orders')">
                            {{ __('ကျွန်ုပ်၏ အော်ဒါများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('waiter.tables.index')" :active="request()->routeIs('waiter.tables.index')">
                            {{ __('စားပွဲများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('waiter.food-item-orders.index')" :active="request()->routeIs('waiter.food-item-orders.index')">
                            {{ __('ကျွန်ုပ်၏ ဟင်းပွဲ အော်ဒါများ') }}
                        </x-nav-link>
                    @elseif(Auth::user()->hasRole('kitchen'))
                        <x-nav-link :href="route('kitchen.dashboard')" :active="request()->routeIs('kitchen.dashboard')">
                            {{ __('ဒိုင်ခွက်') }}
                        </x-nav-link>
                        <x-nav-link :href="route('kitchen.orders')" :active="request()->routeIs('kitchen.orders')">
                            {{ __('အော်ဒါများ') }}
                        </x-nav-link>
                        <x-nav-link :href="route('kitchen.food-item-orders.index')" :active="request()->routeIs('kitchen.food-item-orders.index')">
                            {{ __('ဟင်းပွဲ အော်ဒါများ') }}
                        </x-nav-link>
                    @endif
                </div>
            </div>

            <!-- Settings Dropdown -->
            <div class="hidden sm:flex sm:items-center sm:ms-6">
                <x-dropdown align="right" width="48">
                    <x-slot name="trigger">
                        <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                            <div>{{ Auth::user()->name }}</div>

                            <div class="ms-1">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                </svg>
                            </div>
                        </button>
                    </x-slot>

                    <x-slot name="content">
                        <x-dropdown-link href="/profile">
                            {{ __('ပရိုဖိုင်') }}
                        </x-dropdown-link>

                        <!-- Authentication -->
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf

                            <x-dropdown-link href="#"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                                {{ __('ထွက်ရန်') }}
                            </x-dropdown-link>
                        </form>
                    </x-slot>
                </x-dropdown>
            </div>

            <!-- Hamburger -->
            <div class="-me-2 flex items-center sm:hidden">
                <button @click="open = ! open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                        <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <!-- Responsive Navigation Menu -->
    <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden">
        <div class="pt-2 pb-3 space-y-1">
            @if(Auth::user()->hasRole('admin'))
                <x-responsive-nav-link :href="route('admin.dashboard')" :active="request()->routeIs('admin.dashboard')">
                    {{ __('ဒိုင်ခွက်') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.ingredients.index')" :active="request()->routeIs('admin.ingredients.index')">
                    {{ __('ပါဝင်ပစ္စည်းများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.fooditems.index')" :active="request()->routeIs('admin.fooditems.index')">
                    {{ __('အစားအစာများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.users.index')" :active="request()->routeIs('admin.users.index')">
                    {{ __('အသုံးပြုသူများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.tables.index')" :active="request()->routeIs('admin.tables.index')">
                    {{ __('စားပွဲများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.orders.index')" :active="request()->routeIs('admin.orders.index')">
                    {{ __('အော်ဒါများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.food-item-orders.index')" :active="request()->routeIs('admin.food-item-orders.index')">
                    {{ __('ဟင်းပွဲ အော်ဒါများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.reports.sales')" :active="request()->routeIs('admin.reports.sales')">
                    {{ __('အရောင်းအစီရင်ခံစာ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.reports.profit_loss')" :active="request()->routeIs('admin.reports.profit_loss')">
                    {{ __('အမြတ်နှင့်အရှုံး') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('admin.reports.ingredient-imports')" :active="request()->routeIs('admin.reports.ingredient-imports')">
                    {{ __('ပါဝင်ပစ္စည်း တင်သွင်းမှုများ') }}
                </x-responsive-nav-link>
            @elseif(Auth::user()->hasRole('waiter'))
                <x-responsive-nav-link :href="route('waiter.dashboard')" :active="request()->routeIs('waiter.dashboard')">
                    {{ __('ဒိုင်ခွက်') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('waiter.menu')" :active="request()->routeIs('waiter.menu')">
                    {{ __('မီနူး') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('waiter.my-orders')" :active="request()->routeIs('waiter.my-orders')">
                    {{ __('ကျွန်ုပ်၏ အော်ဒါများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('waiter.tables.index')" :active="request()->routeIs('waiter.tables.index')">
                    {{ __('စားပွဲများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('waiter.food-item-orders.index')" :active="request()->routeIs('waiter.food-item-orders.index')">
                    {{ __('ကျွန်ုပ်၏ ဟင်းပွဲ အော်ဒါများ') }}
                </x-responsive-nav-link>
            @elseif(Auth::user()->hasRole('kitchen'))
                <x-responsive-nav-link :href="route('kitchen.dashboard')" :active="request()->routeIs('kitchen.dashboard')">
                    {{ __('ဒိုင်ခွက်') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('kitchen.orders')" :active="request()->routeIs('kitchen.orders')">
                    {{ __('အော်ဒါများ') }}
                </x-responsive-nav-link>
                <x-responsive-nav-link :href="route('kitchen.food-item-orders.index')" :active="request()->routeIs('kitchen.food-item-orders.index')">
                    {{ __('ဟင်းပွဲ အော်ဒါများ') }}
                </x-responsive-nav-link>
            @endif
        </div>

        <!-- Responsive Settings Options -->
        <div class="pt-4 pb-1 border-t border-gray-200">
            <div class="px-4">
                <div class="font-medium text-base text-gray-800">{{ Auth::user()->name }}</div>
                <div class="font-medium text-sm text-gray-500">{{ Auth::user()->email }}</div>
            </div>

            <div class="mt-3 space-y-1">
                <x-responsive-nav-link href="#">
                    {{ __('ပရိုဖိုင်') }}
                </x-responsive-nav-link>

                <!-- Authentication -->
                <form method="POST" action="#">
                    @csrf

                    <x-responsive-nav-link href="#"
                            onclick="event.preventDefault();
                                        this.closest('form').submit();">
                        {{ __('ထွက်ရန်') }}
                    </x-responsive-nav-link>
                </form>
            </div>
        </div>
    </div>
</nav>
