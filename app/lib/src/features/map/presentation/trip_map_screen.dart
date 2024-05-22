import 'package:flutter/material.dart';

class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Map'),
      ),
      body: const Placeholder(),);
  }
}
