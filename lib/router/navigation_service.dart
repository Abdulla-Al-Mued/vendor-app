import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static navigateTo(String page){
    GoRouter.of(navigatorKey.currentContext!).push(page);
  }
}
