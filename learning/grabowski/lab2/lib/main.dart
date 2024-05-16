import 'package:flutter/material.dart';
import 'package:lab2/second_screen.dart';

//sources for images: https://ichef.bbci.co.uk/childrens-responsive-ichef-live/r/400/1x/cbeebies/animals-title.png, https://cdn.seriouspuzzles.com/content/product/media/large/628136005425-1.jpg
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://ichef.bbci.co.uk/childrens-responsive-ichef-live/r/400/1x/cbeebies/animals-title.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SecondScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFfc6d09),
                foregroundColor: Colors.white,
                elevation: 5,
                textStyle: const TextStyle(fontSize: 20),
                padding: const EdgeInsets.all(20),
              ),
              child: const Text('Start the game!'),
            ),
          ],
        ),
      ),
    );
  }
}
