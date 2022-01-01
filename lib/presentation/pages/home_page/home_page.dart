import 'package:flutter/material.dart';
import 'package:hamon_app/data/repositories/student_repository.dart';
import 'package:hamon_app/logic/app_provider.dart';
import 'package:hamon_app/presentation/pages/home_page/components/classroom_screen.dart';
import 'package:hamon_app/presentation/pages/home_page/components/student_screen.dart';
import 'package:hamon_app/presentation/pages/home_page/components/subject_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final StudentRepository _studentRepository = StudentRepository();
  final screens = [
    StudentScreen(),
    SubjectScreen(),
    ClassroomScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).getStudents();
    Provider.of<AppProvider>(context, listen: false).getSubjects();
    Provider.of<AppProvider>(context, listen: false).getClassrooms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<AppProvider>(builder: (context, appProvider, child) {
        return IndexedStack(
          index: appProvider.currentIndex,
          children: screens,
        );
      }),
      bottomNavigationBar:
          Consumer<AppProvider>(builder: (context, appProvider, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedIconTheme: const IconThemeData(size: 30),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Students'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Subjects'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'ClassRooms'),
          ],
          currentIndex: appProvider.currentIndex,
          onTap: (index) {
            appProvider.changeIndex(index);
          },
        );
      }),
    );
  }
}
