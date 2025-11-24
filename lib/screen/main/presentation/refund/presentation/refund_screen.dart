import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';

import '../../../../../asset_helper/ic_img_path.dart';
import '../../../../../router/screen_names.dart';

class RefundScreen extends StatelessWidget {
  const RefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),

              /// PAGE TITLE
              Text(
                "Refund",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF27AE60),
                ),
              ),

              SizedBox(height: height * 0.03),

              /// STATUS FILTERS
              _statusFilter(),

              SizedBox(height: height * 0.04),

              /// REFUND CARD
              _refundCard(width, height),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _statusFilter() {
  return Column(
    children: [
      // First large button (Pending)
      Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.5),
          border: Border.all(color: Color(0xFFF9F9F9)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF9F9F9),
              blurRadius: 3,
            ),
          ],
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "Pending",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A252F)),
          ),
        ),
      ),

      SizedBox(height: 12),

      /// three small buttons in a row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _smallStatusButton("Approved"),
          SizedBox(width: 10),
          _smallStatusButton("Rejected"),
          SizedBox(width: 10),
          _smallStatusButton("Refunded"),
        ],
      ),
    ],
  );
}

Widget _smallStatusButton(String text) {
  return Expanded(
    child: Container(
      height: 36,
      decoration: BoxDecoration(
        color: Color(0xFFECF0F1),
        borderRadius: BorderRadius.circular(6.5),
        border: Border.all(color: Color(0xFFF9F9F9)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF9F9F9),
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Color(0xFF606060)),
        ),
      ),
    ),
  );
}

Widget _refundCard(double width, double height) {
  return GestureDetector(
    onTap: (){
      NavigationService.navigateTo(Screens.refundRequestScreen);
    },
    child: Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Color(0xFFF8F8F8)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Header: Order ID + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID : 12345",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF606060)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Color(0xFF1156A9)),
                ),
                child: Text(
                  "Pending",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1156A9)),
                ),
              )
            ],
          ),

          SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// PRODUCT IMAGE BOX
              Container(
                width: 128,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: Color(0xFFBBBBBB).withOpacity(0.73), width: 0.5),
                ),
                child: Center(
                  child: Image.asset(
                    shoe,
                    width: 60,
                  ),
                ),
              ),

              SizedBox(width: 14),

              /// PRODUCT DETAILS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nike Sneakers",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A252F)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "\$ 15.00",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF27AE60),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Reason: There are many Variations of Pass...",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF15763D),
                        height: 1.38,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


