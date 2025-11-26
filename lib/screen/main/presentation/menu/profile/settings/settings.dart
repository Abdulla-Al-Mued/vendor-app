import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06, // ~27px in 393px width
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),

              // ---------------------------
              // Top Bar: Back Icon + Title
              // ---------------------------
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF27AE60),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              // -----------------------------------
              // LANGUAGE SELECT DROPDOWN CARD
              // -----------------------------------
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.045,
                  vertical: height * 0.012,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFF8F8F8),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF3F3F3).withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Left Section
                    Row(
                      children: [
                        // Language Icon
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/language.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: width * 0.03),

                        const Text(
                          "Select language",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            color: Color(0xFF1A252F),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Vertical Divider
                    Container(
                      width: 1,
                      height: 20,
                      color: const Color.fromRGBO(187, 187, 187, 0.733),
                    ),

                    SizedBox(width: width * 0.03),

                    // English (EN)
                    const Text(
                      "English (EN)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: Color(0xFF27AE60),
                      ),
                    ),

                    SizedBox(width: width * 0.01),

                    // Arrow Icon
                    Transform.rotate(
                      angle: -90 * 3.14159 / 180,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 12,
                        color: Color(0xFF2C3E50),
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
