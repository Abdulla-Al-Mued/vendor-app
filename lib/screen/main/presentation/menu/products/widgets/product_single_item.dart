import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  final String title;
  final String price;
  final String status;

  const ProductCardItem({
    super.key,
    required this.title,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE3E3E3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.25),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          /// ✅ Left Image Box
          Column(
            children: [
              Container(
                height: 75,
                width: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE9F8EF)),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 34),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Digital",
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          /// ✅ Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF71E4A2).withOpacity(.33),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Approved",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF606060),
                  ),
                ),
              ],
            ),
          ),

          /// ✅ More Button
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 6,
                )
              ],
            ),
            child: const Icon(Icons.more_horiz, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
