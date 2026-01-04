<!-- Overlay (mobile only) -->
<div
    x-show="sidebarOpen && window.innerWidth < 768"
    @click="sidebarOpen = false"
    class="fixed inset-0 bg-black bg-opacity-50 z-40 md:hidden"
    style="display: none;"
    x-transition:enter="transition-opacity ease-linear duration-300"
    x-transition:enter-start="opacity-0"
    x-transition:enter-end="opacity-100"
    x-transition:leave="transition-opacity ease-linear duration-300"
    x-transition:leave-start="opacity-100"
    x-transition:leave-end="opacity-0"
></div>

<!-- Sidebar -->
<aside
    class="fixed top-0 left-0 z-50 h-screen bg-white border-r border-gray-200 transition-all duration-300 ease-in-out"
    :class="{
        'w-64': sidebarOpen,
        'w-20': !sidebarOpen && window.innerWidth >= 768,
        '-translate-x-full md:translate-x-0': !sidebarOpen && window.innerWidth < 768,
        'translate-x-0': sidebarOpen
    }"
>
    <!-- Logo -->
    <div class="h-16  flex items-center justify-center border-b mt-5 px-4">
        @if(Auth::user()->hasRole('admin'))
            <a href="{{ route('admin.dashboard') }}" class="flex items-center justify-center w-full">
        @elseif(Auth::user()->hasRole('waiter'))
            <a href="{{ route('waiter.dashboard') }}" class="flex items-center justify-center w-full">
        @elseif(Auth::user()->hasRole('kitchen'))
            <a href="{{ route('kitchen.dashboard') }}" class="flex items-center justify-center w-full">
        @elseif(Auth::user()->hasRole('supplier'))
            <a href="{{ route('supplier.ingredients.import.create') }}" class="flex items-center justify-center w-full">
        @endif
            <x-application-logo
                class="h-20 w-20 mb-6 text-gray-800 transition-all duration-300"
                x-show="sidebarOpen"
            />
            <svg
                class="h-8 w-auto text-gray-800 transition-all duration-300"
                x-show="!sidebarOpen"
                style="display: none;"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
            >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </a>
    </div>

    <!-- Navigation -->
    <nav class="mt-4 px-3 space-y-1 overflow-y-auto pb-4" style="max-height: calc(100vh - 5rem);">

        {{-- ADMIN --}}
        @if(Auth::user()->hasRole('admin'))
            <x-nav-link :href="route('admin.dashboard')" :active="request()->routeIs('admin.dashboard')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Dashboard</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.ingredients.index')" :active="request()->routeIs('admin.ingredients.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Ingredients</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.fooditems.index')" :active="request()->routeIs('admin.fooditems.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                    <polyline points="7 10 12 15 17 10"></polyline>
                    <line x1="12" y1="15" x2="12" y2="3"></line>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Food Items</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.orders.index')" :active="request()->routeIs('admin.orders.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                    <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Orders</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.tables.index')" :active="request()->routeIs('admin.tables.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 15h2c1.1 0 2-.9 2-2V2H2v11c0 1.1.9 2 2 2h2"></path>
                    <path d="M20 15h2V4H2v11c0 1.1.9 2 2 2h2"></path>
                    <rect x="2" y="2" width="20" height="2" rx="1" ry="1"></rect>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Tables</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.expense_groups.index')" :active="request()->routeIs('admin.expense_groups.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="12" y1="1" x2="12" y2="23"></line>
                    <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Expense Groups</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.expense_details.index')" :active="request()->routeIs('admin.expense_details.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                    <line x1="16" y1="2" x2="16" y2="6"></line>
                    <line x1="8" y1="2" x2="8" y2="6"></line>
                    <line x1="3" y1="10" x2="21" y2="10"></line>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Expense Details</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.reports.sales')" :active="request()->routeIs('admin.reports.sales')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 3v18h18"></path>
                    <path d="M18.7 8.3L12 15 7.1 10.1M9 17h12"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Sales Report</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.reports.profit_loss')" :active="request()->routeIs('admin.reports.profit_loss')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M13 17h6v2h-6v4H8V17H2v-2h6V1h5v16z"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Profit & Loss</span>
            </x-nav-link>

            <x-nav-link :href="route('admin.reports.table_bill_outs.index')" :active="request()->routeIs('admin.reports.table_bill_outs.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Bill Out Records</span>
            </x-nav-link>
        @endif

        {{-- SUPPLIER --}}
        @if(Auth::user()->hasRole('supplier'))
            <x-nav-link :href="route('supplier.ingredients.import.create')" :active="request()->routeIs('supplier.ingredients.import.create')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M21.2 15.8l-1.4 1.4L18 14.1V22h-2V14.1L12.2 17.2l-1.4-1.4L14 12 9.4 7.4l1.4-1.4L16 9.9V2h2v7.9l4.6-4.6z"></path>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Ingredient Import</span>
            </x-nav-link>

            <x-nav-link :href="route('supplier.reports.ingredient-imports')" :active="request()->routeIs('supplier.reports.ingredient-imports')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                    <line x1="16" y1="2" x2="16" y2="6"></line>
                    <line x1="8" y1="2" x2="8" y2="6"></line>
                    <line x1="3" y1="10" x2="21" y2="10"></line>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Import Reports</span>
            </x-nav-link>
        @endif

        {{-- WAITER --}}
        @if(Auth::user()->hasRole('waiter'))
            <x-nav-link :href="route('waiter.dashboard')" :active="request()->routeIs('waiter.dashboard')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Dashboard</span>
            </x-nav-link>

            <x-nav-link :href="route('waiter.menu')" :active="request()->routeIs('waiter.menu')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="8" y1="6" x2="21" y2="6"></line>
                    <line x1="8" y1="12" x2="21" y2="12"></line>
                    <line x1="8" y1="18" x2="21" y2="18"></line>
                    <line x1="3" y1="6" x2="3.01" y2="6"></line>
                    <line x1="3" y1="12" x2="3.01" y2="12"></line>
                    <line x1="3" y1="18" x2="3.01" y2="18"></line>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Menu</span>
            </x-nav-link>

            <x-nav-link :href="route('waiter.tables.index')" :active="request()->routeIs('waiter.tables.*')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 15h2c1.1 0 2-.9 2-2V2H2v11c0 1.1.9 2 2 2h2"></path>
                    <path d="M20 15h2V4H2v11c0 1.1.9 2 2 2h2"></path>
                    <rect x="2" y="2" width="20" height="2" rx="1" ry="1"></rect>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Tables</span>
            </x-nav-link>

            <x-nav-link :href="route('waiter.my-orders')" :active="request()->routeIs('waiter.my-orders')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                    <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">My Orders</span>
            </x-nav-link>
        @endif

        {{-- KITCHEN --}}
        @if(Auth::user()->hasRole('kitchen'))
            <x-nav-link :href="route('kitchen.dashboard')" :active="request()->routeIs('kitchen.dashboard')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Dashboard</span>
            </x-nav-link>

            <x-nav-link :href="route('kitchen.orders')" :active="request()->routeIs('kitchen.orders')" class="flex items-center px-3 py-2">
                <svg class="h-5 w-5 flex-shrink-0 transition-all duration-300" :class="{'mr-3': sidebarOpen}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                    <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                </svg>
                <span x-show="sidebarOpen" class="whitespace-nowrap transition-all duration-300">Orders</span>
            </x-nav-link>
        @endif
    </nav>
</aside>
