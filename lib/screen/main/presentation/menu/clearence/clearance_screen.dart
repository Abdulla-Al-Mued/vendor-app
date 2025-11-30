import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';

import '../../../../../router/screen_names.dart';


class ClearanceScreen extends StatefulWidget {
  const ClearanceScreen({super.key});

  @override
  State<ClearanceScreen> createState() => _ClearanceSaleScreenState();
}

class _ClearanceSaleScreenState extends State<ClearanceScreen> {
  bool isOfferActive = false;
  String discountType = 'flat'; // 'flat' or 'product'
  String offerActiveTime = 'always'; // 'always' or 'specific'
  final TextEditingController _discountController = TextEditingController();

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context),

              SizedBox(height: screenHeight * 0.02),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.074),
                child: const Text(
                  'Active Clearance Sale Offer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.38,
                    color: Color(0xFF1A252F),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.015),

              // Toggle Switch Section
              _buildToggleSection(screenWidth),

              SizedBox(height: screenHeight * 0.01),

              // Setup Offer Logic Label
              Center(
                child: const Text(
                  'Setup Offer Logic',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF27AE60),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Date Range Section
              _buildDateRangeSection(screenWidth),

              SizedBox(height: screenHeight * 0.02),

              // Discount Type Section
              _buildDiscountTypeSection(screenWidth),

              SizedBox(height: screenHeight * 0.02),

              // Discount Amount Section
              _buildDiscountAmountSection(screenWidth),

              SizedBox(height: screenHeight * 0.02),

              // Offer Active Time Section
              _buildOfferActiveTimeSection(screenWidth),

              SizedBox(height: screenHeight * 0.04),

              // Action Buttons
              _buildActionButtons(screenWidth),

              SizedBox(height: screenHeight * 0.04),

              // Product List Section
              _buildProductListSection(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          NavigationService.navigateTo(Screens.productListScreen);
        },
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 12,
              )
            ],
          ),
          child: const Icon(Icons.add, color: Color(0xFF27AE60), size: 26),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.77, vertical: 24),
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
            'Clearance Sale',
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

  Widget _buildToggleSection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF27AE60)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Show your offer inj the store details page in customer website andapps',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1.18,
                  color: const Color(0xFF606060),
                ),
              ),
            ),
            const SizedBox(width: 8),
            _buildCustomToggle(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOfferActive = !isOfferActive;
        });
      },
      child: Container(
        width: 55,
        height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFFECF0F1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: AnimatedAlign(
          alignment: isOfferActive ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 18,
            height: 19,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateRangeSection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
      child: Row(
        children: [
          Expanded(
            child: _buildDateField('Start Date'),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: _buildDateField('End Date'),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF27AE60), width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.date_range,
                size: 24,
                color: const Color(0xFF27AE60),
              ),
              const SizedBox(width: 8),
              const Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.38,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountTypeSection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discount Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF27AE60).withOpacity(0.25),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildRadioOption('Flat Discount', 'flat', discountType),
                const SizedBox(width: 48),
                _buildRadioOption('Product wise Discount', 'product', discountType),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String label, String value, String groupValue) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          discountType = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF27AE60),
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF27AE60),
                  shape: BoxShape.circle,
                ),
              ),
            )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8C8C8C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountAmountSection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discount Amount',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF27AE60)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: _discountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        hintText: '0.0',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60).withOpacity(0.25),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferActiveTimeSection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Offer Active Time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 48,
            padding: const EdgeInsets.only(left: 16, right: 24),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF27AE60).withOpacity(0.25),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildRadioOption2('Always Active', 'always', offerActiveTime),
                const SizedBox(width: 48),
                Expanded(
                  child: _buildRadioOption2('Specific Time in Day', 'specific', offerActiveTime),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption2(String label, String value, String groupValue) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          offerActiveTime = value;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF27AE60),
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF27AE60),
                  shape: BoxShape.circle,
                ),
              ),
            )
                : null,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C8C8C),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Reset Button
        Container(
          width: 120,
          height: 51,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF27AE60).withOpacity(0.75),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Reset',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Save Button
        Container(
          width: 104,
          height: 51,
          decoration: BoxDecoration(
            color: const Color(0xFF27AE60),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }

  Widget _buildProductListSection(double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Product List',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          // Empty State
          SizedBox(
            height: 178,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.book_outlined,
                  size: 48,
                  color: const Color(0xFF989898),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Add Product show in the clearance offer sec',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8C8C8C),
                  ),
                ),
                const Text(
                  'customer app & website',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8C8C8C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
