import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: size.width * 0.92,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ❌ CLOSE BUTTON
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 18),
              ),
            ),

            const SizedBox(height: 6),

            /// ✅ TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Filter Date",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A252F),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// ✅ DROPDOWNS
            _filterField("Select Product"),
            const SizedBox(height: 12),
            _filterField("Select Customer"),
            const SizedBox(height: 12),
            _filterField("Select Status"),

            const SizedBox(height: 18),

            /// ✅ DATE ROW
            Row(
              children: [
                Expanded(
                  child: _dateField("From"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _dateField("To"),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// ✅ SEARCH BUTTON
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27AE60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Search",
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
      ),
    );
  }

  /// ✅ DROPDOWN FIELD UI
  Widget _filterField(String hint) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
      ),
      child: Row(
        children: [
          Text(
            hint,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A252F),
            ),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }

  /// ✅ DATE FIELD UI
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
        const SizedBox(height: 6),
        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
          ),
          child: Row(
            children: const [
              Icon(Icons.calendar_month, size: 16, color: Color(0xFF606060)),
              SizedBox(width: 10),
              Text(
                "Select Date",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF606060),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
