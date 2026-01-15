<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('ကျွန်ုပ်၏ အော်ဒါများ') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 ">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <!-- Date Filter Section -->
                    <div class="mb-6 bg-gray-50 p-4 rounded-lg hidden">
                        <h4 class="text-md font-semibold mb-3">ရက်စွဲအလိုက် အော်ဒါများကို စစ်ထုတ်ပါ။</h4>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label for="date_from" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲမှ</label>
                                <input type="date" id="date_from" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div>
                                <label for="date_to" class="block text-sm font-medium text-gray-700 mb-1">ရက်စွဲအထိ</label>
                                <input type="date" id="date_to" class="w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring-blue-500">
                            </div>
                            <div class="flex items-end gap-2">
                                <button id="apply_filter" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                                    စစ်ထုတ်ပါ။
                                </button>
                                <button id="reset_filter" class="px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
                                    ပြန်လည်စတင်ပါ
                                </button>
                            </div>
                        </div>
                        <p class="text-sm text-gray-600 mt-2">* မူရင်းအားဖြင့် ယနေ့အော်ဒါများကိုသာ ပြသသည်။</p>
                    </div>

                    <h3 class="text-lg font-bold mb-4">ကျွန်ုပ်မှာယူထားသော အော်ဒါများ</h3>
                    <div id="my-orders-list" class="space-y-8">
                        {{-- Orders will be loaded here via polling --}}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            let completedOrders = new Set();
            let audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            let audioEnabled = false;
            let dateFrom = '';
            let dateTo = '';

            // Set today's date as default
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('date_from').value = today;
            document.getElementById('date_to').value = today;
            dateFrom = today;
            dateTo = today;

            function initAudioContext() {
                if (audioCtx.state === 'suspended') {
                    audioCtx.resume().then(() => {
                        audioEnabled = true;
                        console.log('Audio context resumed');
                    }).catch(error => {
                        console.error('Failed to resume audio context:', error);
                    });
                } else if (audioCtx.state === 'running') {
                    audioEnabled = true;
                }
            }

            document.body.addEventListener('click', initAudioContext);

            function playSound() {
                initAudioContext();
                if (!audioEnabled || audioCtx.state !== 'running') {
                    console.log('Audio context not running yet - sound skipped until user interaction');
                    return;
                }
                const oscillator = audioCtx.createOscillator();
                const gainNode = audioCtx.createGain();
                oscillator.type = 'sine';
                oscillator.frequency.setValueAtTime(800, audioCtx.currentTime);
                oscillator.connect(gainNode);
                gainNode.connect(audioCtx.destination);
                gainNode.gain.setValueAtTime(0.5, audioCtx.currentTime);
                oscillator.start();
                setTimeout(() => {
                    oscillator.stop();
                }, 200);
            }

            // Apply Filter Button
            document.getElementById('apply_filter').addEventListener('click', function() {
                dateFrom = document.getElementById('date_from').value;
                dateTo = document.getElementById('date_to').value;
                fetchMyOrders();
            });

            // Reset Filter Button
            document.getElementById('reset_filter').addEventListener('click', function() {
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('date_from').value = today;
                document.getElementById('date_to').value = today;
                dateFrom = today;
                dateTo = today;
                fetchMyOrders();
            });

            function createSection(title, orders, bgClass) {
                if (orders.length === 0) return null;

                const section = document.createElement('div');
                section.innerHTML = `
                    <h4 class="text-md font-semibold mb-2">${title}</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"></div>
                `;
                const grid = section.querySelector('div');

                orders.forEach(order => {
                    const orderCard = document.createElement('div');
                    orderCard.className = `border rounded-lg p-6 shadow-md ${bgClass}`;

                    let statusColor = '';
                    switch (order.status) {
                        case 'pending':
                            statusColor = 'text-yellow-600';
                            break;
                        case 'in_progress':
                            statusColor = 'text-blue-600';
                            break;
                        case 'completed':
                            statusColor = 'text-green-600';
                            break;
                        case 'cancelled':
                            statusColor = 'text-red-600';
                            break;
                        default:
                            statusColor = 'text-gray-600';
                    }

                    let itemsHtml = '<ul class="space-y-2">';
                    order.order_items.forEach(item => {
                        let itemStatusColor = '';
                        switch (item.status) {
                            case 'pending':
                                itemStatusColor = 'text-yellow-600';
                                break;
                            case 'cooking':
                                itemStatusColor = 'text-orange-600';
                                break;
                            case 'cooked':
                                itemStatusColor = 'text-green-600';
                                break;
                            case 'served':
                                itemStatusColor = 'text-blue-600';
                                break;
                            case 'cancelled':
                                itemStatusColor = 'text-red-600';
                                break;
                            default:
                                itemStatusColor = 'text-gray-600';
                        }

                        itemsHtml += `<li class="flex items-center justify-between">
                            <span>${item.quantity} x ${item.food_item.name} - <span class="${itemStatusColor}">${item.status}</span></span>`;
                        if (item.status === 'cooked') {
                            itemsHtml += `
                                <form action="/waiter/orders/items/${item.id}/take" method="POST" class="inline-block ml-2">
                                    @csrf
                                    <button type="submit" onclick="return confirm('ဤပစ္စည်းကို ယူရန် သေချာပါသလား။');" class="bg-green-500 hover:bg-green-700 text-white text-sm font-medium py-2 px-4 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                        ယူပါ
                                    </button>
                                </form>
                            `;
                        }
                        itemsHtml += `</li>`;
                    });
                    itemsHtml += '</ul>';

                    const totalPrice = parseFloat(order.total_price);
                    const formattedTotal = isNaN(totalPrice) ? '0.00' : totalPrice.toFixed(2);

                    // Format date
                    const orderDate = new Date(order.created_at);
                    const formattedDate = orderDate.toLocaleString();

                    let editButtonHtml = '';
                    if (order.status !== 'completed' && order.status !== 'cancelled') {
                        editButtonHtml = `<a href="/waiter/orders/${order.id}/edit" onclick="return confirm('ဤအော်ဒါကို တည်းဖြတ်ရန် သေချာပါသလား။');" class="mt-4 inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-lg text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition ease-in-out duration-150">အော်ဒါကို တည်းဖြတ်ပါ။</a>`;
                    }

                    orderCard.innerHTML = `
                        <h4 class="font-bold text-lg mb-2">အော်ဒါ #${order.id}</h4>
                        <p class="text-xs text-gray-500 mb-2">${formattedDate}</p>
                        <p class="text-md font-semibold mb-1">စားပွဲ #${order.table_number}</p>
                        <p class="text-sm mb-4">အခြေအနေ: <span class="${statusColor} font-semibold">${order.status}</span></p>
                        ${itemsHtml}
                        <p class="mt-4 text-base font-semibold">စုစုပေါင်း: $${formattedTotal}</p>
                        ${editButtonHtml}
                    `;
                    grid.appendChild(orderCard);
                });

                const readySection = createSection('ပြင်ဆင်ပြီးပါပြီ (ဝန်ဆောင်မှုပေးရန်)', ready, 'bg-green-50');
                if (readySection) ordersList.appendChild(readySection);

                const preparingSection = createSection('ဝန်ဆောင်မှုပေးနေသည်', preparing, 'bg-yellow-50');
                if (preparingSection) ordersList.appendChild(preparingSection);

                const completedSection = createSection('ပြီးစီးပါပြီ', completed, 'bg-blue-50');
                if (completedSection) ordersList.appendChild(completedSection);

                const cancelledSection = createSection('ဖျက်သိမ်းပြီး', cancelled, 'bg-red-50');
                if (cancelledSection) ordersList.appendChild(cancelledSection);

                if (orders.length === 0) {
                    ordersList.innerHTML = '<p class="text-gray-500 text-center py-8">ရွေးချယ်ထားသော ရက်စွဲအပိုင်းအခြားအတွက် အော်ဒါများ မတွေ့ပါ။</p>';
                }
            }

            setInterval(fetchMyOrders, 5000);
            fetchMyOrders();
        });
    </script>

</x-app-layout>