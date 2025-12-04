import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportsController extends Notifier<void> {
  @override
  void build() {
    // Initialize state if needed
  }

  void goBack() {
    // Navigation logic (Navigator 1.0)
  }
}

final reportsControllerProvider =
NotifierProvider<ReportsController, void>(() => ReportsController());
