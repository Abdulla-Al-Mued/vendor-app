import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VatReportScreen extends ConsumerWidget {
  const VatReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              /// ---------- HEADER ----------
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF27AE60), width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.arrow_back_ios,
                          size: 14, color: Color(0xFF27AE60)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Reports",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              /// ---------- TAX ICON ----------
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.eighteen_mp),
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),

              /// ---------- VAT REPORT TEXT ----------
              Text(
                "Vat report",
                style: TextStyle(
                  color: const Color(0xFF1A252F),
                  fontFamily: 'Inter',
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              /// ---------- CARD ----------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFECECEE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "See VAT collected and applied on transactions",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: const Color.fromRGBO(187, 187, 187, 0.73),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27AE60),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 14),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

