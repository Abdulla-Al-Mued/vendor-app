import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool selectAll = false;
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Coupon',
      description: 'From 2024, Use Cod " pcw655ytg" to get 65% disc..',
      time: '12:40AM',
      date: '04\\19\\2022',
      isUnread: true,
      imageUrl: null,
    ),
    NotificationItem(
      title: 'Buy get 1',
      description: 'Buy any 2 products then get any product.',
      time: '01:37AM',
      date: '04\\19\\2022',
      isUnread: true,
      imageUrl: null,
    ),
  ];

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      // You can implement logic to select/deselect all notifications
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF27AE60),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF27AE60),
                        size: 14,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Notification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.6,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF27AE60),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            // Select All Checkbox
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: toggleSelectAll,
                    child: Container(
                      width: 12.5,
                      height: 12.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF27AE60),
                          width: 1.05,
                        ),
                        borderRadius: BorderRadius.circular(2.1),
                        color: selectAll
                            ? const Color(0xFF27AE60)
                            : Colors.transparent,
                      ),
                      child: selectAll
                          ? const Icon(
                        Icons.check,
                        size: 8,
                        color: Colors.white,
                      )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Select All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Notifications List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Header
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          notifications[index].date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF606060),
                          ),
                        ),
                      ),

                      // Notification Card
                      _buildNotificationCard(notifications[index]),

                      const SizedBox(height: 24),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 2.24,
            ),
            borderRadius: BorderRadius.circular(8.96),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA4A4A4).withOpacity(0.25),
                blurRadius: 15.9,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar with unread indicator
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 39.32,
                    height: 40.46,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE9F8EF),
                        width: 1,
                      ),
                    ),
                    child: notification.imageUrl != null
                        ? ClipOval(
                      child: Image.network(
                        notification.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                        : const Icon(
                      Icons.notifications,
                      color: Color(0xFF27AE60),
                      size: 20,
                    ),
                  ),

                  // Unread indicator
                  if (notification.isUnread)
                    Positioned(
                      top: -2,
                      left: -2,
                      child: Container(
                        width: 8.29,
                        height: 8.29,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5454),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 12),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF606060),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF606060),
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Time
              Text(
                notification.time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27AE60),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final String date;
  final bool isUnread;
  final String? imageUrl;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    this.isUnread = false,
    this.imageUrl,
  });
}