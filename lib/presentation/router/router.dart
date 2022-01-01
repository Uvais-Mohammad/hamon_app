import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/classroom_model.dart';
import 'package:hamon_app/data/models/student_model.dart';
import 'package:hamon_app/data/models/subject_model.dart';
import 'package:hamon_app/logic/app_provider.dart';
import 'package:hamon_app/presentation/pages/classroom_page.dart';
import 'package:hamon_app/presentation/pages/home_page/home_page.dart';
import 'package:hamon_app/presentation/pages/student_page.dart';
import 'package:hamon_app/presentation/pages/subject_page.dart';
import 'package:hamon_app/presentation/pages/welcome_page.dart';
import 'package:provider/provider.dart';

const String initalRoute = '/';
const String homeRoute = '/home';
const String studentPageRoute = '/studentPage';
const String subjectPageRoute = '/subjectPage';
const String classroomPageRoute = '/classroomPage';

final AppProvider appProvider = AppProvider();

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args=settings.arguments;
    switch (settings.name) {
      case initalRoute:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                  value: appProvider,
                  child: const HomePage(),
                ));
      case studentPageRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                  value: appProvider,
                  child:  StudentPage(student: args as Student,),
                ));
      case subjectPageRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                  value: appProvider,
                  child:  SubjectPage(subject:args as Subject ,),
                ));
      case classroomPageRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                  value: appProvider,
                  child:  ClassroomPage( id: args as int,),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Error"),
                  ),
                ));
    }
  }

  static void dispose() {}
}
