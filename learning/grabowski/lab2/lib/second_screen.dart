import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> animalList = [
    'LION',
    'ELEPHANT',
    'SHEEP',
    'GORILLA',
    'BIRD',
    'MONKEY',
    'DOG',
    'TIGER',
    'CAMEL',
    'PENGUIN',
    'CROCODILE',
    'ZEBRA',
    'GIRAFFE',
    'HIPPOPOTAMUS',
    'SNAKE',
    'BEAR',
    'MOLEDIVER',
    'RHINO'
  ];

  String? enteredAnimal;
  String? animalInfo;
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> foundAnimals = [];

  Color customColor = const Color(0xFFfc6d09);
  TextStyle customTextStyle = const TextStyle(
    color: Color(0xFFfc6d09),
  );

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Find all animals!',
          style: TextStyle(
            color: Color(0xFFfc6d09),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset(
                    'assets/images/zoo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: customTextStyle,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            label:
                                Text('Enter an animal', style: customTextStyle),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: customColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: customColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              enteredAnimal = value.toUpperCase();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (enteredAnimal != null &&
                                animalList.contains(enteredAnimal)) {
                              animalInfo =
                                  'Well done: $enteredAnimal is in the zoo!';
                              foundAnimals.add(enteredAnimal!);
                            } else {
                              animalInfo =
                                  'Unfortunately, $enteredAnimal is not in the zoo, keep searching!';
                            }
                            _textEditingController.clear();
                  
                            if (foundAnimals.length == animalList.length) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Congratulations!',
                                    style: customTextStyle,
                                  ),
                                  content: Text(
                                    'You found all the animals!',
                                    style: customTextStyle,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          foundAnimals.clear();
                                          Navigator.pop(context);
                                          animalInfo = null;
                                        });
                                      },
                                      child: Text(
                                        'Play again',
                                        style: customTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                          foregroundColor: Colors.white,
                          elevation: 5,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text('Check'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                if (animalInfo != null)
                  Text(
                    animalInfo!,
                    style: customTextStyle,
                  ),
                const SizedBox(height: 5),
                Text(
                  'You already found:',
                  style: customTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                for (String animal in foundAnimals)
                  Text(
                    animal,
                    style: customTextStyle,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
