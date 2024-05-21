import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App Lab2",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: const FirstScreen(),
      routes: {
        '/greeting': (context) => const FirstScreen(),
        '/input': (context) => const SecondScreen(),
        '/list': (context) => const ListScreen(),
      },
    );
  }
}
