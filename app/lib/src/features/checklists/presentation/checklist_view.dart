import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import '../lib/checklist_items.dart'; // Import the new file

class ChecklistView extends ConsumerStatefulWidget {
  const ChecklistView({required this.tripId, super.key});

  final String tripId;

  @override
  ConsumerState<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends ConsumerState<ChecklistView> {
  final List<Task> _tasks = [];
  final TextEditingController _textController = TextEditingController();
  List<String> _filteredSuggestions = [];

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
    _textController.clear();
    _filterSuggestions('');
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

  void _editTask(int index) {
    final TextEditingController _editController = TextEditingController(text: _tasks[index].title);
    DateTime? _selectedDueDate = _tasks[index].dueDate;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _editController,
                decoration: const InputDecoration(hintText: 'Edit item'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDueDate == null
                          ? 'No due date set'
                          : 'Due date: ${DateFormat('MM/dd/yyyy').format(_selectedDueDate!)}',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDueDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDueDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  _tasks[index].title = _editController.text;
                  _tasks[index].dueDate = _selectedDueDate;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchedChecklist = ref.watch(fetchTripChecklistProvider(tripId: widget.tripId));

    return fetchedChecklist.when(
      data: (checklist) {
        // Use checklist just like List
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Add a new item',
                          ),
                          onChanged: _filterSuggestions,
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
                  if (_filteredSuggestions.isNotEmpty)
                    Container(
                      height: 150, // Adjust height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: _filteredSuggestions.length,
                        itemBuilder: (context, index) {
                          String suggestion = _filteredSuggestions[index];
                          IconData? icon = iconMap[suggestion];
                          return ListTile(
                            leading: icon != null ? Icon(icon) : null,
                            title: Text(suggestion),
                            onTap: () {
                              _textController.text = suggestion;
                              _filteredSuggestions = [];
                              _addTask(_textController.text);
                            },
                          );
                        },
                      ),
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
                        if (direction == DismissDirection.endToStart) {
                          _removeTask(index);
                        } else if (direction == DismissDirection.startToEnd) {
                          _toggleTaskCompletion(index);
                        }
                      },
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          _toggleTaskCompletion(index);
                          return false; // Prevent dismissal
                        } else {
                          return true; // Allow dismissal
                        }
                      },
                      background: Container(color: Colors.blue),
                      secondaryBackground: Container(color: Colors.red),
                      child: ListTile(
                        key: Key('task_$index'),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(iconMap[_tasks[index].title] ?? Icons.circle),
                            Checkbox(
                              value: _tasks[index].isCompleted,
                              onChanged: (bool? value) {
                                _toggleTaskCompletion(index);
                              },
                            ),
                          ],
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_tasks[index].title),
                            if (_tasks[index].dueDate != null)
                              Text(
                                'Due date: ${DateFormat('MM/dd/yyyy').format(_tasks[index].dueDate!)}',
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _editTask(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _removeTask(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        return const Center(
          child: Text('Error loading trips. Please try again later.'),
        );
      },
    );
  }
}

class Task {
  Task({required this.title, this.isCompleted = false, this.dueDate});

  String title;
  bool isCompleted;
  DateTime? dueDate;
}
