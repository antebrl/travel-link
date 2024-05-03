import 'package:travel_link/src/features/activities/2_continents_screen/data/continent_data.dart';

enum ContinentType {
  northAmerica,
  southAmerica,
  africa,
  europe,
  asia,
  australia,
}

class Continent {
  Continent({
    required this.name,
    required this.continentType,
    required this.imageAssetPath,
  });

  final String name;
  final ContinentType continentType;
  final String imageAssetPath;

  static Continent getContinentByName(String continentName) {
    return continentData.firstWhere(
      (continent) =>
          continent.name.replaceAll(' ', '').toLowerCase() ==
          continentName.toLowerCase(),
    );
  }
}
