import 'package:flutter/material.dart';
import 'package:student_management_app/models/student.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Tên: ${student.name}', style: TextStyle(fontSize: 20)),
            Text('Ngày sinh: ${student.birthDate.toLocal()}'.split(' ')[0], style: TextStyle(fontSize: 16)),
            Text('Email: ${student.email}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}