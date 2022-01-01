import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/classroom_model.dart';
import 'package:hamon_app/data/models/student_model.dart';
import 'package:hamon_app/data/models/subject_model.dart';
import 'package:hamon_app/data/repositories/classroom_repository.dart';
import 'package:hamon_app/data/repositories/student_repository.dart';
import 'package:hamon_app/data/repositories/subject_repository.dart';

class AppProvider extends ChangeNotifier {
  final StudentRepository _studentRepository = StudentRepository();
  final SubjectRepository _subjectRepository = SubjectRepository();
  final ClassroomRepository _classroomRepository = ClassroomRepository();

  List<Student> _students = [];
  List<Subject> _subjects = [];
  List<ClassRoom> _classrooms = [];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<Student> get students => _students;
  List<Subject> get subjects => _subjects;
  List<ClassRoom> get classrooms => _classrooms;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void getStudents() async {
    _students = await _studentRepository.getStudents();
    notifyListeners();
  }
  void getSubjects() async {
    _subjects = await _subjectRepository.getSubjects();
    notifyListeners();
  }

  void getClassrooms() async {
    _classrooms = await _classroomRepository.getClassrooms();
    notifyListeners();
  }
}
