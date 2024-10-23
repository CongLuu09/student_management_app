import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_app/providers/notification_provider.dart';
import 'package:student_management_app/models/notification.dart';
import 'package:student_management_app/widgets/notification_card.dart';


class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Thông Báo')),
      body: FutureBuilder(
        future: notificationProvider.loadNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: notificationProvider.notifications.length,
            itemBuilder: (context, index) {
              return NotificationCard(notification: notificationProvider.notifications[index]);
            },
          );
        },
      ),
    );
  }
}
