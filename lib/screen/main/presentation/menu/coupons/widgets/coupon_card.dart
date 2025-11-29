import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String code;
  final String date;
  final bool showStatus;

  const CouponCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.code,
    required this.date,
    this.showStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(176, 176, 176, 0.25),
                blurRadius: 22.6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Left Icon
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF27AE60).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.discount,
                  color: Color(0xFF27AE60),
                ),
              ),

              const SizedBox(width: 14),

              // ✅ Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF27AE60),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      code,
                      style: const TextStyle(
                        color: Color(0xFF27AE60),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

        // ✅ Optional Status Badge
        if (showStatus)
          Positioned(
            top: 12,
            right: 12,
            child: Switch(
              value: true,               // or bind to your state variable
              onChanged: (val) {/* update your state */},
              activeColor: const Color(0xFF27AE60),   // green thumb
              activeTrackColor: const Color(0xFF27AE60).withOpacity(.5),
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.withOpacity(.3),
            )
          ),
      ],
    );
  }
}
