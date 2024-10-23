import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/models/grade.dart';
import 'package:student_management_app/models/attendance.dart';
import 'package:student_management_app/models/notification.dart';

class ApiService {
  // Giả lập dữ liệu học sinh
  Future<List<Student>> fetchStudents() async {
    return [
      Student(id: '1', name: 'Nguyễn Văn A', birthDate: DateTime(2005, 5, 10), email: 'a@example.com'),
      Student(id: '2', name: 'Trần Thị B', birthDate: DateTime(2006, 7, 15), email: 'b@example.com'),
    ];
  }

  // Giả lập dữ liệu điểm số
  Future<List<Grade>> fetchGrades() async {
    return [
      Grade(studentId: '1', subject: 'Toán', score: 9.0),
      Grade(studentId: '2', subject: 'Lý', score: 8.5),
    ];
  }

  // Giả lập dữ liệu vắng mặt
  Future<List<Attendance>> fetchAttendance() async {
    return [
      Attendance(studentId: '1', date: DateTime.now(), isPresent: true),
      Attendance(studentId: '2', date: DateTime.now(), isPresent: false),
    ];
  }

  // Giả lập dữ liệu thông báo
  Future<List<AppNotification>> fetchNotifications() async {
    return [
      AppNotification(id: 1, message: 'Cuộc họp phụ huynh vào thứ 7', date: DateTime.now()),
      AppNotification(id: 2, message: 'Học sinh nghỉ học vào ngày mai', date: DateTime.now()),
    ];
  }
}