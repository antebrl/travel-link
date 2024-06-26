import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';
import 'package:travel_link/src/features/checklists/domain/checklist_item.dart';
import 'package:travel_link/src/features/checklists/presentation/checklist_controller.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import '../lib/checklist_items.dart';
import 'package:travel_link/src/common_widgets/participants_avatar_stack.dart';

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
    await ref
        .read(checklistControllerProvider.notifier)
        .updateChecklistItem(data: tasks[index], tripId: widget.tripId);
    ref.invalidate(
        fetchTripChecklistProvider(tripId: widget.tripId, onlyPublic: true));
  }

  Future<void> _addTask(String title) async {
    _textController.clear();

    if (tasks.any((task) => task.title == title)) {
      return;
    }

    await ref
        .read(checklistControllerProvider.notifier)
        .createChecklistItem(
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
                              : 'Due date: ${DateFormat('dd/MM/yyyy').format(_selectedDueDate!)}',
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
                      final userAvatar = ref.read(FetchUserProvider(user).future);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedUsers.remove(user);
                            } else {
                              _selectedUsers.add(user);
                            }
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            
                            FutureBuilder(future: userAvatar, builder: 
                              (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                                  return const CircleAvatar(radius: 20, child: const Placeholder());
                                } else if (snapshot.hasError) {
                                  return const CircleAvatar(radius: 20, child: const Placeholder());
                                } else {
                                  return CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data!.pictureUrl ?? CustomImages.defaultProfilePictureUrl),
                                    radius: 20,
                                  );
                                }
                              }
                            ),
                            

                            if (isSelected)
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: const Icon(Icons.check,
                                    color: Colors.white),
                              ),
                          ],
                        ),
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

  double _calculateCompletionPercentage(ChecklistItem item) {
    if (item.asignees.isEmpty) {
      return 0.0;
    }
    final completedCount = item.asigneesCompleted.where((completed) => completed).length;
    return completedCount / item.asignees.length;
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
                child: RawAutocomplete<String>(
                  focusNode: _focusNode,
                  textEditingController: _textController,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    // if (textEditingValue.text.isEmpty) {
                    //   return const Iterable<String>.empty();
                    // }
                    return suggestions.where((String suggestion) {
                      return suggestion
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) async {
                    await _addTask(selection);
                    _focusNode.unfocus();
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: 'Add a new item',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            _focusNode.unfocus();
                            await _addTask(textEditingController.text);
                          },
                          icon: const Icon(Icons.check),
                          color: CustomColors.primary,
                        ),
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: Material(
                            color: Colors.blue.shade50,
                            elevation: 4,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: options.length * 50 < 200
                                      ? options.length * 50
                                      : 200),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final option = options.elementAt(index);
                                  return Container(
                                    height: 50,
                                    color: Colors.blue.shade50,
                                    child: ListTile(
                                      leading: Icon(iconMap[option]),
                                      title: Text(option),
                                      onTap: () {
                                        onSelected(option);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
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
                              Icon(
                                  iconMap[tasks[index].title] ?? Icons.circle),
                              Checkbox(
                                value: getUserIndex(index) != -1 &&
                                    tasks[index].asigneesCompleted[
                                        getUserIndex(index)],
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
                                  'Due date: ${DateFormat('dd/MM/yyyy').format(tasks[index].dueDate!)}',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              if (tasks[index].asignees.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    ParticipantsAvatarStack(
                                      participants: tasks[index].asignees,
                                    ),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value: _calculateCompletionPercentage(tasks[index]),
                                      backgroundColor: Colors.grey[200],
                                      color: Colors.blue,
                                    ),
                                  ],
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
