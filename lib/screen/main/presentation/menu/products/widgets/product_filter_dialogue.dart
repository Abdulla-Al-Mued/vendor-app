import 'package:flutter/material.dart';

class ProductFilterDialog extends StatelessWidget {
  const ProductFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        child: Column(
          children: [
            /// ✅ HEADER
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Filter Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A252F),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF606060)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.close,
                          size: 18, color: Color(0xFF606060)),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            /// ✅ SCROLLABLE BODY
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ✅ PRODUCT TYPE
                    _title("Product Type"),
                    _borderBoxRow("All"),

                    const SizedBox(height: 18),

                    /// ✅ PRICE RANGE
                    _title("Price Range"),
                    const Divider(color: Color(0xFF27AE60), thickness: 2),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(child: _valueBox("0")),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text("—"),
                        ),
                        Expanded(child: _valueBox("400")),
                        const SizedBox(width: 8),
                        _greenArrowButton(),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// ✅ CREATED AT
                    _title("Created At"),
                    Row(
                      children: [
                        Expanded(child: _dateBox("dd-mm-yyyy")),
                        const SizedBox(width: 10),
                        Expanded(child: _dateBox("dd-mm-yyyy")),
                        const SizedBox(width: 10),
                        _calendarBox(),
                      ],
                    ),

                    const SizedBox(height: 26),

                    /// ✅ BRANDS
                    _title("Brands"),
                    _checkItem("Francisco Electrical"),
                    _checkItem("Timmerman"),
                    _checkItem("Borcelle"),
                    _checkItem("Electric Vehicle"),

                    const SizedBox(height: 26),

                    /// ✅ PUBLISHER
                    _title("Publisher"),
                    _checkItem("Unknown"),

                    const SizedBox(height: 26),

                    /// ✅ AUTHOR
                    _title("Author"),
                    _checkItem("Unknown"),

                    const SizedBox(height: 26),

                    /// ✅ CATEGORY
                    _title("Category"),
                    _checkItem("Books & Stationery"),
                    _checkItem("Travel & Luggage"),
                    _checkItem("Digital Products"),
                    _checkItem("Automotive"),

                    const SizedBox(height: 16),

                    /// ✅ VIEW MORE
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            "View more",
                            style: TextStyle(
                              color: Color(0xFF27AE60),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Divider(
                            color: Color(0xFF27AE60),
                            thickness: 1,
                            indent: 120,
                            endIndent: 120,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ✅ BOTTOM BUTTONS
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFF27AE60),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          "Clear Filter",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: const Color(0xFF27AE60)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          "Filter",
                          style: TextStyle(
                              color: Color(0xFF27AE60),
                              fontWeight: FontWeight.w600),
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
    );
  }

  // ✅ REUSABLE WIDGETS BELOW

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A252F),
        ),
      ),
    );
  }

  Widget _borderBoxRow(String value) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1A252F)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _valueBox(String value) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        border:
        Border.all(color: const Color(0xFFBBBBBB)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(color: Color(0xFF606060)),
        ),
      ),
    );
  }

  Widget _greenArrowButton() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF27AE60),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.arrow_forward,
          color: Colors.white),
    );
  }

  Widget _dateBox(String value) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border:
        Border.all(color: const Color(0xFF1A252F)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(value),
      ),
    );
  }

  Widget _calendarBox() {
    return Container(
      height: 45,
      width: 55,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF1A252F)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.calendar_today, size: 20,color: Colors.black54),
    );
  }

  Widget _checkItem(String text) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(text,
                  style: const TextStyle(color: Color(0xFF606060))),
            ),
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF606060)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xFFEFEFEF)),
      ],
    );
  }
}
