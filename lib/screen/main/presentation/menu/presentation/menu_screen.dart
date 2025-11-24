import 'package:flutter/material.dart';

import '../../../../../asset_helper/ic_img_path.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List<_MenuItem> menuItems = [
    _MenuItem('Profile', user),
    _MenuItem('My Shop', myCart),
    _MenuItem('Add product', addToCart),
    _MenuItem('Products', cubes),
    _MenuItem('Reviews', customerFeedback),
    _MenuItem('Coupons', discount),
    _MenuItem('POS', printer),
    _MenuItem('Settings', setting),
    _MenuItem('Restock', stock),
    _MenuItem('Clearance ...', megaphones),
    _MenuItem('Wallet', wallet),
    _MenuItem('Message', chatting),
    _MenuItem('Vat Report', vat),
    _MenuItem('Bank Info', bank),
    _MenuItem('Terms & C...', termsAndConditions),
    _MenuItem('About Us', group),
    _MenuItem('Privacy Poli...', webServer),
    _MenuItem('Refund Poli...', receipt),
    _MenuItem('Return Poli...', returnIcon),
    _MenuItem('Cancellatio...', file),
    _MenuItem('Setup & star Selling', compliant),
    _MenuItem('Sign out', logout),
    _MenuItem('v - 15.5', info),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF27AE60),
                  ),
                ),
              ),
            ),

            // Menu Grid
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 11.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFF8F8F8), width: 0.58),
                  borderRadius: BorderRadius.circular(2.32),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD7D7D7).withOpacity(0.25),
                      blurRadius: 2.32,
                      offset: Offset(0, 2.32),
                    ),
                  ],
                ),
                child: GridView.builder(
                  padding: EdgeInsets.all(11.5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 109 / 80,
                  ),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return _buildMenuItem(
                        menuItems[index].title, menuItems[index].iconPath);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String iconPath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE3E3E3), width: 0.65),
        borderRadius: BorderRadius.circular(7.83),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA4A4A4).withOpacity(0.25),
            blurRadius: 15.85,
            offset: Offset(0, 2.61),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1.38,
                letterSpacing: 0,
                color: Color(0xFF606060),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String iconPath;

  _MenuItem(this.title, this.iconPath);
}

// Example usage in main.dart:
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuScreen(),
//   ));
// }
