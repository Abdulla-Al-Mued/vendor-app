import 'package:flutter/material.dart';

import '../../../../../router/navigation_service.dart';
import '../../../../../router/screen_names.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _orders = [
    {
      'orderId': '100181',
      'date': '22 Sep, 2025',
      'amount': '\$165.50',
      'status': 'Out For Delivery',
      'statusIcon': Icons.local_shipping,
      'paymentMethod': 'Pay by wallet',
      'paymentIcon': Icons.account_balance_wallet,
    },
    {
      'orderId': '100181',
      'date': '22 Sep, 2025',
      'amount': '\$245.50',
      'status': 'Delivered',
      'statusIcon': Icons.inventory_2,
      'paymentMethod': 'Cash On Delivery',
      'paymentIcon': Icons.payments,
    },
    {
      'orderId': '102181',
      'date': '22 Sep, 2025',
      'amount': '\$245.50',
      'status': 'Pending',
      'statusIcon': Icons.access_time,
      'paymentMethod': 'Cash On Delivery',
      'paymentIcon': Icons.payments,
    },
    {
      'orderId': '132181',
      'date': '22 Sep, 2025',
      'amount': '\$245.50',
      'status': 'Packaging',
      'statusIcon': Icons.inventory,
      'paymentMethod': 'Stripe',
      'paymentIcon': Icons.touch_app,
    },
    {
      'orderId': '122181',
      'date': '22 Sep, 2025',
      'amount': '\$245.50',
      'status': 'Confirmed',
      'statusIcon': Icons.inventory_2,
      'paymentMethod': 'Stripe',
      'paymentIcon': Icons.touch_app,
    },
    {
      'orderId': '144181',
      'date': '22 Sep, 2025',
      'amount': '\$345.50',
      'status': 'Cancelled',
      'statusIcon': Icons.close,
      'paymentMethod': 'Cash On Delivery',
      'paymentIcon': Icons.payments,
    },
    {
      'orderId': '100181',
      'date': '22 Sep, 2025',
      'amount': '\$245.50',
      'status': 'Failed to Delivery',
      'statusIcon': Icons.inventory_2,
      'paymentMethod': 'Cash On Delivery',
      'paymentIcon': Icons.payments,
    },
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    if (_selectedFilter == 'All') {
      return _orders;
    }
    return _orders.where((order) => order['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF27AE60), width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF27AE60),
                      size: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'My Order',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),
            ),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                padding: const EdgeInsets.all(11.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
                  borderRadius: BorderRadius.circular(2.32),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD7D7D7).withOpacity(0.25),
                      blurRadius: 2.32,
                      offset: const Offset(0, 2.32),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildFilterRow([
                      'All',
                      'Pending',
                      'Packaging',
                    ]),
                    const SizedBox(height: 14),
                    _buildFilterRow([
                      'Delivered',
                      'Return',
                      'Failed to Delivery',
                    ]),
                    const SizedBox(height: 14),
                    _buildFilterRow([
                      'Cancelled',
                      'Confirmed',
                      'Out For Delivery',
                    ]),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Orders List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemCount: _filteredOrders.length,
                itemBuilder: (context, index) {
                  final order = _filteredOrders[index];
                  return GestureDetector(
                    onTap: (){
                      NavigationService.navigateTo(Screens.orderDetailsPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: _buildOrderCard(order),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow(List<String> filters) {
    return Row(
      children: filters.map((filter) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: _buildFilterChip(filter),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFECF0F1),
          border: Border.all(
            color: const Color(0xFFF9F9F9),
            width: 0.82,
          ),
          borderRadius: BorderRadius.circular(6.52),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF9F9F9),
              blurRadius: 3.26,
              offset: const Offset(0, 3.26),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 9,
              height: 1.38,
              color: isSelected ? const Color(0xFF1A252F) : const Color(0xFF606060),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9F8EF), width: 0.58),
        borderRadius: BorderRadius.circular(2.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA8A8A8).withOpacity(0.25),
            blurRadius: 9.3,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: Column(
        children: [
          // Order Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order#: ${order['orderId']}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1.38,
                        color: Color(0xFF1A252F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order['date'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 11.44,
                        height: 1.38,
                        color: const Color(0xFFBBBBBB).withOpacity(0.73),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 98,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      order['amount'],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 1.38,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Status Bar
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFE9F8EF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(2.32),
                bottomRight: Radius.circular(2.32),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        order['statusIcon'],
                        size: 20,
                        color: const Color(0xFF27AE60),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order['status'],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.38,
                          color: Color(0xFF27AE60),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        order['paymentIcon'],
                        size: 16.4,
                        color: const Color(0xFF606060),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order['paymentMethod'],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.38,
                          color: Color(0xFF606060),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
