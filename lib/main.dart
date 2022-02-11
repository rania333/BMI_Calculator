import 'package:flutter/material.dart';
import 'package:health_app/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(118, 246, 196, 255)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
          appBarTheme: const AppBarTheme(color: Color.fromARGB(214, 4, 2, 5))),
      home: InputPage(),
    );
  }
}
