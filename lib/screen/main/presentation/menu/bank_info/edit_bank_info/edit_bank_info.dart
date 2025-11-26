import 'package:flutter/material.dart';

class EditBankInfoPage extends StatelessWidget {
  const EditBankInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),

              /// --- Back Icon and Title ---
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF27AE60), width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Bank info",
                    style: TextStyle(
                      fontSize: 14.6,
                      color: const Color(0xFF27AE60),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              /// --- A/C Holder Name ---
              buildLabel("A/C Holder Name"),
              buildInputBox("Fatema"),

              SizedBox(height: height * 0.025),

              /// --- Bank Name ---
              buildLabel("Bank Name"),
              buildInputBox("City Bank"),

              SizedBox(height: height * 0.025),

              /// --- Branch Name ---
              buildLabel("Branch Name"),
              buildInputBox("Mirpur-12"),

              SizedBox(height: height * 0.025),

              /// --- A/C No ---
              buildLabel("A/C No"),
              buildInputBox("12345678"),

              SizedBox(height: height * 0.04),

              /// --- Save Button ---
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27AE60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Label Widget
  Widget buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: const Color(0xFF1A252F),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Input Box Widget
  Widget buildInputBox(String text) {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFECECEE), width: 2.2),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF606060),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
