import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/screen/login_screen/presentation/login_screen.dart';
import 'package:vendor_app/screen/main/presentation/main_screen.dart';

import '../screen/main/presentation/home_screen/home_screen.dart';



final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home_screen',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/main_screen',
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
});