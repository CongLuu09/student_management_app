import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_app/providers/attendance_provider.dart';
import 'package:student_management_app/models/attendance.dart';
import 'package:student_management_app/widgets/attendance_card.dart';


class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Quản Lý Vắng Mặt')),
      body: FutureBuilder(
        future: attendanceProvider.loadAttendance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: attendanceProvider.attendanceRecords.length,
            itemBuilder: (context, index) {
              return AttendanceCard(attendance: attendanceProvider.attendanceRecords[index]);
            },
          );
        },
      ),
    );
  }
}