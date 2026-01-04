<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans antialiased bg-gray-100">
<div x-data="{ sidebarOpen: window.innerWidth >= 768 }" class="min-h-screen">

    {{-- Sidebar --}}
    @include('layouts.sidebar')

    {{-- Content Wrapper --}}
    <div
        class="transition-all duration-300 ease-in-out min-h-screen"
        :class="{
            'ml-64': sidebarOpen && window.innerWidth >= 768,
            'ml-20': !sidebarOpen && window.innerWidth >= 768,
            'ml-0': window.innerWidth < 768
        }"
    >
        {{-- Top Bar (Header) --}}
        <header class="h-16 bg-white border-b flex items-center justify-between px-4 md:px-6 sticky top-0 z-30">
            {{-- Hamburger button --}}
            <button
                @click="sidebarOpen = !sidebarOpen"
                class="text-gray-600 focus:outline-none inline-flex items-center justify-center p-2 rounded-md hover:text-gray-900 hover:bg-gray-100 focus:bg-gray-100 transition duration-150 ease-in-out"
            >
                <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                    <path
                        :class="{'hidden': sidebarOpen, 'inline-flex': !sidebarOpen }"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M4 6h16M4 12h16M4 18h16"
                    />
                    <path
                        :class="{'hidden': !sidebarOpen, 'inline-flex': sidebarOpen }"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M6 18L18 6M6 6l12 12"
                    />
                </svg>
            </button>

            {{-- Application Logo (visible on mobile when sidebar is closed) --}}
            <div class="md:hidden" x-show="!sidebarOpen">
                 <x-application-logo class="h-8 w-auto text-gray-800" />
            </div>

            {{-- Spacer --}}
            <div class="flex-grow"></div>

            {{-- User dropdown --}}
            <x-dropdown align="right" width="48">
                <x-slot name="trigger">
                    <button class="flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 focus:outline-none rounded-md px-3 py-2 transition duration-150 ease-in-out">
                        <span>{{ Auth::user()->name }}</span>
                        <svg class="ml-2 h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </x-slot>

                <x-slot name="content">
                    <x-dropdown-link href="/profile">
                        Profile
                    </x-dropdown-link>

                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <x-dropdown-link href="#"
                            onclick="event.preventDefault(); this.closest('form').submit();">
                            Log Out
                        </x-dropdown-link>
                    </form>
                </x-slot>
            </x-dropdown>
        </header>

        {{-- Optional Page Header --}}
        @isset($header)
            <div class="bg-white shadow px-4 md:px-6 py-4">
                {{ $header }}
            </div>
        @endisset

        {{-- Main Page Content --}}
        <main class="p-4 md:p-6">
            {{ $slot }}
        </main>

    </div>
</div>
</body>
</html>
