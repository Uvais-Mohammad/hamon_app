import 'package:hamon_app/data/constants/endpoints.dart';
import 'package:hamon_app/data/data%20providers/network_handler.dart';
import 'package:hamon_app/data/models/api_status.dart';
import 'package:hamon_app/data/models/subject_model.dart';

class SubjectRepository {

  final NetworkHandler _networkHandler=NetworkHandler();
  Future getSubjects() async {
    var response = await _networkHandler.get(getSubjectsUrl);
    Iterable l = response.response['subjects'];
    if (response.runtimeType == Success) {
      List<Subject> subjects =
          l.map((model) => Subject.fromJson(model)).toList();
      return subjects;
    } else {
      List<Subject> subjects = [];
      return subjects;
    }
  }
}
