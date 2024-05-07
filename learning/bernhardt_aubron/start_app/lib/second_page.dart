import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int worldIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'A Look into our Dark Future',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline, // Adding underline
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        worldIndex = (worldIndex + 1) % featuredWorlds.length;
                      });
                    },
                    child: const Text("See the next world"),
                  ),
                  const Padding(padding: EdgeInsets.all(16.0)),
                  // Hardcoded information
                  const Text(
                    "World Name:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const Text(
                    "Population:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].pop,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const Text(
                    "World History:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].info,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const Text(
                    "Faction Name:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].alliance.faktion,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const Text(
                    "Faction Goals:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].alliance.goal,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Padding(padding: EdgeInsets.all(8.0)),
                  const Text(
                    "Notable Faction Quote:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    featuredWorlds[worldIndex].alliance.quote,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
    );
  }
}

class PlanetaryInfo {
  String name = "";
  String pop = "";
  Faktions alliance = Faktions("faktionName", "allegedGoal", "notableQuote");
  String info = "";
  PlanetaryInfo(String planetName, String population, Faktions alliegence,
      String infoText) {
    name = planetName;
    pop = population;
    alliance = alliegence;
    info = infoText;
  }
}

class Faktions {
  String faktion = "";
  String goal = "";
  String quote = "";
  Faktions(String faktionName, String allegedGoal, String notableQuote) {
    faktion = faktionName;
    goal = allegedGoal;
    quote = notableQuote;
    return;
  }
}

var krieg = PlanetaryInfo("Krieg", "Billions", imperium,
    """Krieg was once a lush and prosperous world, but it descended into a nuclear wasteland during the Horus Heresy. Survivors were forced to live in underground shelters, and over time, their culture became one of total devotion to the Emperor. They supply some of the most disciplined and numerous troops to the Imperial Guard.""");

var terra = PlanetaryInfo("Terra", "Trillions", imperium,
    """Terra is the birthplace of humanity and the center of the Imperium. It has been heavily industrialized and is covered in vast cities, including the Imperial Palace, the seat of power for the Emperor of Mankind. Terra has been besieged multiple times throughout its history, most notably during the Horus Heresy.""");

var macragge = PlanetaryInfo("Macragge", "Millions", imperium,
    """Macragge is the capital world of the Ultramarines Chapter and the center of the Ultramar sector, known for its advanced civilization and disciplined society. It has a rich history of producing exceptional Space Marines and has been the site of numerous battles against various threats to the Imperium.""");

var tauWorld = PlanetaryInfo("T'au", "Billions", tau,
    """T'au is the homeworld of the Tau species and the capital of the T'au Empire. It was initially a primitive world until the Tau discovered advanced technology left behind by a long-extinct race known as the Etherals. T'au quickly developed into a technologically advanced society and began expanding its influence across the galaxy through the Greater Good ideology, seeking to unite other species under its rule through diplomacy or force.""");

var imperium = Faktions(
    "Imperium of Man",
    "The Imperium's primary goal is the preservation of humanity and the continuation of the Emperor's vision of a galaxy united under his rule. They seek to maintain control over the countless worlds of the Imperium, defend against external threats such as alien races and Chaos, and stamp out heresy and rebellion within their own ranks.",
    "In the grim darkness of the far future, there is only war.");

var tau = Faktions(
    "T'au Empire",
    "The T'au Empire seeks to bring about a Greater Good, a philosophy advocating for the betterment of all sentient beings through cooperation, technological advancement, and unity. They aim to expand their empire peacefully by integrating other species into their society, offering them the benefits of T'au technology and culture.",
    "For the Greater Good!");

List<PlanetaryInfo> featuredWorlds = [krieg, terra, macragge, tauWorld];
