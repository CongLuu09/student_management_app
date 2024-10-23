import 'package:flutter/material.dart';
import 'package:student_management_app/screens/student_list_screen.dart';
import 'package:student_management_app/screens/grades_screen.dart';
import 'package:student_management_app/screens/attendance_screen.dart';
import 'package:student_management_app/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quản Lý Học Sinh')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Danh sách học sinh'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentListScreen()));
            },
          ),
          ListTile(
            title: Text('Quản lý điểm số'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GradesScreen()));
            },
          ),
          ListTile(
            title: Text('Quản lý vắng mặt'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceScreen()));
            },
          ),
          ListTile(
            title: Text('Thông báo'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
            },
          ),
        ],
      ),
    );
  }
}