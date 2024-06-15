// ignore_for_file: unused_import

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

  Marker newMarker = Marker(
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
                            print('Hello you.....');
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

Marker createActiveActivity(LatLng position, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 109, 162, 30));
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
          icon: Icon(Icons.local_activity, color: color),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Dropdown menu
                        DropdownButton<String>(
                          value: usedMobility,
                          items: <String>['Bicycle', 'E-Bike', 'Walking', 'Car']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                usedMobility =
                                    value; // Update the selected value
                                mobilityForAPI = translateMobilityToApiReadable(
                                    usedMobility);
                              }
                            });
                          },
                        ),
                        // Text field
                        SizedBox(height: 10),
                        ValueListenableBuilder<bool>(
                          valueListenable: isLoadingNotifier,
                          builder: (context, isLoading, child) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ValueListenableBuilder<Color>(
                                  valueListenable: starColorNotifier,
                                  builder: (context, starColor, child) {
                                    return IconButton(
                                      icon: Icon(
                                        Icons.route_rounded,
                                        color: starColor,
                                      ),
                                      onPressed: () async {
                                        isLoadingNotifier.value = true;
                                        print('Starting the research');
                                        final LatLng currentUserLocation =
                                            await getCurrentLocation();
                                        List<LatLng> route;

                                        route = await calculateRoute(
                                          mobilityForAPI,
                                          convertLatLngToCoordinates(
                                              currentUserLocation),
                                          convertLatLngToCoordinates(
                                              locationPosition),
                                        );

                                        // Update the shared state with the new route
                                        ref.read(sharedStateProvider).way =
                                            route;

                                        isLoadingNotifier.value = false;
                                      },
                                    );
                                  },
                                ),
                                if (isLoading) CircularProgressIndicator(),
                              ],
                            );
                          },
                        ),
                      ],
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

Marker createCulturalActivity(LatLng position, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 19, 146, 181));
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Dropdown menu
                        DropdownButton<String>(
                          value: usedMobility,
                          items: <String>['Bicycle', 'E-Bike', 'Walking', 'Car']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                usedMobility =
                                    value; // Update the selected value
                                mobilityForAPI = translateMobilityToApiReadable(
                                    usedMobility);
                              }
                            });
                          },
                        ),
                        // Text field
                        SizedBox(height: 10),
                        ValueListenableBuilder<bool>(
                          valueListenable: isLoadingNotifier,
                          builder: (context, isLoading, child) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ValueListenableBuilder<Color>(
                                  valueListenable: starColorNotifier,
                                  builder: (context, starColor, child) {
                                    return IconButton(
                                      icon: Icon(
                                        Icons.route_rounded,
                                        color: starColor,
                                      ),
                                      onPressed: () async {
                                        isLoadingNotifier.value = true;
                                        print('Starting the research');
                                        final LatLng currentUserLocation =
                                            await getCurrentLocation();
                                        List<LatLng> route;

                                        route = await calculateRoute(
                                          mobilityForAPI,
                                          convertLatLngToCoordinates(
                                              currentUserLocation),
                                          convertLatLngToCoordinates(
                                              locationPosition),
                                        );

                                        // Update the shared state with the new route
                                        ref.read(sharedStateProvider).way =
                                            route;

                                        isLoadingNotifier.value = false;
                                      },
                                    );
                                  },
                                ),
                                if (isLoading) CircularProgressIndicator(),
                              ],
                            );
                          },
                        ),
                      ],
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

Marker createNatureActivity(LatLng position, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 4, 88, 9));
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Dropdown menu
                        DropdownButton<String>(
                          value: usedMobility,
                          items: <String>['Bicycle', 'E-Bike', 'Walking', 'Car']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                usedMobility =
                                    value; // Update the selected value
                                mobilityForAPI = translateMobilityToApiReadable(
                                    usedMobility);
                              }
                            });
                          },
                        ),
                        // Text field
                        SizedBox(height: 10),
                        ValueListenableBuilder<bool>(
                          valueListenable: isLoadingNotifier,
                          builder: (context, isLoading, child) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ValueListenableBuilder<Color>(
                                  valueListenable: starColorNotifier,
                                  builder: (context, starColor, child) {
                                    return IconButton(
                                      icon: Icon(
                                        Icons.route_rounded,
                                        color: starColor,
                                      ),
                                      onPressed: () async {
                                        isLoadingNotifier.value = true;
                                        print('Starting the research');
                                        final LatLng currentUserLocation =
                                            await getCurrentLocation();
                                        List<LatLng> route;

                                        route = await calculateRoute(
                                          mobilityForAPI,
                                          convertLatLngToCoordinates(
                                              currentUserLocation),
                                          convertLatLngToCoordinates(
                                              locationPosition),
                                        );

                                        // Update the shared state with the new route
                                        ref.read(sharedStateProvider).way =
                                            route;

                                        isLoadingNotifier.value = false;
                                      },
                                    );
                                  },
                                ),
                                if (isLoading) CircularProgressIndicator(),
                              ],
                            );
                          },
                        ),
                      ],
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

Marker createSportsActivity(LatLng position, WidgetRef ref) {
  final LatLng locationPosition = position;
  String usedMobility = 'Car';
  String mobilityForAPI = 'cycling-regular';
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Color.fromARGB(255, 117, 14, 14));
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Dropdown menu
                        DropdownButton<String>(
                          value: usedMobility,
                          items: <String>['Bicycle', 'E-Bike', 'Walking', 'Car']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                usedMobility =
                                    value; // Update the selected value
                                mobilityForAPI = translateMobilityToApiReadable(
                                    usedMobility);
                              }
                            });
                          },
                        ),
                        // Text field
                        SizedBox(height: 10),
                        ValueListenableBuilder<bool>(
                          valueListenable: isLoadingNotifier,
                          builder: (context, isLoading, child) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ValueListenableBuilder<Color>(
                                  valueListenable: starColorNotifier,
                                  builder: (context, starColor, child) {
                                    return IconButton(
                                      icon: Icon(
                                        Icons.route_rounded,
                                        color: starColor,
                                      ),
                                      onPressed: () async {
                                        isLoadingNotifier.value = true;
                                        print('Starting the research');
                                        final LatLng currentUserLocation =
                                            await getCurrentLocation();
                                        List<LatLng> route;

                                        route = await calculateRoute(
                                          mobilityForAPI,
                                          convertLatLngToCoordinates(
                                              currentUserLocation),
                                          convertLatLngToCoordinates(
                                              locationPosition),
                                        );

                                        // Update the shared state with the new route
                                        ref.read(sharedStateProvider).way =
                                            route;

                                        isLoadingNotifier.value = false;
                                      },
                                    );
                                  },
                                ),
                                if (isLoading) CircularProgressIndicator(),
                              ],
                            );
                          },
                        ),
                      ],
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
