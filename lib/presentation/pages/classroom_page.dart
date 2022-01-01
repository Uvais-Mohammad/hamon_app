import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/classroom_model.dart';

class ClassroomPage extends StatelessWidget {
  final ClassRoom classRoom;
  const ClassroomPage({required this.classRoom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Classroom'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Text(
              classRoom.name,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            Text(
              'Layout : ${classRoom.layout}',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Text(
              'Capacity : ${classRoom.size}',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Text(
              'Classroom ID : ${classRoom.id}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ));
  }
}
