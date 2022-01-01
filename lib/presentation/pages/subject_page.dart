import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/subject_model.dart';

class SubjectPage extends StatelessWidget {
  final Subject subject;

  const SubjectPage({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Subject'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Text(subject.name, style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 20),
            Text('Teacher : ${subject.teacher}',
                style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text('Credits : ${subject.credits}',
                style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text('ID : ${subject.id}',
                style: Theme.of(context).textTheme.headline4),
                
          ],
        ));
  }
}
