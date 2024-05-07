import 'package:flutter/material.dart';
import 'dart:io';

// ignore: camel_case_types
class Button_Page extends StatelessWidget {
  const Button_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'A disertation of the Archetekture used in the Grim Darkness of the Far Future'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Greetings Citizen'),
              const SizedBox(height: 20), // Adding some space between elements
              ElevatedButton(
                // Changed RaisedButton to ElevatedButton
                onPressed: () {
                  // Add your button press logic here
                },
                child: const Text('Click Me'),
              ),
              const SizedBox(height: 20), // Adding some space between elements
              Image.asset(
                'images/holy_terra.jpg',
                width: 100,
                height: 100,
              ),
              // You can add more widgets here as needed
            ],
          ),
        ),
      ),
    );
  }
}

class Main_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F549931804496097060%2F&psig=AOvVaw1DSqjL-gmgN8DH3EUQ73S7&ust=1715177911876000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNDai-Pd-4UDFQAAAAAdAAAAABAU',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Dissertation of our use of Architecture in the Grim Darkness of the Far Future',
              ),
            ),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dissertationArchetekture,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String dissertationArchetekture =
    """        '''The architecture of Holy Terra, the cradle of humanity in the grim darkness of the Warhammer 40,000 universe, is a reflection of its monumental history, spiritual significance, and the oppressive weight of millennia of imperial rule. Terra, also known as Earth, serves as the heart of the Imperium of Man, the seat of the God-Emperor's power, and the focal point of humanity's struggles against the myriad threats that besiege it from within and without.

The architecture of Holy Terra is a fusion of ancient, Gothic, and futuristic elements, representing the layers of history and the convergence of cultures that have shaped the planet over tens of thousands of years. Towering spires, gothic arches, and massive cathedrals dominate the skyline, their intricate designs and imposing structures testaments to the grandeur and power of the Imperium.

At the heart of Terra lies the Imperial Palace, a colossal fortress-city that spans continents and houses the Golden Throne, the life-support system of the Emperor himself. The Palace is a labyrinth of corridors, chambers, and halls, its walls adorned with banners, icons, and relics of humanity's glorious past. It is a symbol of both strength and vulnerability, a fortress that has withstood countless assaults yet remains under constant threat from enemies within and without.

Surrounding the Imperial Palace are the sprawling hive cities, vast urban sprawls that house billions of souls in towering skyscrapers and labyrinthine streets. These hive cities are teeming with life and activity, yet beneath their glittering facades lie poverty, corruption, and despair. The architecture of the hives is utilitarian and oppressive, reflecting the harsh realities of life under the rule of the Imperium.

Beyond the hive cities lie the wastelands of Terra, desolate plains and ruined cities that bear the scars of countless wars and cataclysms. Here, the architecture is ancient and crumbling, the remnants of civilizations long gone but not forgotten. Ruined cathedrals, crumbling fortresses, and shattered monuments serve as reminders of humanity's hubris and folly, testaments to the Imperium's eternal struggle against the forces of chaos and entropy.

In the skies above Terra, massive voidships ply the heavens, their sleek hulls and imposing silhouettes a stark contrast to the crumbling edifices below. These vessels are the lifeblood of the Imperium, ferrying troops, supplies, and pilgrims to every corner of the galaxy in the eternal crusade to reclaim humanity's lost glory.

The architecture of Holy Terra is a reflection of humanity's triumphs and tribulations, its grandeur and its decay. It is a testament to the enduring spirit of mankind, the relentless pursuit of power and glory, and the ever-present specter of damnation and oblivion. In the grim darkness of the far future, there is only war, and the architecture of Holy Terra stands as a silent witness to the eternal struggle of humanity against the encroaching darkness.Certainly! Let's delve deeper into the architecture of Holy Terra, exploring its various elements, historical significance, and the cultural tapestry that has shaped it over millennia.

**The Imperial Palace:**

The Imperial Palace stands as the most iconic and awe-inspiring architectural marvel on Holy Terra. Spanning entire continents and stretching upwards into the heavens, its towering spires and formidable walls dominate the landscape, serving as a symbol of the Imperium's power and the God-Emperor's divine mandate. 

The architecture of the Imperial Palace is a blend of Gothic grandeur and futuristic technology. Massive cathedrals adorned with intricate carvings and stained glass windows stand alongside towering fortifications bristling with weaponry and defensive emplacements. Each spire and buttress is a testament to the skill and dedication of the countless artisans and laborers who toiled for generations to construct this monumental edifice.

Within the labyrinthine halls of the Imperial Palace lie chambers of unimaginable splendor and sanctity. Golden thrones, towering statues, and priceless works of art adorn its halls, while hidden catacombs and secret chambers hold untold treasures and forbidden knowledge. It is said that the very air within the Palace is imbued with the power of the Emperor himself, a palpable presence that inspires awe and reverence in all who enter.

**Hive Cities:**

Surrounding the Imperial Palace are the sprawling hive cities, vast urban metropolises that house billions of souls in a tangled web of towering skyscrapers and labyrinthine streets. The architecture of the hives is a testament to the ingenuity and resourcefulness of humanity, as well as the oppressive weight of overpopulation and industrialization.

Each hive city is a self-contained world unto itself, with its own customs, cultures, and hierarchies. At the highest levels, the spires of the hive are home to the ruling elite, their palatial estates and opulent gardens a stark contrast to the squalor and poverty that festers below. Far beneath the surface, in the depths of the hive, lie the underhive slums, where the destitute and downtrodden eke out a meager existence amidst crime, corruption, and decay.

The architecture of the hive cities is a reflection of this stark divide, with the gleaming spires of the upper levels giving way to the dilapidated shantytowns and polluted wastelands of the underhive. Yet even amidst the squalor and deprivation, there is a beauty to be found in the resilience and tenacity of those who call the hives home, their makeshift dwellings and ramshackle structures a testament to the human spirit's indomitable will to survive.

**The Wastelands:**

Beyond the hive cities lie the desolate wastelands of Terra, vast expanses of ruined cities and blasted plains that bear the scars of countless wars and cataclysms. Here, the architecture is ancient and crumbling, the remnants of civilizations long gone but not forgotten.

Ruined cathedrals, crumbling fortresses, and shattered monuments dot the landscape, their weathered facades a testament to the passage of time and the relentless march of history. Yet amidst the ruins, there are echoes of a glorious past, reminders of humanity's once-mighty empire and its boundless potential.

In the wastelands, the architecture tells a story of hubris and folly, of empires risen and fallen, and of the eternal struggle between order and chaos. It is a haunting reminder of the Imperium's fragility and the ever-present threat of oblivion that hangs over humanity like a shadow.

**Conclusion:**

The architecture of Holy Terra is a rich tapestry woven from the threads of history, culture, and faith. From the towering spires of the Imperial Palace to the dilapidated ruins of the wastelands, each structure tells a story of triumph and tragedy, of glory and decay.

In the grim darkness of the far future, the architecture of Holy Terra stands as a testament to the enduring spirit of mankind, a silent witness to the eternal struggle against the encroaching darkness. It is a reminder of humanity's resilience, its capacity for greatness, and its inexorable march towards an uncertain destiny.''';
""";
