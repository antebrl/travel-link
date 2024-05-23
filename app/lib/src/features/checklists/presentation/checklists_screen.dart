import 'package:flutter/material.dart';

class ChecklistsScreen extends StatefulWidget {
  const ChecklistsScreen({super.key});

  @override
  State<ChecklistsScreen> createState() => _ChecklistsScreenState();
}

class _ChecklistsScreenState extends State<ChecklistsScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _textController = TextEditingController();

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
    _textController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final task = _tasks.removeAt(oldIndex);
      _tasks.insert(newIndex, task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new item',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _addTask(_textController.text);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: _reorderTasks,
              children: [
                for (int index = 0; index < _tasks.length; index++)
                  Dismissible(
                    key: Key(_tasks[index].title),
                    onDismissed: (direction) {
                      _removeTask(index);
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      key: Key('task_$index'),
                      title: Text(_tasks[index].title),
                      leading: Checkbox(
                        value: _tasks[index].isCompleted,
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(index);
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeTask(index);
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  Task({required this.title, this.isCompleted = false});

  String title;
  bool isCompleted;
}
