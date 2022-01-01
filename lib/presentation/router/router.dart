import 'package:flutter/material.dart';
import 'package:hamon_app/presentation/pages/home_page.dart';
import 'package:hamon_app/presentation/pages/welcome_page.dart';

const String initalRoute = '/';
const String homeRoute = '/home';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? _args = settings.arguments;
    switch (settings.name) {
      case initalRoute:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
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
