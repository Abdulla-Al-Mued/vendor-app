import 'package:flutter/material.dart';

import '../../../../../../../asset_helper/ic_img_path.dart';

class OrderSettingsContent extends StatelessWidget {
  const OrderSettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // =========================
          // ✅ ORDER SETUP CARD
          // =========================
          _whiteCard(
            width,

            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Setup",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Here you can configure the settings related to orders",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF606060),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Re-order Level",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11.9,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                  const SizedBox(height: 6),

                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration(hint: "0"),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // =========================
          // ✅ BUSINESS TIN CARD
          // =========================
          _whiteCard(
            width,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Business TIN",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Here you can configure the settings related to orders",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF606060),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    decoration: _inputDecoration(
                      hint: "taxpayer Identification Number (TIN)",
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "Expire Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11.9,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                  const SizedBox(height: 6),

                  TextField(
                    readOnly: true,
                    decoration: _inputDecoration(
                      hint: "Select Date",
                      suffix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.calendar_month)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // =========================
          // ✅ TIN CERTIFICATE UPLOAD
          // =========================
          _whiteCard(
            width,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TIN Certificate",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "pdf, doc, jpg. File size: max 2 MB",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color(0xFF606060),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    height: 109,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFD5D5D5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          uploadDocImg,
                          width: 42,
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Upload File",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // =========================
          // ✅ ACTION BUTTONS
          // =========================
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBBBBBB).withOpacity(.73),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ✅ Shared White Card Style
  Widget _whiteCard(double width,
      {required Widget child}) {
    return Container(
      width: width > 400 ? 370 : width * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.32),
        border: Border.all(
          color: const Color(0xFFF8F8F8),
          width: 0.58,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: child,
    );
  }

  // ✅ Shared Input Decoration
  static InputDecoration _inputDecoration({
    required String hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffix,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11.9,
        color: Color(0xFF1A252F),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFECECEE),
          width: 2.24,
        ),
        borderRadius: BorderRadius.circular(8.96),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF27AE60),
          width: 2.24,
        ),
        borderRadius: BorderRadius.circular(8.96),
      ),
    );
  }
}
