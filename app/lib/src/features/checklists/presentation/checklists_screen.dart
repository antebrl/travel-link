import 'package:flutter/material.dart';

class ChecklistsScreen extends StatefulWidget {
  const ChecklistsScreen({super.key});

  @override
  State<ChecklistsScreen> createState() => _ChecklistsScreenState();
}

class _ChecklistsScreenState extends State<ChecklistsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Personal'),
            Tab(text: 'Group'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChecklistView(),
          ChecklistView(),
        ],
      ),
    );
  }
}

class ChecklistView extends StatefulWidget {
  const ChecklistView({super.key});

  @override
  State<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends State<ChecklistView> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                      return ListTile(
                        title: Text(_filteredSuggestions[index]),
                        onTap: () {
                          _textController.text = _filteredSuggestions[index];
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
    );
  }
}

class Task {
  Task({required this.title, this.isCompleted = false});

  String title;
  bool isCompleted;
}

void main() {
  runApp(const MaterialApp(
    home: ChecklistsScreen(),
  ));
}
