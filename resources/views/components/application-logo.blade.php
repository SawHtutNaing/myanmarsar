<img
    {{ $attributes->merge([
        'src' => asset('logo.jpg'),
        'alt' => config('app.name'),
        'class' => 'block'
    ]) }}
>
