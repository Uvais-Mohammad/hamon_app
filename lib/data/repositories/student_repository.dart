import 'dart:convert';
import 'dart:io';

import 'package:hamon_app/data/constants/endpoints.dart';
import 'package:hamon_app/data/data%20providers/network_handler.dart';
import 'package:hamon_app/data/models/api_status.dart';
import 'package:hamon_app/data/models/student_model.dart';

class StudentRepository {
  final NetworkHandler _networkHandler = NetworkHandler();

  Future getStudents() async {
    var response = await _networkHandler.get(getStudentsUrl);
    Iterable l = response.response['students'];
    if (response.runtimeType == Success) {
      List<Student> students =
          l.map((model) => Student.fromJson(model)).toList();
      return students;
    } else {
      List<Student> students = [];
      return students;
    }
  }
}
