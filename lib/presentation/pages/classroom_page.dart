import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/student_model.dart';
import 'package:hamon_app/data/models/subject_model.dart';
import 'package:hamon_app/logic/app_provider.dart';
import 'package:provider/provider.dart';

class ClassroomPage extends StatefulWidget {
  final int id;
  const ClassroomPage({required this.id});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).getClassroom(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Classroom'),
        ),
        body: Consumer<AppProvider>(
          builder: (context, appProvider, _) {
            final classroom = appProvider.classroom;
            if (classroom == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Text(
                  classroom.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                Text(
                  'Layout : ${classroom.layout}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Text(
                  'Capacity : ${classroom.size}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Text(
                  'Classroom ID : ${classroom.id}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Text(
                  'Subject : ${classroom.subject.runtimeType == String ? '' : classroom.subject.toString()}',
                  // 'Subject : ${classroom.subject?.toString() ?? 'No subject'}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            );
          },
        ),
        floatingActionButton: Consumer<AppProvider>(
          builder: (context, appProvider, _) {
            return Row(
              children: [
                const Spacer(),
                FloatingActionButton.extended(
                  onPressed: () {
                    appProvider.classroom!.subject.runtimeType != String
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return ChangeNotifierProvider.value(
                                value: appProvider,
                                child: AlertDialog(
                                  title: const Text('Assign Student'),
                                  content: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: Consumer<AppProvider>(
                                          builder: (context, provider, child) {
                                        provider.subjects.isEmpty
                                            ? provider.getStudents()
                                            : null;
                                        return DropdownButtonFormField<int>(
                                          isExpanded: true,
                                          value: provider.students.isNotEmpty
                                              ? provider.students[0].id
                                              : null,
                                          hint: const Text('Select Student'),
                                          onChanged: (value) {
                                            provider.setSubject(value!.toInt());
                                          },
                                          icon: (null),
                                          iconSize: 30,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                          items: provider.students
                                              .map<DropdownMenuItem<int>>(
                                                  (Student value) {
                                            return DropdownMenuItem<int>(
                                              value: value.id,
                                              child: Text(value.name),
                                            );
                                          }).toList(),
                                        );
                                      }),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        appProvider.assignSubject(widget.id,
                                            appProvider.selectedSubject);
                                      },
                                      child: const Text('Assign'),
                                    ),
                                  ],
                                ),
                              );
                            })
                        : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text(
                                'Please add subject before adding student'),
                          ));
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text('Assign Student'),
                  heroTag: 'btn1',
                ),
                const SizedBox(width: 20),
                FloatingActionButton.extended(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: appProvider,
                            child: AlertDialog(
                              title: const Text('Assign Subject'),
                              content: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: Consumer<AppProvider>(
                                      builder: (context, provider, child) {
                                    provider.subjects.isEmpty
                                        ? provider.getSubjects()
                                        : null;
                                    return DropdownButtonFormField<int>(
                                      isExpanded: true,
                                      value: provider.subjects.isNotEmpty
                                          ? provider.subjects[0].id
                                          : null,
                                      hint: const Text('Select Subject'),
                                      onChanged: (value) {
                                        provider.setSubject(value!.toInt());
                                      },
                                      icon: (null),
                                      iconSize: 30,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                      ),
                                      items: provider.subjects
                                          .map<DropdownMenuItem<int>>(
                                              (Subject value) {
                                        return DropdownMenuItem<int>(
                                          value: value.id,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    appProvider.assignSubject(
                                        widget.id, appProvider.selectedSubject);
                                  },
                                  child: const Text('Assign'),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: const Icon(Icons.bookmark_add),
                  label: const Text('Assign Subject'),
                  heroTag: 'btn2',
                ),
              ],
            );
          },
        ));
  }
}
