<div class="mb-4">
    <label for="table_number" class="block text-sm font-medium text-gray-700">{{ __('Table Number') }}</label>
    <input type="number" name="table_number" id="table_number" value="{{ old('table_number', $table->table_number ?? '') }}" required class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    @error('table_number')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
</div>


<div class="mb-4">
    <label for="status" class="block text-sm font-medium text-gray-700">{{ __('Status') }}</label>
    <select name="status" id="status" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
        <option value="available" {{ old('status', $table->status ?? '') == 'available' ? 'selected' : '' }}>Available</option>
        <option value="occupied" {{ old('status', $table->status ?? '') == 'occupied' ? 'selected' : '' }}>Occupied</option>
    </select>
    @error('status')
        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
    @enderror
</div>
