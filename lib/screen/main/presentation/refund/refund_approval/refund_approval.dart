import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';

import '../../../../../router/screen_names.dart';



class RefundRequestScreen extends StatelessWidget {
  const RefundRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 393 ? 16.0 : 12.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 28),
                      // Header with back button
                      _buildHeader(),
                      const SizedBox(height: 32),
                      // Product Card
                      _buildProductCard(),
                      const SizedBox(height: 24),
                      // Reason Section
                      _buildReasonSection(),
                      const SizedBox(height: 24),
                      // Refund Breakdown
                      _buildRefundBreakdown(),
                      const SizedBox(height: 24),
                      // Customer Information
                      _buildCustomerInfoSection(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            // Action Buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.only(left: 17),
              child: Text(
                '12-Oct-2022 03:57 AM',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF606060),
                ),
              ),
            ),
          ],
        ),
        // Refresh Button
        GestureDetector(
          onTap: (){
            NavigationService.navigateTo(Screens.changeLogScreen);
          },
          child: Container(
            width: 38.5,
            height: 38.5,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE3E3E3),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: const Color(0xFFE3E3E3).withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: const Icon(
              Icons.history,
              color: Color(0xFF27AE60),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      height: 123,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 128,
            height: 86,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFBBBBBB).withOpacity(0.73),
                width: 0.48,
              ),
              borderRadius: BorderRadius.circular(5.8),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 45,
                color: const Color(0xFF606060).withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(width: 21),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Leather Ladies Bag',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A252F),
                    height: 1.38,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$ 99.00',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF27AE60),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.touch_app_outlined,
                      size: 16.4,
                      color: const Color(0xFF606060),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Paypal',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF606060),
                        height: 1.38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Refunded Badge
          Container(
            width: 81,
            height: 27,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF28AB7F)),
              borderRadius: BorderRadius.circular(2),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Refunded',
              style: TextStyle(
                fontSize: 11.4,
                fontWeight: FontWeight.w500,
                color: Color(0xFF28AB7F),
                height: 1.38,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonSection() {
    return Container(
      height: 172,
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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reason',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A252F),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF606060),
              height: 1.2,
            ),
          ),
          const Spacer(),
          // Attachment Button
          Container(
            width: 53,
            height: 38,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF27AE60)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.insert_drive_file_outlined,
              color: Color(0xFF27AE60),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRefundBreakdown() {
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
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 34),
      child: Column(
        children: [
          _buildPriceRow('Product Price (x1)', '+ \$ 6,000.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Product Discount', '+ \$ 10.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Coupon Discount', '+ \$ 0.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Product Tax', '+ \$ 3000.00'),
          const SizedBox(height: 8),
          _buildPriceRow('Sub Total', '+ \$ 6,290.00'),
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
                'Total Refundable Amount',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2C3E50),
                  height: 1.38,
                ),
              ),
              Text(
                '\$ 6,290.00',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27AE60),
                  height: 1.38,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF606060),
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
      padding: const EdgeInsets.all(27),
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
              // Customer Image
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
              // Customer Details
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

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(11.25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Reject Button
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFEECEA),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFFD5A5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Reject',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFD5A5B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14.5),
          // Approve Button
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Approve',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}