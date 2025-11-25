import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 32.0 : 11.38;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                // Header
                _buildHeader(),
                const SizedBox(height: 8),

                // Profile Card
                _buildProfileCard(),
                const SizedBox(height: 24),

                // Statistics Cards
                _buildStatisticsCards(),
                const SizedBox(height: 24),

                // Menu Options
                _buildMenuOption(
                  icon: Icons.wb_sunny_outlined,
                  title: 'Dark Mode',
                  trailing: _buildDarkModeToggle(),
                  iconColor: const Color(0xFF27AE60),
                ),
                const SizedBox(height: 12),

                _buildMenuOption(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {},
                  showArrow: true,
                ),
                const SizedBox(height: 12),

                _buildMenuOption(
                  icon: Icons.account_balance_outlined,
                  title: 'Bank Info',
                  onTap: () {},
                  showArrow: true,
                  iconColor: const Color(0xFF27AE60),
                ),
                const SizedBox(height: 12),

                _buildMenuOption(
                  icon: Icons.delete_outline,
                  title: 'Delete Account',
                  onTap: () {},
                  showArrow: true,
                  iconColor: const Color(0xFFFD5A5B),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 16),
            color: const Color(0xFF27AE60),
            onPressed: () {},
          ),
          const Text(
            'My Profile',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF27AE60),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      color: const Color(0xFF27AE60),
      surfaceTintColor: const Color(0xFF27AE60),
      shape: RoundedRectangleBorder(      // <-- rounded corners
        borderRadius: BorderRadius.circular(12),   // adjust to your design
      ),
      child: Container(
        width: double.infinity,
        height: 123,
        child: Stack(
          children: [
            // Decorative Circle
            Positioned(
              right: -20,
              top: -50,
              child: SizedBox(
                height: 123,
                child: Center(
                  child: Container(
                    // --- outer pale halo ---------------------------------------------
                    width: 70,                       // size of the big circle
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(150, 255, 194, 0.3),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      // --- inner solid disc -----------------------------------------
                      width: 56,                     // size of the small circle
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27AE60),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
            ),

            Positioned(
              right: -5,
              top: -5,
              child: IconButton(
              icon: const Icon(Icons.edit, size: 18),
              color: Colors.white,
              onPressed: () {},
            ),),


            // Profile Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.5, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Profile Image
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),

                      // User Info
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Karmrujjaman joy',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '+1016333333339',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Edit Button

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.widgets_outlined,
            value: '20',
            label: 'Products',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.shopping_bag_outlined,
            value: '25',
            label: 'Orders',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.attach_money,
            value: '\$ 10.1 K',
            label: 'Earned',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      height: 94.73,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
        borderRadius: BorderRadius.circular(7.83),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA4A4A4).withOpacity(0.25),
            blurRadius: 15.85,
            offset: const Offset(0, 2.61),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25.29,
            color: const Color(0xFF27AE60),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF27AE60),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Color(0xFF606060),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Widget? trailing,
    bool showArrow = false,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7.83),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
          borderRadius: BorderRadius.circular(7.83),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA4A4A4).withOpacity(0.25),
              blurRadius: 15.85,
              offset: const Offset(0, 2.61),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: iconColor ?? const Color(0xFF1A252F),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF1A252F),
                    ),
                  ),
                ],
              ),
              if (trailing != null)
                trailing
              else if (showArrow)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF27AE60),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDarkModeToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
      },
      child: Container(
        width: 50.4,
        height: 20.04,
        decoration: BoxDecoration(
          color: const Color(0xFFE9F8EF),
          borderRadius: BorderRadius.circular(14.4),
        ),
        child: AnimatedAlign(
          alignment: isDarkMode ? Alignment.centerLeft : Alignment.centerRight,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 15.51,
            height: 15.51,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF696969).withOpacity(0.25),
                  blurRadius: 14.22,
                  offset: const Offset(0, 3.6),
                ),
              ],
            ),
            child: const Icon(
              Icons.wb_sunny,
              size: 10,
              color: Color(0xFFFFD04C),
            ),
          ),
        ),
      ),
    );
  }
}
