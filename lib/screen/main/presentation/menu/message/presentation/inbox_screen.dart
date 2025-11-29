import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/inbox_controller.dart';
import '../widgets/cust_deli_single_item.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inboxState = ref.watch(inboxControllerProvider);
    final inboxController = ref.read(inboxControllerProvider.notifier);
    final primaryColor = const Color(0xFF27AE60);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Inbox',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFECECEE), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 6),
                  Expanded(
                    child: TextField(
                      onChanged: (query) => inboxController.search(query),
                      decoration: const InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        isDense: true,                         // less vertical padding
                        contentPadding: EdgeInsets.zero,
                      ),

                    ),
                  ),
                  const Icon(Icons.search, color: Color(0xFFA3A3A3)),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        inboxController.setFilter(InboxFilter.customer),
                    child: Container(
                      height: 37,
                      decoration: BoxDecoration(
                        color: inboxState.selectedFilter == InboxFilter.customer
                            ? primaryColor
                            : const Color(0xFFECF0F1),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFF9F9F9),
                            blurRadius: 2.3,
                            offset: Offset(0, 2.3),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Customer",
                          style: TextStyle(
                            color: inboxState.selectedFilter ==
                                    InboxFilter.customer
                                ? Colors.white
                                : const Color(0xFF606060),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        inboxController.setFilter(InboxFilter.deliveryMan),
                    child: Container(
                      height: 37,
                      decoration: BoxDecoration(
                        color: inboxState.selectedFilter ==
                                InboxFilter.deliveryMan
                            ? primaryColor
                            : const Color(0xFFECF0F1),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFF9F9F9),
                            blurRadius: 2.3,
                            offset: Offset(0, 2.3),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Delivery Man",
                          style: TextStyle(
                            color: inboxState.selectedFilter ==
                                    InboxFilter.deliveryMan
                                ? Colors.white
                                : const Color(0xFF606060),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DeliveryCard(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/icons/ic_cust_not_found.png', // change path
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "No Customer Found",
                  style: TextStyle(
                    color: Color(0xFFD3D3D2),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
