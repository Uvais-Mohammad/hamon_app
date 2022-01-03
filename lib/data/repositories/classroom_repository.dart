import 'package:hamon_app/data/constants/endpoints.dart';
import 'package:hamon_app/data/data%20providers/network_handler.dart';
import 'package:hamon_app/data/models/api_status.dart';
import 'package:hamon_app/data/models/classroom_model.dart';

class ClassroomRepository {
  final NetworkHandler _networkHandler = NetworkHandler();

  Future getClassrooms() async {
    var response = await _networkHandler.get(getClassroomUrl);
    Iterable l = response.response['classrooms'];
    if (response.runtimeType == Success) {
      List<ClassRoom> classrooms =
          l.map((model) => ClassRoom.fromJson(model)).toList();
      return classrooms;
    } else {
      List<ClassRoom> classrooms = [];
      return classrooms;
    }
  }

  Future getClassroom(int id) async {
    var response =
        await _networkHandler.get(getClassroomUrl + '/' + id.toString());
    if (response.runtimeType == Success) {
      ClassRoom classroom = ClassRoom.fromJson(response.response);
      return classroom;
    } else {
      ClassRoom classroom = ClassRoom.fromJson({});
      return classroom;
    }
  }

  Future assignSubject(int classId, int subjectId) async {
    Map<String, dynamic> map = {};
    map['subject'] = subjectId.toString();
    var response = await _networkHandler.patch(
        getClassroomUrl + '/' + classId.toString(), map);
    if (response.runtimeType == Success) {
      ClassRoom classroom = ClassRoom.fromJson(response.response);
      return classroom;
    } else {
      ClassRoom classroom = ClassRoom.fromJson({});
      return classroom;
    }
  }
}
