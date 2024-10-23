import 'package:flutter/material.dart';
import 'package:student_management_app/models/notification.dart'; // Import lớp AppNotification
import 'package:student_management_app/services/database_service.dart';

class NotificationProvider with ChangeNotifier {
  List<AppNotification> _notifications = []; // Sử dụng AppNotification
  final DatabaseService _databaseService = DatabaseService();

  List<AppNotification> get notifications => _notifications;

  // Tải thông báo từ cơ sở dữ liệu
  Future<void> loadNotifications() async {
    _notifications = await _databaseService.getNotifications();
    notifyListeners();
  }

  // Thêm thông báo mới
  Future<void> addNotification(AppNotification notification) async {
    await _databaseService.insertNotification(notification);
    await loadNotifications();
  }

  // Xóa tất cả thông báo
  Future<void> clearNotifications() async {
    _notifications.clear();
    notifyListeners();
  }
}
