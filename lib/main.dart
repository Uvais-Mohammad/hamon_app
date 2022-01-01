import 'package:flutter/material.dart';
import 'package:hamon_app/presentation/router/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFCA28),
        primarySwatch: MaterialColor(
          0xFF4cae17,
          <int, Color>{
            50: Color(0x1aF5E0C3),
            100: Color(0xa1F5E0C3),
            200: Color(0xaaF5E0C3),
            300: Color(0xafF5E0C3),
            400: Color(0xffF5E0C3),
            500: Color(0xFF4cae17),
            600: Color(0xffDEC29B),
            700: Color(0xffC9A87C),
            800: Color(0xffB28E5E),
            900: Color(0xff936F3E)
          },
        ),
      ),
      initialRoute: router.initalRoute,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
