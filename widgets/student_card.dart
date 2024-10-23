import 'package:flutter/material.dart';
import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/screens/student_detail_screen.dart';


class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text('Email: ${student.email}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentDetailScreen(student: student)),
          );
        },
      ),
    );
  }
}