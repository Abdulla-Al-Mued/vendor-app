import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 393 ? 16.0 : 12.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                // Header
                _buildHeader(),
                const SizedBox(height: 32),
                // Shipping Address Section
                _buildShippingSection(),
                const SizedBox(height: 24),
                // Order Summary Section
                _buildOrderSummarySection(),
                const SizedBox(height: 24),
                // Customer Information Section
                _buildCustomerInfoSection(),
                const SizedBox(height: 24),
                // Order Setup Button
                _buildOrderButton(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_back_ios, color: const Color(0xFF27AE60),),
            const SizedBox(width: 12),
            const Text(
              'Order#100181',
              style: TextStyle(
                fontSize: 14.6,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A252F),
                letterSpacing: -0.02,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.only(left: 29),
          child: Text(
            'Your Order is Confirmed',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFFBBBBBB),
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.only(left: 29),
          child: Text(
            '9jun,2023',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF606060),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShippingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(7.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Verification Cod: 290038',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A252F),
              letterSpacing: -0.02,
            ),
          ),
          const SizedBox(height: 24),
          // Address Info Button
          Container(
            height: 57,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
              borderRadius: BorderRadius.circular(7.83),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFA4A4A4).withOpacity(0.25), // heavier
                  blurRadius: 15,
                  offset: const Offset(0, 2.61), // keeps the extra weight low
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: const Color(0xFF27AE60),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Address Info',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF27AE60),
                        letterSpacing: -0.02,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: const Color(0xFF1A252F),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Show on Map',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A252F),
                        letterSpacing: -0.02,
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // Shipping Details Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
              borderRadius: BorderRadius.circular(7.83),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFA4A4A4).withOpacity(0.25),
                  blurRadius: 15.85,
                  offset: const Offset(0, 2.61),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(Icons.person_outline, 'Robert Weiss'),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.home_outlined, 'Home'),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.business_outlined, 'Consectetur explica'),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.location_on_outlined, 'Sint vitae lorem qui'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Right Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(Icons.phone_outlined, '+13218782977'),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.flag_outlined, 'Lesotho'),
                          const SizedBox(height: 16),
                          _buildInfoRow(Icons.keyboard_outlined, '97389'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Color(0xFFBBBBBB),
                  thickness: 1,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Billing Address',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF606060),
                    letterSpacing: -0.02,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Same as shipping address',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF606060)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF606060),
              letterSpacing: -0.02,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummarySection() {
    return Container(
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_outlined,
                size: 22,
                color: const Color(0xFF1A252F),
              ),
              const SizedBox(width: 8),
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A252F),
                  letterSpacing: -0.02,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Product Card
          Row(
            children: [
              Container(
                width: 156,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
                  borderRadius: BorderRadius.circular(7.83),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFA4A4A4).withOpacity(0.25),
                      blurRadius: 15.85,
                      offset: const Offset(0, 2.61),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.backpack_outlined,
                    size: 40,
                    color: const Color(0xFF606060),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hydration Pack',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A252F),
                        height: 1.38,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$ 50.00',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF27AE60),
                        height: 1.38,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Tax include',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A252F),
                        height: 1.38,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Qty: 1',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFBBBBBB),
                        height: 1.38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          // Price Breakdown
          _buildPriceRow('Sub Total', '\$ 50.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Tax', '+\$15.50'),
          const SizedBox(height: 8),
          _buildPriceRow('Discount', '-\$0.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Coupon Discount', '-\$0.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Shipping Fee', '+\$ 100.00'),
          const SizedBox(height: 12),
          const Divider(
            color: Color(0xFFBBBBBB),
            thickness: 1,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27AE60),
                  height: 1.38,
                ),
              ),
              Text(
                '\$ 165.50',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF606060),
                  height: 1.38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildPriceRow('Payment Status', 'Paid', isGreen: true),
          const SizedBox(height: 12),
          _buildPriceRow('Payment Method', 'Pay by wallet', isGreen: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isGreen = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isGreen ? const Color(0xFF27AE60) : const Color(0xFF606060),
            height: 1.38,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF606060),
            height: 1.38,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfoSection() {
    return Container(
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 14.46,
                color: const Color(0xFF1A252F),
              ),
              const SizedBox(width: 8),
              const Text(
                'Customer information',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A252F),
                  height: 1.38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 125,
                height: 89,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: const Color(0xFF606060),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Robert Downey',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF606060),
                        height: 1.38,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 9.29,
                          color: const Color(0xFF606060),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '+15551112222',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF606060),
                            height: 1.38,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 9.29,
                          color: const Color(0xFF606060),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Robert@customer.com',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF606060),
                              height: 1.38,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF27AE60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Order Setup',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.02,
          ),
        ),
      ),
    );
  }
}

