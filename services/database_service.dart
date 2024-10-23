import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/models/grade.dart';
import 'package:student_management_app/models/attendance.dart';
import 'package:student_management_app/models/notification.dart'; // Import Notification model

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'student_management.db');
    return await openDatabase(
      path,
      version: 2, // Tăng version khi thay đổi cấu trúc bảng
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tạo bảng học sinh
    await db.execute('''
      CREATE TABLE students (
        id TEXT PRIMARY KEY,
        name TEXT,
        birthDate TEXT,
        email TEXT
      )
    ''');

    // Tạo bảng điểm số
    await db.execute('''
      CREATE TABLE grades (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentId TEXT,
        subject TEXT,
        score REAL,
        FOREIGN KEY (studentId) REFERENCES students(id)
      )
    ''');

    // Tạo bảng vắng mặt
    await db.execute('''
      CREATE TABLE attendance (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentId TEXT,
        date TEXT,
        isPresent INTEGER,
        FOREIGN KEY (studentId) REFERENCES students(id)
      )
    ''');

    // Tạo bảng thông báo
    await db.execute('''
      CREATE TABLE notifications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        message TEXT,
        date TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Thêm bảng thông báo nếu phiên bản trước đó là cũ hơn version 2
      await db.execute('''
        CREATE TABLE notifications (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          message TEXT,
          date TEXT
        )
      ''');
    }
  }

  // Quản lý học sinh, điểm, vắng mặt như trước
  // ...

  // Thêm thông báo mới
  Future<void> insertNotification(AppNotification notification) async {
    final db = await database;
    await db.insert(
      'notifications',
      {
        'message': notification.message,
        'date': notification.date.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Lấy danh sách thông báo
  Future<List<AppNotification>> getNotifications() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notifications');
    return List.generate(maps.length, (i) {
      return AppNotification(
        id: maps[i]['id'],
        message: maps[i]['message'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  // Xóa thông báo theo ID
  Future<void> deleteNotification(int id) async {
    final db = await database;
    await db.delete(
      'notifications',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Xóa tất cả thông báo
  Future<void> clearNotifications() async {
    final db = await database;
    await db.delete('notifications');
  }

  // Đóng cơ sở dữ liệu
  Future<void> close() async {
    final db = await _database;
    db?.close();
  }
}
