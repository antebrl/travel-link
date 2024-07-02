// ignore_for_file: unused_import, lines_longer_than_80_chars, require_trailing_commas

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'converter.dart';
import 'exchanged_way.dart';
import 'path_finding.dart';

Marker createUserMarker(LatLng position) {
  final Completer<Marker> markerCompleter = Completer<Marker>();
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Colors.purple);
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);

  final Marker newMarker = Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.person, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ValueListenableBuilder<Color>(
                      valueListenable: starColorNotifier,
                      builder: (context, starColor, child) {
                        return IconButton(
                          icon: Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          onPressed: () {
                            /*
                            Nutzerfunktionalitaet hinzufuegen
                            */
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );

  markerCompleter.complete(newMarker);
  return newMarker;
}

Marker createEntertainmentActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 109, 162, 30));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.theater_comedy, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createEducationActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 19, 146, 181));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.museum_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createNatureActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 4, 88, 9));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.forest_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createSportsActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 117, 14, 14));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.sports_tennis, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createCateringActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 204, 193, 41));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.food_bank_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createReligousActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 255, 255, 255));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.church_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createActivActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 252, 255, 58));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.attractions_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createAccomodationActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 241, 92, 12));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.hotel_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createTourismeActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 255, 213, 0));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.map, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createCampingActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 255, 47, 0));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.fireplace_outlined, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

Marker createLeisureActivity(
    LatLng position, String name, String description, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 94, 85, 83));
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.rocket_launch_rounded, color: color),
          onPressed: () {
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(name), // Set the title to the name
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

String translateMobilityToApiReadable(String selectedMobility) {
  switch (selectedMobility) {
    case ('Bicycle'):
      return 'cycling-regular';
    case ('E- Bike'):
      return 'cycling-electric';
    case ('Walking'):
      return 'foot-walking';
    case ('Car'):
      return 'driving-car';
    default:
      return 'foot-walking';
  }
}
