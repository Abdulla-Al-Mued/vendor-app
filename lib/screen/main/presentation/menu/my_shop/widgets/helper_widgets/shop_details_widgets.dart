import 'package:flutter/material.dart';
import '../../../../../../../router/navigation_service.dart';
import '../../../../../../../router/screen_names.dart';

Widget buildBannerCard(double size) {
  return Container(
    height: 117,
    decoration: BoxDecoration(
      color: const Color(0xFFE9F8EF),
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFD7D7D7).withOpacity(0.25),
          blurRadius: 2.32,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          left: size * 0.145,
          top: 15,
          child: Container(
            width: 107,
            height: 87,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.32),
            ),
            child: const Icon(Icons.menu_book, size: 40, color: Colors.grey),
          ),
        ),
        Positioned(
          left: size * 0.48,
          top: 41,
          child: SizedBox(
            width: 125,
            child: Text(
              'Discover Your Next Great Read',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.89,
                height: 1.3,
                color: const Color(0xFF27AE60),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: (){
              NavigationService.navigateTo(Screens.editShopScreen);
            },
            child: Container(
              width: 27.43,
              height: 30.56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE3E3E3),
                    blurRadius: 1.65,
                    offset: const Offset(0, 1.1),
                  ),
                ],
              ),
              child: const Icon(
                Icons.edit,
                size: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50.48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.78),
                  Colors.white.withOpacity(0.78),
                ],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const SizedBox(width: 11),
                buildStoreInfo(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildStoreInfo() {
  return Row(
    children: [
      Container(
        width: 35.87,
        height: 36.54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.65),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFCCCCCC).withOpacity(0.25),
              blurRadius: 1.65,
              offset: const Offset(0, 1.65),
            ),
          ],
        ),
        child: const Icon(Icons.store, size: 20, color: Colors.grey),
      ),
      const SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book Store',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 6.6,
              color: const Color(0xFF27AE60),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Created at 15 Mar, 2022',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 4.95,
              color: const Color(0xFF606060),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildStatsCards() {
  return Container(
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStatCard('Products', '20', Icons.shopping_cart, true),
        buildStatCard('Orders', '26', Icons.receipt, false),
        buildStatCard('Reviews', '2', Icons.rate_review, false),
      ],
    ),
  );
}

Widget buildStatCard(String label, String value, IconData icon, bool isPrimary) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xFFECF0F1),
        border: Border.all(color: const Color(0xFFF9F9F9), width: 0.82),
        borderRadius: BorderRadius.circular(6.52),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF9F9F9),
            blurRadius: 3.26,
            offset: const Offset(0, 3.26),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Icon(icon, size: 18, color: isPrimary ? const Color(0xFF27AE60) : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xFF1A252F),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isPrimary ? const Color(0xFF27AE60) : const Color(0xFF606060),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget buildSuccessBanner() {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      color: const Color(0xFF93FFC1).withOpacity(0.28),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        const SizedBox(width: 21),
        const Icon(
          Icons.tips_and_updates_outlined,
          color: Color(0xFF27AE60),
          size: 24,
        ),
        const SizedBox(width: 8),
        Text(
          'Your shop is running up to date.',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color(0xFF27AE60),
          ),
        ),
      ],
    ),
  );
}
