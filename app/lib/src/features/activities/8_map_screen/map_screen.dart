import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';

class MapScreenWithActivities extends StatefulWidget {
  const MapScreenWithActivities({required this.fetchedActivities, super.key});

  final AsyncValue<List<ApiActivity>> fetchedActivities;

  @override
  State<MapScreenWithActivities> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MapScreenWithActivities> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
