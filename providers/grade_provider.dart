import 'package:flutter/material.dart';
import 'package:student_management_app/models/grade.dart';
import 'package:student_management_app/services/api_service.dart';

class GradeProvider with ChangeNotifier {
  List<Grade> _grades = [];
  final ApiService _apiService = ApiService();

  List<Grade> get grades => _grades;

  Future<void> loadGrades() async {
    _grades = await _apiService.fetchGrades();
    notifyListeners();
  }
}