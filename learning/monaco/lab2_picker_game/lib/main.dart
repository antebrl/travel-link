import 'dart:async';

import 'package:flutter/material.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 222, 19, 19)),
        useMaterial3: true,
      ),
      home: const GameHomePage(),
    );
  }
}

class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Picker Game';

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {

  final timerInputController =
      TextEditingController.fromValue(const TextEditingValue(text: '5'));

  @override
  void initState() {
    super.initState();
    timerInputController.value = const TextEditingValue(text: '5');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Picker Game!',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: timerInputController,
                decoration: const InputDecoration(
                  labelText: 'Timer',
                  hintText: 'Enter time in seconds',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePage(
                                  time: int.parse(
                                      timerInputController.value.text),
                                )),
                      );
                    },
                    label: const Text('START'),
                    icon: const Icon(Icons.play_arrow),
                  ),
                ),
                ElevatedButton.icon(
                  label: const Text(' How to play '),
                  icon: const Icon(Icons.question_mark),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Game Rules'),
                            content: const Text(
                                'This is a simple game. You have to click the button as many times as you can in the defined amount of seconds.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key, required time}) : timer = time;

  final int timer;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool gameStarted = false;
  late int counter;
  int clickCounter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.timer;
  }

  void startGame() {
    resetGame();
    print("Game Started");
    gameStarted = true;
    clickCounter = 0;
    startCountdown();
  }

  void increaseCounter() {
    setState(() {
      clickCounter++;
    });
  }

  void resetGame() {
    setState(() {
      counter = widget.timer;
      clickCounter = 0;
    });
  }

  void startCountdown() {
    if (counter <= 0) {
      handleTimeout();
    }

    if (counter > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          counter--;
        });
        startCountdown();
      });
    }
  }

  void handleTimeout() {
    print('Game Over');
    gameStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Click the button as many times as you can in $counter seconds.',
                      ),
                      const Text(
                        'Time left:',
                      ),
                      Text(
                        '$counter',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Clicks: $clickCounter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Visibility(
                        visible: !gameStarted,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            startGame();
                          },
                          label: const Text('START'),
                          icon: const Icon(Icons.play_arrow),
                        ),
                      ),
                ],
              ),
            ),
            const SizedBox(height: 200),
            Expanded(
              child: FittedBox(
                child: ElevatedButton.icon(
                  onPressed: gameStarted ? increaseCounter : null,
                  label: const Text('CLICK'),
                  icon: const Icon(Icons.touch_app),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
