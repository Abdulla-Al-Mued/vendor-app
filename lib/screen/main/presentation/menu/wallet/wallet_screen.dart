import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.015),

              // Header
              _buildHeader(context),

              SizedBox(height: screenHeight * 0.025),

              // Wallet Card
              _buildWalletCard(screenWidth),

              SizedBox(height: screenHeight * 0.025),

              // Statistics Cards
              _buildStatisticsCards(screenWidth),

              SizedBox(height: screenHeight * 0.025),

              // Transaction History Header
              _buildTransactionHeader(screenWidth),

              SizedBox(height: screenHeight * 0.02),

              // Transaction List
              _buildTransactionList(screenWidth),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Color(0xFF27AE60),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Wallet',
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

  Widget _buildWalletCard(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.032),
      child: Container(
        width: double.infinity,
        height: 168,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF27AE60), Color(0xFF27AE60)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Decorative circles
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                width: 179,
                height: 149.22,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9).withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Withdraw Icon
                  Container(
                    width: 47.24,
                    height: 47.24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Color(0xFF27AE60),
                      size: 24,
                    ),
                  ),

                  const Spacer(),

                  // Balance Info
                  const Text(
                    'Withdrawable Balance',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    '\$ 10,081.50',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Withdraw Button
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Withdraw',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCards(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.032),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
          borderRadius: BorderRadius.circular(7.83),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA4A4A4).withOpacity(0.25),
              offset: const Offset(0, 2.61),
              blurRadius: 15.85,
            ),
          ],
        ),
        child: Column(
          children: [
            // Navigation Arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildArrowButton(Icons.arrow_back_ios, true),
                _buildArrowButton(Icons.arrow_forward_ios, false),
              ],
            ),

            const SizedBox(height: 12),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    '\$ 600.00',
                    'Withdrawn',
                    const Color(0xFF27AE60),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    '\$ 500.00',
                    'Pending Withdrawn',
                    const Color(0xFFBC9F00),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    '\$ 6,401.00',
                    'Commission',
                    const Color(0xFFC9B30E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, bool isLeft) {
    return Container(
      width: 31.79,
      height: 31.79,
      decoration: const BoxDecoration(
        color: Color(0xFF27AE60),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 16,
        color: Colors.white,
      ),
    );
  }

  Widget _buildStatCard(String amount, String label, Color amountColor) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
        borderRadius: BorderRadius.circular(7.83),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA4A4A4).withOpacity(0.25),
            offset: const Offset(0, 2.61),
            blurRadius: 15.85,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: amountColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8C8C8C),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHeader(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.032),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Transaction History',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A252F),
            ),
          ),
          Row(
            children: [
              const Text(
                'View All',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.02,
                  color: Color(0xFF27AE60),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Color(0xFF27AE60),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(double screenWidth) {
    final transactions = [
      {
        'id': '#11',
        'amount': '\$500.00',
        'date': '12- Oct 2022 03.39 AM',
        'status': 'denied',
      },
      {
        'id': '#10',
        'amount': '\$600.00',
        'date': '12- Oct 2022 02.39 AM',
        'status': 'approved',
      },
      {
        'id': '#9',
        'amount': '\$500.00',
        'date': '12- Oct 2022 02.01 AM',
        'status': 'pending',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.032),
      child: Column(
        children: transactions.map((transaction) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTransactionCard(
              transaction['id']!,
              transaction['amount']!,
              transaction['date']!,
              transaction['status']!,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionCard(
      String id,
      String amount,
      String date,
      String status,
      ) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status) {
      case 'approved':
        statusColor = const Color(0xFF27AE60);
        statusIcon = Icons.check_circle;
        statusText = 'Approved';
        break;
      case 'denied':
        statusColor = const Color(0xFFFF4E53);
        statusIcon = Icons.cancel;
        statusText = 'Denied';
        break;
      case 'pending':
      default:
        statusColor = const Color(0xFFFDCC3F);
        statusIcon = Icons.access_time;
        statusText = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
        borderRadius: BorderRadius.circular(7.83),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA4A4A4).withOpacity(0.25),
            offset: const Offset(0, 2.61),
            blurRadius: 15.85,
          ),
        ],
      ),
      child: Column(
        children: [
          // Transaction ID and Amount Row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE3E3E3),
                      width: 0.65,
                    ),
                    borderRadius: BorderRadius.circular(7.83),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TrxID',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF606060),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        id,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A252F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 71,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFE3E3E3),
                    width: 0.65,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(7.83),
                    bottomRight: Radius.circular(7.83),
                  ),
                ),
                child: Center(
                  child: Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Date and Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8C8C8C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        statusIcon,
                        size: 10,
                        color: statusColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              if (status == 'pending')
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFFD5A5B)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Cancel request',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFD5A5B),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
