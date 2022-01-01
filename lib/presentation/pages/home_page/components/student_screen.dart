import 'package:flutter/material.dart';
import 'package:hamon_app/logic/app_provider.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, _) => appProvider.students.isNotEmpty
          ? ListView.builder(
              itemCount: appProvider.students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      appProvider.students[index].name[0],
                    ),
                  ),
                  tileColor: Color(0xffE6FADB),
                  title: Text(appProvider.students[index].name,
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(appProvider.students[index].email),
                  onTap: () {},
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
