import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_app/providers/student_provider.dart';
import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/widgets/student_card.dart';

class StudentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Danh Sách Học Sinh')),
      body: FutureBuilder(
        future: studentProvider.loadStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: studentProvider.students.length,
            itemBuilder: (context, index) {
              return StudentCard(student: studentProvider.students[index]);
            },
          );
        },
      ),
    );
  }
}