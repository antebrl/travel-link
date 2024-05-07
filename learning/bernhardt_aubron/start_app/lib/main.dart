import 'package:flutter/material.dart';
import 'main_page.dart';
import 'second_page.dart';

var pageIndex = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; // Initialize selectedIndex to 0
  var pageIndex = 0; // Add this line

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Main_Page();
        break;
      case 1:
        page = SecondPage();
        break;
      default:
        throw UnimplementedError('No Widget for $selectedIndex');
    }

    return Scaffold(
      body: Stack(
        children: [page],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pageIndex == 0) {
            pageIndex = 1;
          } else if (pageIndex == 1) {
            pageIndex = 0;
          }
          setState(() {
            selectedIndex =
                pageIndex; // Update selectedIndex when the button is pressed
          });
        },
        tooltip: 'See next Page',
        child: const Icon(Icons.switch_access_shortcut),
      ),
    );
  }
}
