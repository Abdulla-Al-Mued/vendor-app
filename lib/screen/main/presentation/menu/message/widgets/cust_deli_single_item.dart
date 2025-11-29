import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(8.65),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Profile avatar
          Stack(
            children: [
              Container(
                width: 50.25,
                height: 50.25,
                decoration: const BoxDecoration(
                  color: Color(0xFFECF0F1), // secondary - light
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/icons/ic_inbox_single_item.png',
                  width: 40.42,
                  height: 40.42,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                right: 0,
                bottom: 5,
                child: Transform.rotate(
                  angle: 60.37 * 3.1416 / 180,
                  child: Container(
                    width: 10.92,
                    height: 10.92,
                    decoration: const BoxDecoration(
                      color: Color(0xFF27AE60), // primary
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          // Text info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Will Smith',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF1A252F),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '880 1234567890',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF606060),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Yes..',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF606060),
                  ),
                ),
              ],
            ),
          ),

          // Time text
          const Text(
            '2 Years ago',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF606060),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
