import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with back button and status
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF27AE60), width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFF27AE60),
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Product Details',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.6,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF27AE60),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Active',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Tabs
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTabIndex = 0;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(8),
                            child: Text(
                              'Product Details',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _selectedTabIndex == 0 ? Colors.black : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 92),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTabIndex = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Reviews',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _selectedTabIndex == 1 ? Colors.black : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      children: [
                        Container(
                          height: 2.5,
                          width: double.infinity,
                          color: const Color(0xFFBBBBBB).withOpacity(0.73),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          left: _selectedTabIndex == 0 ? 0 : 184,
                          child: Container(
                            height: 2.5,
                            width: 184,
                            color: const Color(0xFF27AE60),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Tab Content
              _selectedTabIndex == 0 ? _buildProductDetailsTab() : _buildReviewsTab(),

              const SizedBox(height: 24),

              // Edit Products Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: 369,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Products',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFFE9F8EF),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailsTab() {
    return Column(
      children: [
        // Product Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.5),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
              borderRadius: BorderRadius.circular(2.32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  blurRadius: 2.32,
                  offset: const Offset(0, 2.32),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Product Image
                    Container(
                      width: 160,
                      height: 141,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFBBBBBB).withOpacity(0.73),
                          width: 0.48,
                        ),
                        borderRadius: BorderRadius.circular(5.8),
                      ),
                      child: Center(
                        child: Container(
                          width: 80,
                          height: 76,
                          color: Colors.grey[300],
                          child: const Icon(Icons.shopping_bag, size: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    // Product Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Leather Ladies Bag',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1.38,
                              color: Color(0xFF1A252F),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '\$ 15.00',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.03,
                              color: Color(0xFF27AE60),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF28AB7F)),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Approved',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 11.44,
                                height: 1.38,
                                color: Color(0xFF28AB7F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Thumbnail Images
                Row(
                  children: [
                    ...List.generate(3, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index > 0 ? 12 : 0),
                        child: Container(
                          width: 48,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFBBBBBB).withOpacity(0.73),
                              width: 0.48,
                            ),
                            borderRadius: BorderRadius.circular(5.8),
                          ),
                          child: Center(
                            child: Container(
                              width: 32,
                              height: 31,
                              color: Colors.grey[300],
                              child: const Icon(Icons.shopping_bag, size: 16, color: Colors.grey),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // General Information Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.5),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
              borderRadius: BorderRadius.circular(2.32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  blurRadius: 2.32,
                  offset: const Offset(0, 2.32),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'General Information',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.38,
                    color: Color(0xFF1A252F),
                  ),
                ),
                const SizedBox(height: 12),
                _buildInfoRow('Product Type', 'Physical'),
                const SizedBox(height: 6),
                _buildInfoRow('Product Unit', 'kg'),
                const SizedBox(height: 6),
                _buildInfoRow('Current Stock', '120'),
                const SizedBox(height: 6),
                _buildInfoRow('Product SKU', '171346'),
                const SizedBox(height: 18),
                Container(
                  height: 1,
                  color: const Color(0xFFBBBBBB).withOpacity(0.73),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Price Information',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.38,
                    color: Color(0xFF1A252F),
                  ),
                ),
                const SizedBox(height: 12),
                _buildInfoRow('Unit Price', '\$ 15.00'),
                const SizedBox(height: 6),
                _buildInfoRow('Shipping cost', 'kg'),
                const SizedBox(height: 6),
                _buildInfoRow('Discount', '0.0%'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Description Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.5),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
              borderRadius: BorderRadius.circular(2.32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  blurRadius: 2.32,
                  offset: const Offset(0, 2.32),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.25,
                    color: Color(0xFF1A252F),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Upgrade your style with this sophisticated Leather Ladies Bag, designed for modern women who value both elegance and functionality. Crafted from premium quality leather, this bag......Show more',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.21,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Column(
      children: [
        // Overall Rating Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.5),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
              borderRadius: BorderRadius.circular(2.32),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  blurRadius: 2.32,
                  offset: const Offset(0, 2.32),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    const Text(
                      '4.5',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Color(0xFF1A252F),
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_half,
                          color: const Color(0xFFFFC107),
                          size: 20,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '127 Reviews',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    children: [
                      _buildRatingBar(5, 85),
                      _buildRatingBar(4, 10),
                      _buildRatingBar(3, 3),
                      _buildRatingBar(2, 1),
                      _buildRatingBar(1, 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Customer Reviews
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customer Reviews',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF1A252F),
                ),
              ),
              const SizedBox(height: 12),
              _buildReviewCard(
                name: 'Sarah Johnson',
                rating: 5,
                date: 'Nov 15, 2025',
                review:
                'Absolutely love this bag! The leather quality is exceptional and it fits all my daily essentials perfectly. Worth every penny!',
                verified: true,
              ),
              const SizedBox(height: 12),
              _buildReviewCard(
                name: 'Emily Chen',
                rating: 5,
                date: 'Nov 10, 2025',
                review:
                'Beautiful bag with elegant design. The craftsmanship is outstanding and it goes well with both casual and formal outfits.',
                verified: true,
              ),
              const SizedBox(height: 12),
              _buildReviewCard(
                name: 'Jessica Martinez',
                rating: 4,
                date: 'Nov 5, 2025',
                review:
                'Great quality bag! Only giving 4 stars because it took a bit longer to ship than expected. But the product itself is fantastic.',
                verified: false,
              ),
              const SizedBox(height: 12),
              _buildReviewCard(
                name: 'Amanda Wilson',
                rating: 5,
                date: 'Oct 28, 2025',
                review:
                'This is my third purchase from this brand. The consistency in quality is impressive. Highly recommend!',
                verified: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, int percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$stars',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.star,
            color: const Color(0xFFFFC107),
            size: 12,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: percentage / 100,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC107),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$percentage%',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard({
    required String name,
    required int rating,
    required String date,
    required String review,
    required bool verified,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(2.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFF27AE60).withOpacity(0.2),
                child: Text(
                  name[0],
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF27AE60),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                        if (verified) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.verified,
                            size: 14,
                            color: Color(0xFF27AE60),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: const Color(0xFFFFC107),
                              size: 14,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.38,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.38,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}