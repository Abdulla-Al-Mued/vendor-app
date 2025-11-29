import 'package:flutter/material.dart';

import '../../../../../../asset_helper/ic_img_path.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.8),
        border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA4A4A4).withOpacity(0.25),
            blurRadius: 15.85,
            offset: const Offset(0, 2.6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ DATE LABEL (TOP RIGHT)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F8EF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "12 Oct, 2022",
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xFF28AB7F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// ✅ MAIN ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ✅ IMAGE + TYPE
              Column(
                children: [
                  Container(
                    height: 86,
                    width: 128,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.8),
                      border: Border.all(
                        color: const Color(0xFFBBBBBB).withOpacity(0.73),
                        width: 0.48,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        compliant, // replace with your image
                        height: 56,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Physical",
                    style: TextStyle(
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              /// ✅ PRODUCT INFO
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ✅ TITLE
                    const Text(
                      "Leather Ladies Bag",
                      style: TextStyle(
                        color: Color(0xFF1A252F),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.38,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// ✅ SUBTITLE
                    const Text(
                      "Leather Ladies Bag",
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// ✅ STAR RATING
                    Row(
                      children: const [
                        Icon(Icons.star,
                            size: 12, color: Color(0xFFFDCC3F)),
                        SizedBox(width: 4),
                        Text(
                          "5.0/5",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// ✅ REVIEW TEXT
                    const Text(
                      "Product quality was good.",
                      style: TextStyle(
                        color: Color(0xFF606060),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
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
}
