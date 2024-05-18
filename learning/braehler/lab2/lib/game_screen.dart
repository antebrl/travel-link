import 'dart:math';

import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<({String text, Offset position})> _words = [];
  String _inputedText = '';
  bool _isTextFieldEditable = true;
  DateTime? _startTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: TextField(
                    enabled: _isTextFieldEditable,
                    controller: _textEditingController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter something...',
                      labelText: 'Input',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.8,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white60,
                          width: 0.8,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.8,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (!_isTextFieldEditable) return;
                    setState(() {
                      _textEditingController.text.split(' ').forEach((e) {
                        final random = Random();
                        final left = random.nextDouble() *
                            (MediaQuery.of(context).size.width - 60);
                        final top = random.nextDouble() *
                            (MediaQuery.of(context).size.height - 60);
                        _words.add((
                          text: e,
                          position: Offset(left + 30, top + 30),
                        ));
                      });
                      _inputedText = _textEditingController.text;
                      _textEditingController.clear();
                      _isTextFieldEditable = false;
                      _startTime = DateTime.now();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      'Play',
                      style: TextStyle(fontSize: 25, color: Colors.cyan[700]),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: _words.map((entry) {
                return Positioned(
                  left: entry.position.dx,
                  top: entry.position.dy,
                  child: GestureDetector(
                    onTap: () async {
                      if (_words.length == 1) {
                        setState(() {
                          _textEditingController.text += entry.text;
                          _words.remove(entry);
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: _textEditingController.text == _inputedText
                                  ? const Center(
                                      child: Text(
                                        'Correct!',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    )
                                  : const Center(
                                      child: Text(
                                        'Incorrect!',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize:
                                    MainAxisSize.min, // Set mainAxisSize to min
                                children: [
                                  Text(
                                      'You entered: ${_textEditingController.text}'),
                                  Text('Correct answer: $_inputedText'),
                                  const SizedBox(height: 10),
                                  Text(
                                      'Time taken: ${DateTime.now().difference(_startTime!).inSeconds} seconds'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Continue Playing',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Go Back',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        setState(() {
                          _isTextFieldEditable = true;
                        });
                      } else {
                        setState(() {
                          _textEditingController.text += ('${entry.text} ');
                          _words.remove(entry);
                        });
                      }
                    },
                    child: Chip(
                      label: Text(
                        entry.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.cyan[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      shape: const StadiumBorder(
                        side: BorderSide(style: BorderStyle.none),
                      ),
                      shadowColor: Colors.grey[800],
                      elevation: 8,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
