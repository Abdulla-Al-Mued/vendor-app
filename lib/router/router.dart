import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/router/navigation_service.dart';
import 'package:vendor_app/router/screen_names.dart';
import 'package:vendor_app/screen/login_screen/presentation/login_screen.dart';
import 'package:vendor_app/screen/main/presentation/home_screen/notification/presentation/notification.dart';
import 'package:vendor_app/screen/main/presentation/main_screen.dart';

import '../screen/main/presentation/home_screen/home_screen.dart';
import '../screen/main/presentation/home_screen/product_details/product_details.dart';
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
    ],
  );
});