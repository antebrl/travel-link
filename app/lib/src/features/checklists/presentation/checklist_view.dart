import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/checklists/data/checklist_repository.dart';

class ChecklistView extends ConsumerStatefulWidget {
  const ChecklistView({required this.tripId, super.key});

  final String tripId;

  @override
  ConsumerState<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends ConsumerState<ChecklistView> {
  final List<Task> _tasks = [];
  final TextEditingController _textController = TextEditingController();
  final List<String> _suggestions = [
    'Alarm clock - Wecker', 'Aspirin - Aspirin', 'Backpack - Rucksack', 'Bandages - Verbände',
    'Bathing suit - Badeanzug', 'Batteries - Batterien', 'Belt - Gürtel', 'Book - Buch',
    'Bottle opener - Flaschenöffner', 'Camera - Kamera', 'Cash - Bargeld', 'Charging cable - Ladekabel',
    'Clothes - Kleidung', 'Contact lenses - Kontaktlinsen', 'Credit card - Kreditkarte', 'Deodorant - Deodorant',
    'Driver’s license - Führerschein', 'Earplugs - Ohrstöpsel', 'E-reader - E-Reader',
    'Emergency contact list - Notfallkontaktliste', 'Flashlight - Taschenlampe', 'Flip flops - Flip Flops',
    'Fork - Gabel', 'Gloves - Handschuhe', 'Hairbrush - Haarbürste', 'Hairdryer - Haartrockner',
    'Handbag - Handtasche', 'Headphones - Kopfhörer', 'Health insurance card - Krankenversicherungskarte',
    'Hiking boots - Wanderschuhe', 'iPad - iPad', 'iPhone - iPhone', 'Keychain - Schlüsselbund', 'Keys - Schlüssel',
    'Knife - Messer', 'Laptop - Laptop', 'Luggage - Gepäck', 'Luggage tag - Gepäckanhänger', 'Map - Karte',
    'Memory card - Speicherkarte', 'Passport - Reisepass', 'Passport photos - Passfotos', 'Pen - Stift', 'Perfume - Parfüm',
    'ID - Personalausweis', 'Phone - Telefon', 'Raincoat - Regenmantel', 'Razor - Rasierer', 'Sandals - Sandalen',
    'Scarf - Schal', 'Shampoo - Shampoo', 'Shoes - Schuhe', 'Shorts - Shorts', 'Shower gel - Duschgel', 'SIM card - SIM-Karte',
    'Sleepwear - Schlafanzug', 'Socks - Socken', 'Sports equipment - Sportausrüstung', 'Suitcase - Koffer',
    'Sunglasses - Sonnenbrille', 'Sunscreen - Sonnencreme', 'Swimsuit - Badeanzug', 'Tablet - Tablet', 'Tissues - Taschentücher',
    'Toothbrush - Zahnbürste', 'Toothpaste - Zahnpasta', 'Towel - Handtuch', 'Trousers - Hose', 'Umbrella - Regenschirm',
    'Underwear - Unterwäsche', 'USB cable - USB-Kabel', 'Walking shoes - Wanderschuhe', 'Wallet - Geldbörse', 'Watch - Uhr',
    'Water - Wasser', 'Travel insurance - Reiseversicherung', 'Safety pins - Sicherheitsnadeln', 'Sunglass case - Sonnenbrillenetui'
  ];
  List<String> _filteredSuggestions = [];

  final Map<String, IconData> _iconMap = {
    'Alarm clock - Wecker': Icons.alarm,
    'Aspirin - Aspirin': Icons.healing,
    'Backpack - Rucksack': Icons.backpack,
    'Bandages - Verbände': Icons.local_hospital,
    'Bathing suit - Badeanzug': Icons.beach_access,
    'Batteries - Batterien': Icons.battery_full,
    'Belt - Gürtel': Icons.accessibility,
    'Book - Buch': Icons.book,
    'Bottle opener - Flaschenöffner': Icons.kitchen,
    'Camera - Kamera': Icons.camera,
    'Cash - Bargeld': Icons.money,
    'Charging cable - Ladekabel': Icons.power,
    'Clothes - Kleidung': Icons.checkroom,
    'Contact lenses - Kontaktlinsen': Icons.remove_red_eye,
    'Credit card - Kreditkarte': Icons.credit_card,
    'Deodorant - Deodorant': Icons.brush,
    'Driver’s license - Führerschein': Icons.card_membership,
    'Earplugs - Ohrstöpsel': Icons.hearing,
    'E-reader - E-Reader': Icons.tablet,
    'Emergency contact list - Notfallkontaktliste': Icons.contact_phone,
    'Flashlight - Taschenlampe': Icons.flashlight_on,
    'Flip flops - Flip Flops': Icons.waves,
    'Fork - Gabel': Icons.restaurant,
    'Gloves - Handschuhe': Icons.handyman,
    'Hairbrush - Haarbürste': Icons.brush,
    'Hairdryer - Haartrockner': Icons.air,
    'Handbag - Handtasche': Icons.shopping_bag,
    'Headphones - Kopfhörer': Icons.headphones,
    'Health insurance card - Krankenversicherungskarte': Icons.health_and_safety,
    'Hiking boots - Wanderschuhe': Icons.hiking,
    'iPad - iPad': Icons.tablet_mac,
    'iPhone - iPhone': Icons.phone_iphone,
    'Keychain - Schlüsselbund': Icons.vpn_key,
    'Keys - Schlüssel': Icons.vpn_key,
    'Knife - Messer': Icons.kitchen,
    'Laptop - Laptop': Icons.laptop,
    'Luggage - Gepäck': Icons.luggage,
    'Luggage tag - Gepäckanhänger': Icons.tag,
    'Map - Karte': Icons.map,
    'Memory card - Speicherkarte': Icons.sd_card,
    'Passport - Reisepass': Icons.travel_explore,
    'Passport photos - Passfotos': Icons.photo,
    'Pen - Stift': Icons.edit,
    'Perfume - Parfüm': Icons.spa,
    'ID - Personalausweis': Icons.card_membership,
    'Phone - Telefon': Icons.phone,
    'Raincoat - Regenmantel': Icons.umbrella,
    'Razor - Rasierer': Icons.content_cut,
    'Sandals - Sandalen': Icons.beach_access,
    'Scarf - Schal': Icons.checkroom,
    'Shampoo - Shampoo': Icons.local_hospital,
    'Shoes - Schuhe': Icons.shopping_bag,
    'Shorts - Shorts': Icons.checkroom,
    'Shower gel - Duschgel': Icons.local_hospital,
    'SIM card - SIM-Karte': Icons.sim_card,
    'Sleepwear - Schlafanzug': Icons.bedtime,
    'Socks - Socken': Icons.checkroom,
    'Sports equipment - Sportausrüstung': Icons.sports,
    'Suitcase - Koffer': Icons.luggage,
    'Sunglasses - Sonnenbrille': Icons.wb_sunny,
    'Sunscreen - Sonnencreme': Icons.wb_sunny,
    'Swimsuit - Badeanzug': Icons.beach_access,
    'Tablet - Tablet': Icons.tablet,
    'Tissues - Taschentücher': Icons.announcement,
    'Toothbrush - Zahnbürste': Icons.brush,
    'Toothpaste - Zahnpasta': Icons.local_hospital,
    'Towel - Handtuch': Icons.beach_access,
    'Trousers - Hose': Icons.checkroom,
    'Umbrella - Regenschirm': Icons.umbrella,
    'Underwear - Unterwäsche': Icons.checkroom,
    'USB cable - USB-Kabel': Icons.usb,
    'Walking shoes - Wanderschuhe': Icons.hiking,
    'Wallet - Geldbörse': Icons.account_balance_wallet,
    'Watch - Uhr': Icons.watch,
    'Water - Wasser': Icons.water,
    'Travel insurance - Reiseversicherung': Icons.card_travel,
    'Safety pins - Sicherheitsnadeln': Icons.safety_check,
    'Sunglass case - Sonnenbrillenetui': Icons.wb_sunny,
  };

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
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
                      child: ListView.builder(
                        itemCount: _filteredSuggestions.length,
                        itemBuilder: (context, index) {
                          String suggestion = _filteredSuggestions[index];
                          IconData? icon = _iconMap[suggestion];
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
                        _removeTask(index);
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        key: Key('task_$index'),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(_iconMap[_tasks[index].title] ?? Icons.circle),
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
                                style: TextStyle(fontSize: 12, color: Colors.grey),
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
