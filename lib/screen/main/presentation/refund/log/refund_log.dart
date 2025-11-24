import 'package:flutter/material.dart';

class ChangeLogScreen extends StatelessWidget {
  const ChangeLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF27AE60), width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.arrow_back_ios,
                        size: 10, color: Color(0xFF27AE60)),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Change Log",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF27AE60),
                      letterSpacing: -0.02,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // --- FIRST BLOCK ---
              Text(
                "Refund Request: 12 Oct, 2022\nPaid by: Paypal",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.withOpacity(0.75),
                  height: 2.12,
                ),
              ),

              const SizedBox(height: 25),

              // Timeline section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT Timeline Icon + Line
                  Column(
                    children: [
                      // First Green Circle
                      Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Color(0xFF27AE60),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.check,
                              size: 20, color: Colors.white),
                        ),
                      ),

                      // Vertical line
                      Container(
                        width: 3,
                        height: 66,
                        color: const Color(0xFF27AE60),
                      ),

                      // Second Green Circle
                      Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Color(0xFF27AE60),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.check,
                              size: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 15),

                  // RIGHT Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refund Request Status: Approved\nUpdated By: admin\nReason: approved",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.withOpacity(0.75),
                            height: 1.95,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          "Refund Request Status: Refunded\nUpdated By: admin\nReason: payment",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.withOpacity(0.75),
                            height: 1.95,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
