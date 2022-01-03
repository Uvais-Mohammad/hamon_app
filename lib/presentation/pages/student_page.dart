// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hamon_app/data/models/student_model.dart';

class StudentPage extends StatelessWidget {
  final Student student;
  StudentPage({required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Page'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          CircleAvatar(
            radius: 50,
            child: Text(student.name[0]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            student.name,
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Email : ${student.email}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Student Id: ${student.id}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Age : ${student.age}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
