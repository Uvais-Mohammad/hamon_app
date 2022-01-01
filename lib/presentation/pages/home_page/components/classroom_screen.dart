import 'package:flutter/material.dart';
import 'package:hamon_app/logic/app_provider.dart';
import 'package:provider/provider.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, _) => appProvider.classrooms.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 3),
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.8),
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            Theme.of(context).primaryColor.withOpacity(0.2),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appProvider.classrooms[index].name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            appProvider.classrooms[index].layout,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Size :${appProvider.classrooms[index].size.toString()}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: appProvider.classrooms.length,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
