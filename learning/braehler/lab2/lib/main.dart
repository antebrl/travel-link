import 'package:flutter/material.dart';
import 'package:lab2/game_screen.dart';
import 'package:lab2/greeting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab2 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GreetingScreen(),
      routes: {
        '/greeting': (context) => const GreetingScreen(),
        '/input': (context) => const InputScreen(),
      },
    );
  }
}
