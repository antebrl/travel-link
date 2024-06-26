import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/features/checklists/presentation/checklist_controller.dart';
import '../lib/checklist_items.dart';

class PersonalChecklistView extends ConsumerStatefulWidget {
  const PersonalChecklistView({required this.tripId, super.key});

  final String tripId;

  @override
  ConsumerState<PersonalChecklistView> createState() =>
      _PersonalChecklistViewState();
}

class _PersonalChecklistViewState extends ConsumerState<PersonalChecklistView> {
  TextEditingController _textController = TextEditingController();

  List<ChecklistItem> tasks = [];
  late User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  int getUserIndex(int index) {
    return tasks[index].asignees.indexOf(currentUser!.uid);
  }

  bool getUserCompleted(int taskIndex) {
    final userIndex = getUserIndex(taskIndex);
    return tasks[taskIndex].asigneesCompleted[userIndex];
  }

  Future<void> updateTask(int index) async {
    await ref.read(checklistControllerProvider.notifier).updateChecklistItem(
          data: tasks[index],
          tripId: widget.tripId,
        );
    ref.invalidate(fetchTripChecklistProvider(
        tripId: widget.tripId, uid: currentUser?.uid));
  }

  Future<void> _addTask(String title) async {
    _textController.clear();

    if (tasks.any((task) => task.title == title)) {
      return;
    }

    await ref.read(checklistControllerProvider.notifier).createPersonalChecklistItem(
          title: title,
          tripId: widget.tripId,
        );

    ref.invalidate(fetchTripChecklistProvider(
        tripId: widget.tripId, uid: currentUser?.uid));
  }

  Future<void> _addTaskAndClearSuggestions(String suggestion) async {
    await _addTask(suggestion);
  }

  Future<void> _removePersonalTask(int index) async {
    final userIndex = getUserIndex(index);

    if (userIndex != -1) {
      tasks[index].asignees.removeAt(userIndex);
      tasks[index].asigneesCompleted.removeAt(userIndex);
    }
    final data = tasks[index];
    setState(() {
      tasks.removeAt(index);
    });

    await ref.read(checklistControllerProvider.notifier).updateChecklistItem(
          data: data,
          tripId: widget.tripId,
        );
    ref.invalidate(fetchTripChecklistProvider(
        tripId: widget.tripId, uid: currentUser?.uid));
  }

  Future<void> _toggleTaskCompletion(int index) async {
    if (!getUserCompleted(index)) {
      tasks[index].asigneesCompleted[getUserIndex(index)] = true;
    } else {
      tasks[index].asigneesCompleted[getUserIndex(index)] = false;
    }

    await updateTask(index);
  }

  void _reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final task = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, task);
    });
  }

  void _editTask(int index) {
    final TextEditingController _editController =
        TextEditingController(text: tasks[index].title);
    DateTime? _selectedDueDate = tasks[index].dueDate;
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
              onPressed: () async {
                tasks[index].title = _editController.text;
                tasks[index].dueDate = _selectedDueDate;

                Navigator.of(context).pop();
                await updateTask(index);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchedChecklist =
        ref.watch(fetchTripChecklistProvider(tripId: widget.tripId, uid: currentUser?.uid));

    if (currentUser == null) {
      return const Center(
          child: Text('You need to log in to view personal Checklist'));
    } else {
      return fetchedChecklist.when(
        data: (checklist) {
          tasks = checklist;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return suggestions.where((String suggestion) {
                      return suggestion.toLowerCase().contains(
                          textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) async {
                    await _addTaskAndClearSuggestions(selection);
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    _textController = textEditingController;
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Add a new item',
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ReorderableListView(
                  onReorder: _reorderTasks,
                  children: [
                    for (int index = 0; index < tasks.length; index++)
                      Dismissible(
                        key: Key(tasks[index].title),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            _removePersonalTask(index);
                          } else if (direction == DismissDirection.startToEnd) {
                            _toggleTaskCompletion(index);
                          }
                        },
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            _toggleTaskCompletion(index);
                            return false;
                          } else {
                            return true;
                          }
                        },
                        background: Container(color: Colors.blue),
                        secondaryBackground: Container(color: Colors.red),
                        child: ListTile(
                          key: Key('task_$index'),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                  iconMap[tasks[index].title] ?? Icons.circle),
                              Checkbox(
                                value: getUserIndex(index) != -1 &&
                                    tasks[index].asigneesCompleted[getUserIndex(index)],
                                onChanged: (bool? value) {
                                  _toggleTaskCompletion(index);
                                },
                              ),
                            ],
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tasks[index].title),
                              if (tasks[index].dueDate != null)
                                Text(
                                  'Due date: ${DateFormat('MM/dd/yyyy').format(tasks[index].dueDate!)}',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
                                  _removePersonalTask(index);
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
}
