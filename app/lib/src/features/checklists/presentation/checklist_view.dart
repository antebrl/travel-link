import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/features/checklists/presentation/checklist_controller.dart';
import '../lib/checklist_items.dart'; // Import the new file

class ChecklistView extends ConsumerStatefulWidget {
  const ChecklistView(
      {required this.participants, required this.tripId, super.key});

  final String tripId;
  final List<String> participants;

  @override
  ConsumerState<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends ConsumerState<ChecklistView> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredSuggestions = [];

  List<ChecklistItem> tasks = [];
  late User? currentUser;

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = suggestions;
    currentUser = ref.read(firebaseAuthProvider).currentUser;
  }

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
    ref.invalidate(
        fetchTripChecklistProvider(tripId: widget.tripId, onlyPublic: true));
  }

  Future<void> _addTask(String title) async {
    _textController.clear();
    _filterSuggestions('');

    if (tasks.any((task) => task.title == title)) {
      return;
    }

    await ref.read(checklistControllerProvider.notifier).createChecklistItem(
          title: title,
          tripId: widget.tripId,
          asignees: widget.participants,
          onlyOneCompletion: false,
        );

    ref.invalidate(
        fetchTripChecklistProvider(tripId: widget.tripId, onlyPublic: true));
  }

  Future<void> _removeTask(int index) async {
    //firebase remove task: to do
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
  List<String> _selectedUsers = List.from(tasks[index].asignees);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                const SizedBox(height: 16),
                const Text('Assign Users'),
                Wrap(
                  children: widget.participants.map((user) {
                    final isSelected = _selectedUsers.contains(user);
                    return ChoiceChip(
                      label: Text(user),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedUsers.add(user);
                          } else {
                            _selectedUsers.remove(user);
                          }
                        });
                      },
                    );
                  }).toList(),
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
                  tasks[index].asignees = _selectedUsers;

                  Navigator.of(context).pop();
                  await updateTask(index);
                },
              ),
            ],
          );
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final fetchedChecklist = ref.watch(
        fetchTripChecklistProvider(tripId: widget.tripId, onlyPublic: true));

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
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                    for (int index = 0; index < tasks.length; index++)
                      Dismissible(
                        key: Key(tasks[index].title),
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
                              Icon(iconMap[tasks[index].title] ?? Icons.circle),
                              Checkbox(
                                value: getUserIndex(index) != -1 &&
                                    tasks[index]
                                        .asigneesCompleted[getUserIndex(index)],
                                onChanged: getUserIndex(index) != -1
                                    ? (bool? value) {
                                        _toggleTaskCompletion(index);
                                      }
                                    : null,
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
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              if (tasks[index].asignees.isNotEmpty)
                                Text(
                                  'Assignees: ${tasks[index].asignees.join(', ')}',
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
}
