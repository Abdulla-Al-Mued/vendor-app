import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  static const Color primary = Color(0xFF27AE60);
  static const Color darkGrey = Color(0xFF1A252F);
  static const Color midGrey = Color(0xFF606060);
  static const Color lightBorder = Color(0xFFF8F8F8);

  TextStyle inter({double size = 12, FontWeight weight = FontWeight.w500, Color? color}) =>
      TextStyle(fontFamily: 'Inter', fontSize: size, fontWeight: weight, color: color);

  // Small helper to create shadow + border boxes similar to the design
  BoxDecoration cardDecoration({double radius = 8, Color? bg}) => BoxDecoration(
    color: bg ?? Colors.white,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: Color(0xFFECECEC), width: 0.6),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(164, 164, 164, 0.25),
        blurRadius: 15.85,
        offset: Offset(0, 2.61),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: orderInfoCard(),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.check_circle, color: primary),
          )
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final w = constraints.maxWidth;
          // base width in design seems 393; we will scale text sizes with screen width
          final scale = w / 393.0;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top card: Order verification + Action
                _topVerificationCard(w, scale),
                SizedBox(height: 16 * scale),
                // Address / Shipping card
                _otherDetailsCard(w, scale),
                SizedBox(height: 16 * scale),
                // Order Summary card
                _orderSummaryCard(w, scale),
                SizedBox(height: 16 * scale),
                // Customer Info card
                _customerInfoCard(w, scale),
                SizedBox(height: 24 * scale),
                // Checkout/Action Button
                SizedBox(
                  width: double.infinity,
                  height: 44 * scale,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    child: Text('Order Setup', style: inter(size: 14 * scale, weight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 24 * scale),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _topVerificationCard(double w, double scale) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14 * scale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: lightBorder),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.32, offset: Offset(0, 2.32))],
      ),
      child: Row(
        children: [
          // left column: label + code
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Verification Cod: 290038', style: inter(size: 12, color: darkGrey)),
                SizedBox(height: 6),
                Text('Your Order is Confirmed', style: inter(size: 10, color: Colors.grey)),
              ],
            ),
          ),
          // icon or placeholder
          Container(
            width: 40 * scale,
            height: 40 * scale,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primary, width: 2)),
            child: Center(child: Icon(Icons.check, color: primary)),
          )
        ],
      ),
    );
  }

  Widget orderInfoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- TOP ROW (Green Bar + Order ID) ----------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Green vertical bar (Vector)
              Container(
                width: 5.23,
                height: 10.45,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: const Color(0xFF27AE60),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Order ID
              const Text(
                "Order#100181",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.6,
                  color: Color(0xFF1A252F), // secondary-dark
                  height: 1.2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // ---------- "Your Order is Confirmed" ----------
          const Padding(
            padding: EdgeInsets.only(left: 17),
            child: Text(
              "Your Order is Confrimed",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color.fromRGBO(187, 187, 187, 0.73),
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 6),

          // ---------- Date ----------
          const Padding(
            padding: EdgeInsets.only(left: 17),
            child: Text(
              "9 Jun, 2023",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color(0xFF606060), // dark grey
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _otherDetailsCard(double w, double scale) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E3E3), width: 0.65),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(164, 164, 164, 0.25),
            blurRadius: 16,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---------- FIRST ROW (Name + Phone) ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconText(Icons.person, "Robert Weiss"),
              _iconText(Icons.phone, "+13218782977"),
            ],
          ),
          const SizedBox(height: 14),

          /// ---------- SECOND ROW (Home + Country) ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconText(Icons.home, "Home"),
              _iconText(Icons.keyboard_alt, "Lesotho"),
            ],
          ),
          const SizedBox(height: 14),

          /// ---------- THIRD ROW (Business + Zip) ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconText(Icons.business, "Consectetur explica"),
              _iconText(Icons.flag, "97389"),
            ],
          ),
          const SizedBox(height: 14),

          /// ---------- LOCATION ----------
          _iconText(Icons.location_on_sharp, "Sint vitae lorem qui"),
          const SizedBox(height: 20),

          /// ---------- DIVIDER ----------
          Container(
            width: double.infinity,
            height: 1,
            color: const Color.fromRGBO(187, 187, 187, 0.73),
          ),
          const SizedBox(height: 12),

          /// ---------- BILLING ADDRESS ----------
          const Text(
            "Billing Address",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF606060),
              letterSpacing: -0.02,
            ),
          ),
          const SizedBox(height: 14),

          /// ---------- BUTTON ----------
          SizedBox(
            width: double.infinity,
            height: 28,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: const Text(
                "Same as shipping address",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white,
                  letterSpacing: -0.02,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------------- REUSABLE SMALL WIDGET ----------------------
  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF606060)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF606060),
            letterSpacing: -0.02,
          ),
        ),
      ],
    );
  }



  Widget _orderSummaryCard(double w, double scale) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12 * scale),
      decoration: cardDecoration(radius: 2.32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          _assetIcon('assets/purchase-order.png', size: 22 * scale),
          SizedBox(width: 12 * scale),
          Text('Order Summary', style: inter(size: 12, color: darkGrey)),
        ]),
        SizedBox(height: 12 * scale),
        Row(children: [
          Container(
            width: 156 * scale,
            height: 80 * scale,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.8), border: Border.all(color: Color(0xFFE3E3E3), width: 0.65)),
            child: Center(child: _assetIcon('assets/image_(1).png', size: 40 * scale)),
          ),
          SizedBox(width: 12 * scale),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Hydration Pack', style: inter(size: 12, color: darkGrey)),
              SizedBox(height: 6 * scale),
              Text('\$ 50.00', style: inter(size: 10, weight: FontWeight.w600, color: primary)),
              SizedBox(height: 6 * scale),
              Text('Tax include', style: inter(size: 10, color: darkGrey)),
              SizedBox(height: 6 * scale),
              Text('Qty: 1', style: inter(size: 10, color: Colors.grey)),
            ]),
          )
        ]),
        SizedBox(height: 12 * scale),
        // Price breakdown
        _priceRow('Sub Total', '\$ 50.00', scale),
        _priceRow('Tax', '+\$15.50', scale),
        _priceRow('Discount', '-\$0.00', scale),
        _priceRow('Coupon Discount', '-\$0.00', scale),
        _priceRow('Shipping Fee', '+\$ 100.00', scale),
        Divider(color: Colors.grey.shade300),
        _priceRow('Total', '\$ 165.50', scale, isTotal: true),
        SizedBox(height: 12 * scale),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Payment Status', style: inter(size: 12, color: primary)),
            SizedBox(height: 6 * scale),
            Text('Paid', style: inter(size: 12, color: midGrey)),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Payment Method', style: inter(size: 12, color: primary)),
            SizedBox(height: 6 * scale),
            Text('Pay by wallet', style: inter(size: 12, color: midGrey)),
          ])
        ])
      ]),
    );
  }

  Widget _customerInfoCard(double w, double scale) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12 * scale),
      decoration: cardDecoration(radius: 2.32),
      child: Row(children: [
        // Container(
        //   width: 125 * scale,
        //   height: 89 * scale,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), image: DecorationImage(image: AssetImage('assets/profile_placeholder.png'), fit: BoxFit.cover)),
        // ),
        SizedBox(width: 12 * scale),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Customer information', style: inter(size: 12, color: darkGrey)),
            SizedBox(height: 6 * scale),
            Text('Robert Downey', style: inter(size: 12, color: midGrey)),
            SizedBox(height: 6 * scale),
            Text('+15551112222', style: inter(size: 12, color: midGrey)),
            SizedBox(height: 6 * scale),
            Text('Robert@customer.com', style: inter(size: 12, color: midGrey)),
            SizedBox(height: 6 * scale),
            Text('9 Jun, 2023', style: inter(size: 10, color: Colors.grey)),
          ]),
        )
      ]),
    );
  }

  Widget _priceRow(String label, String amount, double scale, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6 * scale),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: inter(size: isTotal ? 12 : 12, color: isTotal ? primary : midGrey)),
        Text(amount, style: inter(size: isTotal ? 12 : 12, color: midGrey)),
      ]),
    );
  }

  Widget _assetIcon(String asset, {double size = 16}) {
    // Use Image.asset if you have the assets. Fallback to Icon if not present.
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(asset, fit: BoxFit.contain, errorBuilder: (c, e, s) => Icon(Icons.image_not_supported, size: size, color: midGrey)),
    );
  }
}

