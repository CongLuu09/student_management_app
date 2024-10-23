class AppNotification {
  final int? id; // ID sẽ tự động tăng
  final String message;
  final DateTime date;

  AppNotification({
    this.id,
    required this.message,
    required this.date,
  });
}
