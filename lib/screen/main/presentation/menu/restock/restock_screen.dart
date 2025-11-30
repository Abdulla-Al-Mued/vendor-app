import 'package:flutter/material.dart';

class RestockScreen extends StatefulWidget {
  const RestockScreen({super.key});

  @override
  State<RestockScreen> createState() => _RestockListScreenState();
}

class _RestockListScreenState extends State<RestockScreen> {
  String selectedCategory = 'All';

  final List<Map<String, String>> categories = [
    {'name': 'All', 'selected': 'true'},
    {'name': 'Book & Stationery', 'selected': 'false'},
    {'name': 'Travel & Luggage', 'selected': 'false'},
    {'name': 'Dijital Products', 'selected': 'false'},
    {'name': 'Automotive', 'selected': 'false'},
    {'name': 'Gift & Crafts', 'selected': 'false'},
    {'name': 'Musical Instruments', 'selected': 'false'},
    {'name': 'Groceries & Dailies', 'selected': 'false'},
    {'name': 'Electronics & Gadgets', 'selected': 'false'},
    {'name': 'Phone & Gadgets', 'selected': 'false'},
    {'name': 'Sports & Outdoor', 'selected': 'false'},
    {'name': 'Baby & Toddler', 'selected': 'false'},
    {'name': 'Home & Kitchen', 'selected': 'false'},
    {'name': 'Helth & Beuty', 'selected': 'false'},
    {'name': 'Women\'s Fashion', 'selected': 'false'},
    {'name': 'Men\'s Fashion', 'selected': 'false'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            SizedBox(height: screenHeight * 0.02),

            // Categories Container
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.032),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF8F8F8),
                      width: 0.58,
                    ),
                    borderRadius: BorderRadius.circular(2.32),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD7D7D7).withOpacity(0.25),
                        offset: const Offset(0, 2.32),
                        blurRadius: 2.32,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Category Grid
                      Padding(
                        padding: const EdgeInsets.all(11.5),
                        child: _buildCategoryGrid(screenWidth),
                      ),

                      // Empty State
                      Expanded(
                        child: Center(
                          child: _buildEmptyState(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.7, vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Request Restock List',
            style: TextStyle(
              fontSize: 14.6,
              fontWeight: FontWeight.w500,
              color: Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(double screenWidth) {
    return Column(
      children: [
        // Row 1
        _buildCategoryRow([
          categories[0], // All
          categories[1], // Book & Stationery
          categories[2], // Travel & Luggage
        ]),

        const SizedBox(height: 14),

        // Row 2
        _buildCategoryRow([
          categories[3], // Dijital Products
          categories[4], // Automotive
          categories[5], // Gift & Crafts
        ]),

        const SizedBox(height: 14),

        // Row 3
        _buildCategoryRow([
          categories[6], // Musical Instruments
          categories[7], // Groceries & Dailies
          categories[8], // Electronics & Gadgets
        ]),

        const SizedBox(height: 14),

        // Row 4
        _buildCategoryRow([
          categories[9], // Phone & Gadgets
          categories[10], // Sports & Outdoor
          categories[11], // Baby & Toddler
        ]),

        const SizedBox(height: 14),

        // Row 5
        _buildCategoryRow([
          categories[12], // Home & Kitchen
          categories[13], // Helth & Beuty
          categories[11], // Baby & Toddler (duplicate in design)
        ]),

        const SizedBox(height: 14),

        // Row 6
        _buildCategoryRow([
          categories[12], // Home & Kitchen (duplicate in design)
          categories[14], // Women's Fashion
          categories[15], // Men's Fashion
        ]),
      ],
    );
  }

  Widget _buildCategoryRow(List<Map<String, String>> rowCategories) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowCategories.map((category) {
        return _buildCategoryChip(category['name']!);
      }).toList(),
    );
  }

  Widget _buildCategoryChip(String label) {
    final isSelected = selectedCategory == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = label;
          });
        },
        child: Container(
          height: 37,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFFECF0F1),
            border: Border.all(
              color: const Color(0xFFF9F9F9),
              width: 0.82,
            ),
            borderRadius: BorderRadius.circular(6.52),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF9F9F9),
                offset: const Offset(0, 3.26),
                blurRadius: 3.26,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  height: 1.38,
                  color: isSelected
                      ? const Color(0xFF1A252F)
                      : const Color(0xFF606060),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Empty Icon
        Container(
          width: 62.21,
          height: 62.21,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.inventory_2_outlined,
            size: 32,
            color: Colors.grey.shade400,
          ),
        ),

        const SizedBox(height: 12),

        // Empty Text
        Text(
          'Product not Found',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.02,
            color: const Color(0xFFBBBBBB).withOpacity(0.73),
          ),
        ),
      ],
    );
  }
}
