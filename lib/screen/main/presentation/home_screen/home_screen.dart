import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/navigation_service.dart';
import '../../../../router/screen_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*  base design size  */
    const double baseW = 393;
    const double baseH = 852;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;
            final scaleW = w / baseW;
            final scaleH = h / baseH;
            final scale  = scaleW < scaleH ? scaleW : scaleH;

            return SizedBox(
              width: w,
              height: h,
              child: Stack(
                children: [
                  /*  scrollable content  */
                  Positioned.fill(
                    top: 53 * scaleH,
                    bottom: 79 * scaleH,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24 * scaleH),
                          _businessAnalytics(scale),
                          SizedBox(height: 24 * scaleH),
                          _earningStatistics(scale),
                          SizedBox(height: 24 * scaleH),
                          _topSellingProducts(scale),
                          SizedBox(height: 24 * scaleH),
                          _mostPopularProducts(scale),
                          SizedBox(height: 24 * scaleH),
                        ],
                      ),
                    ),
                  ),
                  /*  header  */
                  _header(scale),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

/* ------------------------------------------------------------------ */
/* ------------------------  WIDGETS  ------------------------------- */
/* ------------------------------------------------------------------ */
  Widget _header(double scale) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 53 * scale,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEBEBEB).withOpacity(0.25),
              offset: Offset(0, 4 * scale),
              blurRadius: 4 * scale,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 11.27 * scale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 22.34 * scale,
                  height: 23.11 * scale,
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60),
                    borderRadius: BorderRadius.circular(4 * scale),
                  ),
                  child: Icon(Icons.trending_up,
                      size: 14 * scale, color: Colors.white),
                ),
                SizedBox(width: 7.62 * scale),
                Text(
                  'Dotvalley',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.24 * scale,
                    letterSpacing: -0.3 * scale,
                    color: const Color(0xFF18AF60),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: (){
                GoRouter.of(NavigationService.navigatorKey.currentContext!).push(Screens.notificationScreen);
              },
              child: Stack(
                children: [
                  Icon(Icons.notifications_active_rounded,
                      size: 19.27 * scale, color: const Color(0xFF27AE60)),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8.78 * scale,
                      height: 8.78 * scale,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFD5A5B),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 4 * scale,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
      ),
    );
  }

  Widget _businessAnalytics(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.21 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20.6 * scale,
                    height: 20.6 * scale,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(4 * scale),
                    ),
                    child: Icon(Icons.trending_up,
                        size: 14 * scale, color: Colors.white),
                  ),
                  SizedBox(width: 8 * scale),
                  Text(
                    'Business Analytics',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12 * scale,
                      letterSpacing: -0.24 * scale,
                      color: const Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),
              Container(
                height: 34 * scale,
                padding: EdgeInsets.symmetric(
                    horizontal: 12 * scale, vertical: 10 * scale),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF9F9F9)),
                  borderRadius: BorderRadius.circular(6.52 * scale),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF9F9F9),
                      offset: Offset(0, 3.26 * scale),
                      blurRadius: 3.26 * scale,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Over All',
                      style: TextStyle(
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2 * scale,
                        color: const Color(0xFF1A252F),
                      ),
                    ),
                    SizedBox(width: 4 * scale),
                    Icon(Icons.keyboard_arrow_down,
                        size: 14 * scale, color: const Color(0xFF1A252F)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16 * scale),
          /*  cards  – sizes scaled  */
          Container(
            padding: EdgeInsets.all(20 * scale),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8)),
              borderRadius: BorderRadius.circular(2.32 * scale),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  offset: Offset(0, 2.32 * scale),
                  blurRadius: 2.32 * scale,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ongoing Orders',
                  style: TextStyle(
                    fontSize: 12 * scale,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.24 * scale,
                    color: const Color(0xFF1A252F),
                  ),
                ),
                SizedBox(height: 16 * scale),
                Row(
                  children: [
                    _orderStatusCard('3', 'Pending Orders', const Color(0xFF2A65B5)),
                    SizedBox(width: 18 * scale),
                    _orderStatusCard('1', 'Packaging Orders', const Color(0xFF438FFF)),
                  ],
                ),
                SizedBox(height: 18 * scale),
                Row(
                  children: [
                    _orderStatusCard('4', 'Confirmed Orders', const Color(0xFF27AE60)),
                    SizedBox(width: 18 * scale),
                    _orderStatusCard('2', 'Out For Delivery', const Color(0xFFFD5A5B)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24 * scale),
          /*  completed orders  */
          Container(
            // width: 370 * scale,
            padding: EdgeInsets.all(20 * scale),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8)),
              borderRadius: BorderRadius.circular(2.32 * scale),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  offset: Offset(0, 2.32 * scale),
                  blurRadius: 2.32 * scale,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Completed Orders',
                  style: TextStyle(
                    fontSize: 12 * scale,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.24 * scale,
                    color: const Color(0xFF1A252F),
                  ),
                ),
                SizedBox(height: 16 * scale),
                _completedItem(Icons.check_box, 'Delivered', '11', const Color(0xFF27AE60)),
                SizedBox(height: 12 * scale),
                _completedItem(Icons.close, 'Cancelled', '01', const Color(0xFFE21B1B)),
                SizedBox(height: 12 * scale),
                _completedItem(Icons.rotate_left, 'Return', '02', const Color(0xFFFDCC3F)),
                SizedBox(height: 12 * scale),
                _completedItem(Icons.error_outline, 'Failed to Delivery', '01', const Color(0xFFFF3D58)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _earningStatistics(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.21 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20.6 * scale,
                    height: 20.6 * scale,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(4 * scale),
                    ),
                    child: Icon(Icons.assessment,
                        size: 14 * scale, color: Colors.white),
                  ),
                  SizedBox(width: 8 * scale),
                  Text(
                    'Earning Statistics',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12 * scale,
                      letterSpacing: -0.24 * scale,
                      color: const Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),
              Container(
                height: 34 * scale,
                padding: EdgeInsets.symmetric(
                    horizontal: 12 * scale, vertical: 10 * scale),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF9F9F9)),
                  borderRadius: BorderRadius.circular(6.52 * scale),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF9F9F9),
                      offset: Offset(0, 3.26 * scale),
                      blurRadius: 3.26 * scale,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'This Year',
                      style: TextStyle(
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2 * scale,
                        color: const Color(0xFF1A252F),
                      ),
                    ),
                    SizedBox(width: 4 * scale),
                    Icon(Icons.keyboard_arrow_down,
                        size: 14 * scale, color: const Color(0xFF1A252F)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16 * scale),
          Container(
            width: 370 * scale,
            height: 312 * scale,
            padding: EdgeInsets.all(20 * scale),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF8F8F8)),
              borderRadius: BorderRadius.circular(2.32 * scale),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD7D7D7).withOpacity(0.25),
                  offset: Offset(0, 2.32 * scale),
                  blurRadius: 2.32 * scale,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _legendDot(const Color(0xFF27AE60), scale),
                    SizedBox(width: 8 * scale),
                    Text(
                      'Your Earnings',
                      style: TextStyle(
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A252F),
                      ),
                    ),
                    SizedBox(width: 20 * scale),
                    _legendDot(const Color(0xFFFDCC3F), scale),
                    SizedBox(width: 8 * scale),
                    Text(
                      'Commission Given',
                      style: TextStyle(
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A252F),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24 * scale),
                Expanded(
                  child: Stack(
                    children: [
                      /*  y-axis  */
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _yLabel('80', scale),
                            _yLabel('60', scale),
                            _yLabel('40', scale),
                            _yLabel('20', scale),
                            _yLabel('00', scale),
                          ],
                        ),
                      ),
                      /*  x-axis  */
                      Positioned(
                        left: 35 * scale,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _xLabel('Feb', scale),
                            _xLabel('Apr', scale),
                            _xLabel('June', scale),
                            _xLabel('Aug', scale),
                            _xLabel('Oct', scale),
                            _xLabel('Dec', scale),
                          ],
                        ),
                      ),
                      /*  bars  */
                      Positioned(
                        right: 35 * scale,
                        bottom: 15 * scale,
                        child: Container(
                          width: 50 * scale,
                          height: 128 * scale,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFF27AE60), width: 2 * scale),
                            borderRadius: BorderRadius.circular(2 * scale),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 35 * scale,
                        bottom: 15 * scale,
                        child: Container(
                          width: 50 * scale,
                          height: 15 * scale,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFDCC97C), width: 2 * scale),
                            borderRadius: BorderRadius.circular(2 * scale),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topSellingProducts(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.35 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Selling Products',
                style: TextStyle(
                  fontSize: 15.95 * scale,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.32 * scale,
                  color: const Color(0xFF1A252F),
                ),
              ),
              Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 8.77 * scale,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.18 * scale,
                      color: const Color(0xFF27AE60),
                    ),
                  ),
                  SizedBox(width: 4 * scale),
                  Icon(Icons.arrow_forward,
                      size: 10 * scale, color: const Color(0xFF27AE60)),
                ],
              ),
            ],
          ),
          SizedBox(height: 16 * scale),
          Wrap(
            spacing: 12 * scale,
            runSpacing: 12 * scale,
            children: [
              InkWell(
                onTap: (){
                  GoRouter.of(NavigationService.navigatorKey.currentContext!).push(Screens.productDetails);
                },
                  child: _productCard('Straps Plaid Patchwork...', '\$20.00', '2', scale)
              ),
              _productCard('Copper Alloy inlaid Zir...', '\$9.00', '1', scale),
              _productCard('Bohemiantee Shirt Tops', '\$22.00', '1', scale),
              _productCard('Samsung S24 Ultra', '\$1,150.00', '1', scale),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mostPopularProducts(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.79 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Popular Products',
            style: TextStyle(
              fontSize: 15.95 * scale,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.32 * scale,
              color: const Color(0xFF1A252F),
            ),
          ),
          SizedBox(height: 16 * scale),
          _productCardPopular(scale),
        ],
      ),
    );
  }


/* ------------------------------------------------------------------ */
/* --------------------  HELPER  WIDGETS  --------------------------- */
/* ------------------------------------------------------------------ */
  Widget _legendDot(Color color, double scale) {
    return Container(
      width: 9.87 * scale,
      height: 9.87 * scale,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _yLabel(String text, double scale) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 8 * scale,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.16 * scale,
        color: const Color(0xFF1A252F),
      ),
    );
  }

  Widget _xLabel(String text, double scale) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 8 * scale,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.16 * scale,
        color: const Color(0xFF1A252F),
      ),
    );
  }

  Widget _productCard(String name, String price, String sold, double scale) {
    return Container(
      width: 179.24 * scale,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.84 * scale),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFABABAB).withOpacity(0.25),
            offset: Offset(0, 3.92 * scale),
            blurRadius: 31.37 * scale,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8.82 * scale),
            height: 117.62 * scale,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF2F2F2)),
              borderRadius: BorderRadius.circular(7.84 * scale),
            ),
            child: Center(
              child: Container(
                width: 63 * scale,
                height: 63 * scale,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(4 * scale),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * scale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 8.98 * scale,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.18 * scale,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                SizedBox(height: 6 * scale),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 9.51 * scale,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.19 * scale,
                    color: const Color(0xFF27AE60),
                  ),
                ),
                SizedBox(height: 8 * scale),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                10.78 * scale, 0, 10.78 * scale, 12 * scale),
            height: 23 * scale,
            decoration: BoxDecoration(
              color: const Color(0xFFFD5A5B),
              borderRadius: BorderRadius.circular(4 * scale),
            ),
            child: Center(
              child: Text(
                '$sold Sold',
                style: TextStyle(
                  fontSize: 10 * scale,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2 * scale,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCardPopular(double scale) {
    return Container(
      width: 178 * scale,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.84 * scale),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFABABAB).withOpacity(0.25),
            offset: Offset(0, 3.92 * scale),
            blurRadius: 31.37 * scale,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8.82 * scale),
            height: 117.62 * scale,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF2F2F2)),
              borderRadius: BorderRadius.circular(7.84 * scale),
            ),
            child: Center(
              child: Container(
                width: 63 * scale,
                height: 63 * scale,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(4 * scale),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * scale, vertical: 8 * scale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, size: 8 * scale, color: const Color(0xFFFDCC3F)),
                    SizedBox(width: 4 * scale),
                    Text(
                      '5.0 (2 Reviews)',
                      style: TextStyle(
                        fontSize: 7.84 * scale,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.16 * scale,
                        color: const Color(0xFF27AE60),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6 * scale),
                Text(
                  'Samsung S24 Ultra',
                  style: TextStyle(
                    fontSize: 8.98 * scale,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.18 * scale,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderStatusCard(String count, String label, Color color) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE3E3E3)),
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
              count,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF606060),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _completedItem(IconData icon, String label, String count, Color color) {
    return Container(
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E3E3)),
        borderRadius: BorderRadius.circular(7.83),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA4A4A4).withOpacity(0.25),
            offset: const Offset(0, 2.61),
            blurRadius: 15.85,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 23.39, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: label == 'Delivered' || label == 'Return' ? const Color(0xFF2C3E50) : color,
                ),
              ),
            ],
          ),
          Container(
            width: 27,
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



