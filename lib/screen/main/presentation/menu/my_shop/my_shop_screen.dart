import 'package:flutter/material.dart';
import 'package:vendor_app/screen/main/presentation/menu/my_shop/widgets/helper_widgets/other_setup.dart';
import 'package:vendor_app/screen/main/presentation/menu/my_shop/widgets/helper_widgets/payment_info.dart';
import 'package:vendor_app/screen/main/presentation/menu/my_shop/widgets/helper_widgets/shop_details_widgets.dart';

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({super.key});

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  bool isStoreActive = true;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.026;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(padding),
                SizedBox(height: size.height * 0.02),

                // Tab Navigation
                _buildTabNavigation(),

                // Content for selected tab
                _buildTabContent(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(Size size) {
    switch (selectedTab) {
      case 0:
        return _buildShopDetailsContent(size);
      case 1:
        return _buildPaymentInfoContent(size);
      case 2:
        return _buildOtherSetupContent(size);
      default:
        return _buildShopDetailsContent(size);
    }
  }

  Widget _buildShopDetailsContent(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.025),
        buildBannerCard(size.width),
        SizedBox(height: size.height * 0.025),
        buildStatsCards(),
        SizedBox(height: size.height * 0.025),
        buildSuccessBanner(),
        SizedBox(height: size.height * 0.025),
        buildSetupStoreMode(),
        SizedBox(height: size.height * 0.03),
      ],
    );
  }

  Widget _buildPaymentInfoContent(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Column(
        children: [
          paymentInfo(),
          SizedBox(height: 20,),
          paymentInfo2(context),

        ],
      ),
    );
  }

  Widget _buildOtherSetupContent(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: OrderSettingsContent(),
    );
  }

  Widget _buildHeader(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding * 1.5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF27AE60),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF27AE60),
              size: 12,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'My Shop',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.63,
              color: Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      height: 81,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(2.33),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.33,
            offset: const Offset(0, 2.33),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab('Shop Details', 0),
          _buildTab('Payment info', 1),
          _buildTab('Other Setup', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 22),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFFECF0F1),
            border: Border.all(color: const Color(0xFFF9F9F9), width: 0.82),
            borderRadius: BorderRadius.circular(6.56),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF9F9F9),
                blurRadius: 3.28,
                offset: const Offset(0, 3.28),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 9.05,
                color: isSelected ? const Color(0xFF1A252F) : const Color(0xFF606060),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSetupStoreMode() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFC2C2C2).withOpacity(0.25),width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Setup Store Mode',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildStoreAvailability(),
                const SizedBox(height: 16),
                _buildVacationMode(),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStoreAvailability() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store Availability',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF1A252F),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              'Turning off the status will deactivate your shop. Customers will see \'Store Unavailable\' On the app and website untill turn on.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.38,
                color: const Color(0xFF606060),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFBFBFBF), width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isStoreActive = !isStoreActive;
                    });
                  },
                  child: Container(
                    width: 55,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isStoreActive ? const Color(0xFF27AE60) : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      alignment: isStoreActive ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
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
    );
  }

  Widget _buildVacationMode() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5).withOpacity(0.73),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Go Vacation Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'If you turn on your shop will go to vacation mode. Customer can view your shop but can\'t order to you',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.38,
                    color: const Color(0xFF606060),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
