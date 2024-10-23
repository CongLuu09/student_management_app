import 'package:flutter/material.dart';
import 'package:student_management_app/models/grade.dart';

class GradeCard extends StatelessWidget {
  final Grade grade;

  const GradeCard({Key? key, required this.grade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Môn: ${grade.subject}'),
        subtitle: Text('Điểm: ${grade.score}'),
      ),
    );
  }
}
