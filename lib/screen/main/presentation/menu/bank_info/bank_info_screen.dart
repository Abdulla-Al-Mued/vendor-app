import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';
import 'package:vendor_app/router/screen_names.dart';

import '../../../../../asset_helper/ic_img_path.dart';

class BankInfoScreen extends StatelessWidget {
  const BankInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: height * 0.03),

              // --------------------------------------------------
              // TOP BAR: Back icon + Title "Bank info"
              // --------------------------------------------------
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF27AE60),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  const Text(
                    "Bank info",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              // --------------------------------------------------
              // HINT BANNER (greenish background)
              // --------------------------------------------------
              Container(
                width: width * 0.92,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.035,
                  vertical: height * 0.012,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F8EF),
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: const Color(0xFFF8F8F8)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: const Color(0xFFD7D7D7).withOpacity(0.25),
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27AE60),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Expanded(
                      child: Text(
                        "You should fill-up this information correctly as this "
                            "will be helpful for future transactions",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF27AE60),
                          height: 1.2,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE3E3E3),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                        color: Color(0xFF27AE60),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

              // --------------------------------------------------
              // BANK INFO CARD
              // --------------------------------------------------
              Container(
                width: width * 0.95,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.025,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xFFF8F8F8),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: const Color(0xFFD7D7D7).withOpacity(0.25),
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Holder Name Row
                        Row(
                          children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    // If you want background color or border, add here
                    // color: Colors.grey.shade200,
                  ),
                  child: const Icon(
                    Icons.perm_contact_calendar_rounded,
                    size: 30,
                    color: Colors.green,
                  ),
                ),

                  SizedBox(width: 5),
                            const Text(
                              "Holder name: Fatema",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A252F),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.025),

                        const Text(
                          "Bank Name : City Bank",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A252F),
                            height: 1.2,
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        const Text(
                          "Branch Name : Mirpur- 12",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A252F),
                            height: 1.2,
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        const Text(
                          "Account Number : 12345678",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A252F),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),

                    // EDIT Icon (Top Right)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: (){
                          NavigationService.navigateTo(Screens.editBankInfoScreen);
                        },
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: const Color(0xFFE3E3E3),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset(
                                editText,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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

