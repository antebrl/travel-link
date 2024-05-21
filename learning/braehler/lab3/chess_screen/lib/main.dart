import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 105,
          leading:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 15),
              SizedBox(height: 38,child: Image.asset('assets/appBar-top/profile.jpg')),
              SizedBox(width: 15),
              SizedBox(height: 30,child: Image.asset('assets/appBar-top/leagues.jpg')),
            ],
          ),
          centerTitle: true,
          title: SizedBox(
              height: 40,
            child: Image.asset('assets/appBar-top/chessCom-logo.jpg')),
          actions: [
            SizedBox(height: 33,child: Image.asset('assets/appBar-top/friends-action.jpg')),
            SizedBox(width: 20),
          ],
          backgroundColor: const Color(0xFF252422),
        ),
        
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
