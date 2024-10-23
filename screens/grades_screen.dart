import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_app/providers/grade_provider.dart';
import 'package:student_management_app/widgets/grade_card.dart';

class GradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gradeProvider = Provider.of<GradeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Quản Lý Điểm Số')),
      body: FutureBuilder(
        future: gradeProvider.loadGrades(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: gradeProvider.grades.length,
            itemBuilder: (context, index) {
              return GradeCard(grade: gradeProvider.grades[index]);
            },
          );
        },
      ),
    );
  }
}