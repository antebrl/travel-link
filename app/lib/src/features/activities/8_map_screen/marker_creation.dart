// ignore_for_file: unused_import, lines_longer_than_80_chars, require_trailing_commas

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';

import 'converter.dart';
import 'exchanged_way.dart';
import 'path_finding.dart';

Marker createEntertainmentActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 109, 162, 30));

  return Marker(
    point: position,
    width: 40,
    height: 40,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.theater_comedy, color: color),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(name),
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(description),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ApiActivitiesDetailsScreen(
                                                activity: associatedActivity),
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.search),
                                      SizedBox(width: 10),
                                      Text('Details'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}

Marker createEducationActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 19, 146, 181));

  return Marker(
    point: position,
    width: 40,
    height: 40,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.school_rounded, color: color),
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createNatureActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 4, 88, 9));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createSportsActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 117, 14, 14));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createCateringActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 204, 193, 41));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createReligousActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 255, 255, 255));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createActivActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 91, 101, 239));

  return Marker(
    point: position,
    width: 40,
    height: 40,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.location_on_rounded, color: color),
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createAccomodationActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 241, 92, 12));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createTourismeActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 82, 255, 76));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createCampingActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 255, 47, 0));

  return Marker(
    point: position,
    width: 40,
    height: 40,
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

Marker createLeisureActivity(
  LatLng position,
  String name,
  String description,
  WidgetRef ref,
  Activity associatedActivity,
) {
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(const Color.fromARGB(255, 94, 85, 83));

  return Marker(
    point: position,
    width: 40,
    height: 40,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.beach_access_rounded, color: color),
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
                      children: [
                        Text(description),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApiActivitiesDetailsScreen(
                                        activity: associatedActivity),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Details'),
                            ],
                          ),
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

String translateMobilityToApiReadable(
  String selectedMobility,
) {
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
