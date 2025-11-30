import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> selectedProducts = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.022),

            // Header
            _buildHeader(context, screenWidth),

            SizedBox(height: screenHeight * 0.024),

            // Search Bar
            _buildSearchBar(screenWidth),

            SizedBox(height: screenHeight * 0.024),

            // Product List (Empty State or List)
            Expanded(
              child: selectedProducts.isEmpty
                  ? _buildEmptyState()
                  : _buildProductList(),
            ),

            // Bottom Action Buttons
            _buildActionButtons(screenWidth),

            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
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
                size: 14,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Clearance Sale',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27AE60),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Product List',
                style: TextStyle(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27AE60),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.028),
      child: Container(
        height: 47,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFBBBBBB).withOpacity(0.73),
            width: 0.87,
          ),
          borderRadius: BorderRadius.circular(10.38),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.62),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(
                    fontSize: 10.38,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search Products',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: const Color(0xFFBBBBBB).withOpacity(0.73),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            Container(
              width: 58.01,
              height: 47.6,
              decoration: const BoxDecoration(
                color: Color(0xFF27AE60),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.38),
                  bottomRight: Radius.circular(10.38),
                ),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 21.63,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'No products selected',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Search and add products to the list',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: selectedProducts.length,
      itemBuilder: (context, index) {
        final product = selectedProducts[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFECECEE),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              // Product Image Placeholder
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.image,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(width: 12),
              // Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'] ?? 'Product Name',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product['price'] ?? '0.00'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF27AE60),
                      ),
                    ),
                  ],
                ),
              ),
              // Remove Button
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    selectedProducts.removeAt(index);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC84D4D).withOpacity(0.75),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFC84D4D).withOpacity(0.75),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 21),

          // Add Products Button
          Expanded(
            child: InkWell(
              onTap: () {
                // Show product selection dialog or navigate to product selection
                _showAddProductDialog();
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF99FFC4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Add Products',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF27AE60),
            ),
            onPressed: () {
              // Add product to list
              setState(() {
                selectedProducts.add({
                  'name': 'Sample Product ${selectedProducts.length + 1}',
                  'price': '99.99',
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}