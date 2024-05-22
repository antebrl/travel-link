import 'package:flutter/material.dart';

class ChecklistsScreen extends StatefulWidget {
const ChecklistsScreen({super.key});

  @override
  State<ChecklistsScreen> createState() => _ChecklistsScreenState();
}

class _ChecklistsScreenState extends State<ChecklistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
      ),
      body: const Placeholder(),);
  }
}
