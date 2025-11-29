import 'package:flutter/material.dart';

class CouponDetailsDialog extends StatelessWidget {
  const CouponDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFF8F8F8)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(215, 215, 215, 0.25),
              blurRadius: 1.53,
              offset: Offset(0, 1.53),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// ✅ TOP ROW
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// GREEN DISCOUNT CIRCLE
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFF27AE60),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "75.0%\noff",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                /// RIGHT TEXT INFO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "75% discount on",
                        style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Purchase",
                        style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Code : rFhfx7XiCm",
                        style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Discount on Purchase",
                        style: TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                /// ✅ CLOSE ICON
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFF606060),
                        width: 1.4,
                      ),
                    ),
                    child: const Icon(Icons.close, size: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            /// ✅ DETAILS INFORMATION
            _infoRow("Minimum Purchase : ", "\$ 7,000.00"),
            const SizedBox(height: 8),
            _infoRow("Maximum Discount : ", "\$ 75.00"),
            const SizedBox(height: 14),
            _infoRow("Start From : ", "09 Jan 2023 09.22 PM"),
            const SizedBox(height: 8),
            _infoRow("Expires On : ", "30 Jan 2029 07.00 PM"),
          ],
        ),
      ),
    );
  }

  /// ✅ REUSABLE INFO TEXT ROW
  Widget _infoRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title + value,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF606060),
            ),
          ),
        ),
      ],
    );
  }
}
