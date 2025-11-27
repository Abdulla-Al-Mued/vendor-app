import 'package:flutter/material.dart';
import '../../../../../../../asset_helper/ic_img_path.dart';

Widget paymentInfo(){
  return Container(
    height: 44,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFFCEFDE),
      borderRadius: BorderRadius.circular(2.32),
      border: Border.all(
        color: const Color(0xFFF8F8F8),
        width: 0.58,
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFD7D7D7).withOpacity(0.25),
          blurRadius: 2.32,
          offset: const Offset(0, 2.32),
        ),
      ],
    ),
    child: Row(
      children: [
        /// ⚠️ Warning Icon
        Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFCBA4A),
          ),
          child: const Center(
            child: Icon(
              Icons.priority_high,
              size: 10,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// 📄 Warning Text
        Expanded(
          child: Text(
            "Please verify your payment information before submitting. Otherwise you will not receive any payment.",
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              fontSize: 8,
              height: 1.2,
              color: Color(0xFF1A252F),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget paymentInfo2(BuildContext context){
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// 📝 Title
      const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          "Payment Method List",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 13,
            letterSpacing: -0.26,
            color: Color(0xFF1A252F),
          ),
        ),
      ),

      /// 📦 Main Card
      Container(
        width: double.infinity,
        height: 219,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.32),
          border: Border.all(
            color: const Color(0xFFF8F8F8),
            width: 0.58,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD7D7D7).withOpacity(0.25),
              blurRadius: 2.32,
              offset: const Offset(0, 2.32),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 💳 Credit Card Image
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage(creditCard),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ❌ Empty Text
            const Text(
              "No payment info added yet",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 12,
                letterSpacing: -0.24,
                color: Color(0xFF606060),
              ),
            ),

            const SizedBox(height: 18),

            /// ➕ Add Button
            GestureDetector(
              onTap: () {
                // ✅ Navigate to Add Payment Screen
                Navigator.pop(context);
              },
              child: Container(
                width: 118,
                height: 31,
                decoration: BoxDecoration(
                  color: const Color(0xFF27AE60),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xFF27AE60),
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "+ Add Payment info",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.2,
                    color: Colors.white,
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