<div class="mb-4">
    <label for="name" class="block text-sm font-medium text-gray-700">{{ __('အမည်') }}</label>
    <input type="text" name="name" id="name" value="{{ old('name', $user->name ?? '') }}" required autofocus class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    @error('name')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
</div>

<div class="mb-4">
    <label for="email" class="block text-sm font-medium text-gray-700">{{ __('အီးမေးလ်') }}</label>
    <input type="email" name="email" id="email" value="{{ old('email', $user->email ?? '') }}" required class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    @error('email')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
</div>

<div class="mb-4">
    <label for="password" class="block text-sm font-medium text-gray-700">{{ __('စကားဝှက်') }}</label>
    <input type="password" name="password" id="password" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    @error('password')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
    @if(isset($user))
        <p class="text-sm text-gray-500 mt-1">{{ __('လက်ရှိစကားဝှက်ကို ထားရှိရန် ဗလာထားခဲ့ပါ။') }}</p>
    @endif
</div>

<div class="mb-4">
    <label for="password_confirmation" class="block text-sm font-medium text-gray-700">{{ __('စကားဝှက်ကို အတည်ပြုပါ။') }}</label>
    <input type="password" name="password_confirmation" id="password_confirmation" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
</div>

<div class="mb-4">
    <label for="roles" class="block text-sm font-medium text-gray-700">{{ __('အခန်းကဏ္ဍများ') }}</label>
    <select name="roles[]" id="roles" multiple required class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
        @foreach ($roles as $role)
            <option value="{{ $role->id }}"
                @if(isset($user) && $user->roles->contains($role->id)) selected @endif>
                {{ $role->name }}
            </option>
        @endforeach
    </select>
    @error('roles')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
</div>