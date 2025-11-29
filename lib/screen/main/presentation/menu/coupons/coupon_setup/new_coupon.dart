import 'package:flutter/material.dart';

class CouponSetupScreen extends StatelessWidget {
  const CouponSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ✅ TOP BAR
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new,
                      size: 16, color: Color(0xFF27AE60)),
                  SizedBox(width: 8),
                  Text(
                    "Coupon Setup",
                    style: TextStyle(
                      color: Color(0xFF27AE60),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// ✅ COUPON TYPE
              _label("Coupon Type"),
              _dropdownField("Discount on Purchase"),

              /// ✅ SELECT CUSTOMER
              _label("Select Customer"),
              _dropdownField("All Customer"),

              /// ✅ COUPON TITLE
              _label("Coupon Title"),
              _inputField("Title"),

              /// ✅ COUPON CODE
              _label("Coupon Code"),
              _inputField("Ex: ze5uzkyu0s"),

              /// ✅ DISCOUNT TYPE
              _label("Discount Type"),
              _dropdownField("Amount"),

              /// ✅ DISCOUNT AMOUNT
              _label("Discount Amount"),
              _inputField("Ex: 500"),

              /// ✅ MINIMUM PURCHASE
              _label("Minimum Purchase"),
              _inputField("Ex: 500"),

              /// ✅ START + EXPIRE DATE
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _dateField("Start Date"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _dateField("Expire Date"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// ✅ SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27AE60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ LABEL
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 18),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1A252F),
        ),
      ),
    );
  }

  // ✅ DROPDOWN FIELD
  Widget _dropdownField(String hint) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.9),
        border: Border.all(color: const Color(0xFFECECEE), width: 2.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: const TextStyle(
              color: Color(0xFF1A252F),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  // ✅ TEXT INPUT FIELD
  Widget _inputField(String hint) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.9),
        border: Border.all(color: const Color(0xFFECECEE), width: 2.2),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(187, 187, 187, 0.73),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ✅ DATE FIELD
  Widget _dateField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.9),
            border: Border.all(color: const Color(0xFFECECEE), width: 2.2),
          ),
          child: Row(
            children: const [
              Icon(Icons.calendar_month, size: 18, color: Color(0xFF27AE60),),
              SizedBox(width: 10),
              Text(
                "Select Date",
                style: TextStyle(
                  color: Color(0xFF606060),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
