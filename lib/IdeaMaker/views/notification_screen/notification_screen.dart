import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Message',
      message: 'You have a new message from John Doe.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationItem(
      title: 'Friend Request',
      message: 'You have received a friend request from Jane Smith.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NotificationItem(
      title: 'New Comment',
      message: 'Your post has a new comment.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Add more notifications here
  ];

   NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: greenColor,
        title: (const Text('Notifications')),
      ),
      body: ListView.builder(
        itemCount: 2, // Number of sections (Today and Yesterday)
        itemBuilder: (context, sectionIndex) {
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);
          DateTime yesterday = today.subtract(const Duration(days: 1));

          List<NotificationItem> sectionNotifications =
              notifications.where((item) {
            if (sectionIndex == 0) {
              return item.timestamp.isAfter(today);
            } else {
              return item.timestamp.isBefore(today) &&
                  item.timestamp.isAfter(yesterday);
            }
          }).toList();

          String sectionTitle = (sectionIndex == 0) ? 'Today' : 'Yesterday';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  sectionTitle,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sectionNotifications.length,
                itemBuilder: (context, index) {
                  NotificationItem item = sectionNotifications[index];

                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.message),
                    trailing: Text(
                      '${item.timestamp.hour}:${item.timestamp.minute}',
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}
