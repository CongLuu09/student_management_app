import 'package:flutter/material.dart';
import 'package:student_management_app/models/attendance.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;

  const AttendanceCard({Key? key, required this.attendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Học sinh ID: ${attendance.studentId}'),
        subtitle: Text('Ngày: ${attendance.date.toLocal()}'.split(' ')[0]),
        trailing: Text(attendance.isPresent ? 'Có mặt' : 'Vắng mặt'),
      ),
    );
  }
}
