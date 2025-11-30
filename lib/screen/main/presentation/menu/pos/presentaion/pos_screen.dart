import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';

import '../../../../../../asset_helper/ic_img_path.dart';
import '../../../../../../router/screen_names.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    // Header with Billing Icon and Notification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBillingHeader(),
                        _buildNotificationIcon(),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Customer Search and Add Button
                    Row(
                      children: [
                        Expanded(
                          child: _buildCustomerSearchField(screenWidth),
                        ),
                        SizedBox(width: 8),
                        _buildAddButton(),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Customer Information
                    _buildCustomerInfo(),

                    SizedBox(height: screenHeight * 0.015),

                    const Text(
                      'Name : Walk-In Customer',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Table Header
                    _buildTableHeader(screenWidth),

                    SizedBox(height: screenHeight * 0.15),

                    // Empty State - Scan Items
                    _buildEmptyScanState(screenHeight),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar

          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBillingHeader() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: CustomPaint(
            painter: BillingIconPainter(),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Billing section',
          style: TextStyle(
            fontSize: 14.6,
            fontWeight: FontWeight.w500,
            color: Color(0xFF27AE60),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 29,
          height: 25,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 3,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFD5A5B),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerSearchField(double screenWidth) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF27AE60), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Text(
              'Walk- In Customer',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF606060),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: (){
        NavigationService.navigateTo(Screens.adCustomerScreen);
      },
      child: Container(
        width: 42,
        height: 39,
        decoration: BoxDecoration(
          color: const Color(0xFF27AE60),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.person_add,
          color: Color(0xFFECECEE),
          size: 20,
        ),
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Customer Informaiton :',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(double screenWidth) {
    return Container(
      width: screenWidth,
      height: 50,
      color: const Color(0xFFE9ECF5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Item Info',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            'City',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            'Price',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyScanState(double screenHeight) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            scannerImg,
            width: 60,
            height: 60,
          ),
          SizedBox(height: screenHeight * 0.02),
          const Text(
            'Scan Items or Add From items',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC0C0C0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Card(
      elevation: 10,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF27AE60),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.qr_code_scanner,
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BillingIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF27AE60)
      ..style = PaintingStyle.fill;

    // Draw simplified billing icon shapes
    final path = Path();

    // Main document rectangle
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.15, size.height * 0.1,
          size.width * 0.7, size.height * 0.8),
      const Radius.circular(2),
    ));

    canvas.drawPath(path, paint);

    // Lines on document
    final linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.3),
      Offset(size.width * 0.75, size.height * 0.3),
      linePaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.45),
      Offset(size.width * 0.6, size.height * 0.45),
      linePaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.6),
      Offset(size.width * 0.65, size.height * 0.6),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
