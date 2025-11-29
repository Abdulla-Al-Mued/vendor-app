import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/router/navigation_service.dart';
import 'package:vendor_app/router/screen_names.dart';
import 'package:vendor_app/screen/login_screen/presentation/login_screen.dart';
import 'package:vendor_app/screen/main/presentation/home_screen/notification/presentation/notification.dart';
import 'package:vendor_app/screen/main/presentation/main_screen.dart';

import '../screen/main/presentation/home_screen/home_screen.dart';
import '../screen/main/presentation/home_screen/product_details/product_details.dart';
import '../screen/main/presentation/menu/add_product/add_product_screen.dart';
import '../screen/main/presentation/menu/bank_info/bank_info_screen.dart';
import '../screen/main/presentation/menu/bank_info/edit_bank_info/edit_bank_info.dart';
import '../screen/main/presentation/menu/clearence/clearance_screen.dart';
import '../screen/main/presentation/menu/coupons/coupon_setup/new_coupon.dart';
import '../screen/main/presentation/menu/coupons/coupons_screen.dart';
import '../screen/main/presentation/menu/message/presentation/inbox_screen.dart';
import '../screen/main/presentation/menu/my_shop/edit_my_shop/edit_shop.dart';
import '../screen/main/presentation/menu/my_shop/my_shop_screen.dart';
import '../screen/main/presentation/menu/pos/pos_screen.dart';
import '../screen/main/presentation/menu/products/products_screen.dart';
import '../screen/main/presentation/menu/profile/edit_profile/edit_profile.dart';
import '../screen/main/presentation/menu/profile/profile_screen.dart';
import '../screen/main/presentation/menu/profile/settings/settings.dart';
import '../screen/main/presentation/menu/restock/restock_screen.dart';
import '../screen/main/presentation/menu/reviews/reviews_screen.dart';
import '../screen/main/presentation/menu/vat_report/vat_report_screen.dart';
import '../screen/main/presentation/menu/wallet/wallet_screen.dart';
import '../screen/main/presentation/my_order/presentation/order_details/presentation/order_details.dart';
import '../screen/main/presentation/refund/log/refund_log.dart';
import '../screen/main/presentation/refund/refund_approval/refund_approval.dart';
import '../screen/register/presentation/register_screen.dart';



final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: Screens.loginScreen,
    routes: [
      GoRoute(
        path: Screens.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Screens.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Screens.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: Screens.productDetails,
        builder: (context, state) => const ProductDetailsPage(),
      ),
      GoRoute(
        path: Screens.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Screens.notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: Screens.orderDetailsPage,
        builder: (context, state) => const OrderDetailsPage(),
      ),
      GoRoute(
        path: Screens.refundRequestScreen,
        builder: (context, state) => const RefundRequestScreen(),
      ),
      GoRoute(
        path: Screens.changeLogScreen,
        builder: (context, state) => const ChangeLogScreen(),
      ),
      GoRoute(
        path: Screens.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Screens.myShopScreen,
        builder: (context, state) => const MyShopScreen(),
      ),
      GoRoute(
        path: Screens.addProductScreen,
        builder: (context, state) => const AddProductScreen(),
      ),
      GoRoute(
        path: Screens.productsScreen,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: Screens.reviewsScreen,
        builder: (context, state) => const ReviewsScreen(),
      ),
      GoRoute(
        path: Screens.couponsScreen,
        builder: (context, state) => const CouponsScreen(),
      ),
      GoRoute(
        path: Screens.posScreen,
        builder: (context, state) => const PosScreen(),
      ),
      GoRoute(
        path: Screens.restockScreen,
        builder: (context, state) => const RestockScreen(),
      ),
      GoRoute(
        path: Screens.clearanceScreen,
        builder: (context, state) => const ClearanceScreen(),
      ),
      GoRoute(
        path: Screens.walletScreen,
        builder: (context, state) => const WalletScreen(),
      ),
      GoRoute(
        path: Screens.messageScreen,
        builder: (context, state) => const MessageScreen(),
      ),
      GoRoute(
        path: Screens.vatReportScreen,
        builder: (context, state) => const VatReportScreen(),
      ),
      GoRoute(
        path: Screens.bankInfoScreen,
        builder: (context, state) => const BankInfoScreen(),
      ),
      GoRoute(
        path: Screens.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: Screens.settingsPage,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: Screens.editBankInfoScreen,
        builder: (context, state) => const EditBankInfoPage(),
      ),
      GoRoute(
        path: Screens.editShopScreen,
        builder: (context, state) => const EditShopScreen(),
      ),
      GoRoute(
        path: Screens.couponSetupScreen,
        builder: (context, state) => const CouponSetupScreen(),
      ),
    ],
  );
});
