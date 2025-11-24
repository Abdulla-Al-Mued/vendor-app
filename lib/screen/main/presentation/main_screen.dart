
import 'package:flutter/material.dart';
import 'package:vendor_app/screen/main/presentation/menu/presentation/menu_screen.dart';
import 'package:vendor_app/screen/main/presentation/my_order/presentation/my_order.dart';
import 'package:vendor_app/screen/main/presentation/refund/presentation/refund_screen.dart';

import 'home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyOrder(),
    RefundScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 49,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.receipt, 'My Orders', 1),
          _buildNavItem(Icons.money_off_rounded, 'Refund', 2),
          _buildNavItem(Icons.dashboard_customize_outlined, 'Menu', 3),

        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isActive = selectedIndex == index;

    return Expanded( // makes all items equal width
      child: Padding(
        padding: const EdgeInsets.all(6), // ⬅️ bigger tap area
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: const Color(0xFF27AE60).withOpacity(0.15),
          highlightColor: Colors.transparent,
          onTap: () => onItemTapped(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? const Color(0xFF27AE60)
                      : const Color(0xFFBBBBBB).withOpacity(0.73),
                  size: 26,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFF27AE60)
                        : const Color(0xFFBBBBBB).withOpacity(0.73),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
