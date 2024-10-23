import 'package:flutter/material.dart';
import 'package:student_management_app/models/notification.dart'; // Import AppNotification

class NotificationCard extends StatelessWidget {
  final AppNotification notification; // Sử dụng AppNotification

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(notification.message),
        subtitle: Text('Ngày: ${notification.date.toLocal()}'.split(' ')[0]),
      ),
    );
  }
}
