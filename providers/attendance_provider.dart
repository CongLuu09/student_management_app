import 'package:flutter/material.dart';
import 'package:student_management_app/models/attendance.dart';
import 'package:student_management_app/services/api_service.dart';


class AttendanceProvider with ChangeNotifier {
  List<Attendance> _attendanceRecords = [];
  final ApiService _apiService = ApiService();

  List<Attendance> get attendanceRecords => _attendanceRecords;

  Future<void> loadAttendance() async {
    _attendanceRecords = await _apiService.fetchAttendance();
    notifyListeners();
  }
}