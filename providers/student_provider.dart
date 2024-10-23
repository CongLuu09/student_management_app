import 'package:flutter/material.dart';
import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/services/api_service.dart';


class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  final ApiService _apiService = ApiService();

  List<Student> get students => _students;

  Future<void> loadStudents() async {
    _students = await _apiService.fetchStudents();
    notifyListeners();
  }
}