import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';

class MapScreenWithActivities extends StatefulWidget {
  const MapScreenWithActivities({required this.fetchedActivities, super.key});

  final Future<List<ApiActivity>> fetchedActivities;

  @override
  State<MapScreenWithActivities> createState() =>
      _MapScreenWithActivitiesState();
}

class _MapScreenWithActivitiesState extends State<MapScreenWithActivities> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApiActivity>>(
      future: widget.fetchedActivities,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No activities found'));
        } else {
          // Assuming you want to display the name of the first activity
          final activity = snapshot.data![0];
          return Center(child: Text(activity.name));
        }
      },
    );
  }
}
