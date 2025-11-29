
import 'package:flutter/material.dart';
import 'package:vendor_app/router/navigation_service.dart';
import 'package:vendor_app/router/screen_names.dart';
import 'package:vendor_app/screen/main/presentation/menu/coupons/widgets/coupon_card.dart';
import 'package:vendor_app/screen/main/presentation/menu/coupons/widgets/coupon_details_dialougge.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF27AE60)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Coupon List",
          style: TextStyle(
            color: Color(0xFF27AE60),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),

      body: ListView(
        padding:  EdgeInsets.all(18),
        children:  [
          GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => const CouponDetailsDialog(),
              );

            },
            child: CouponCard(
              title: "75% discount on Purchase",
              subtitle: "Discount on Purchase",
              code: "rFhfx7XiCm",
              date: "09 Jan 2023 09:22 PM",
            ),
          ),

          SizedBox(height: 24),

          CouponCard(
            title: "Free Delivery",
            subtitle: "Free Delivery",
            code: "12oDTjKF3z",
            date: "09 Jan 2023 09:21 PM",
            showStatus: true,
          ),
        ],
      ),

      floatingActionButton: GestureDetector(
        onTap: (){
          NavigationService.navigateTo(Screens.couponSetupScreen);
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
}

