@props(['active'])

@php
$classes = ($active ?? false)
            ? 'flex items-center px-3 py-2 rounded-md border-transparent text-sm font-medium leading-5 text-gray-900 focus:outline-none transition duration-150 ease-in-out bg-gray-200'
            : 'flex items-center px-3 py-2 rounded-md border-transparent text-sm font-medium leading-5 text-gray-600 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-100 transition duration-150 ease-in-out';
@endphp

<a {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>
