import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class MapScreenWithActivities extends StatefulWidget {
  const MapScreenWithActivities({required this.fetchedApiActivities, required this.fetchedUserActivities, super.key});

  final Future<List<Activity>> fetchedApiActivities;
  final Future<List<Activity>> fetchedUserActivities;

  @override
  State<MapScreenWithActivities> createState() => _MapScreenWithActivitiesState();
}

class _MapScreenWithActivitiesState extends State<MapScreenWithActivities> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: combineFutureLists(widget.fetchedApiActivities, widget.fetchedUserActivities),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: CustomColors.primary,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No activities found'));
        } else {
          final activities = snapshot.data!;
          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ListTile(
                title: Text(activity.name),
                subtitle: Text(activity.description ?? 'No description available'),
              );
            },
          );
        }
      },
    );
  }

  Future<List<T>> combineFutureLists<T>(Future<List<T>> futureList1, Future<List<T>> futureList2) async {
    List<T> list1 = await futureList1;
    List<T> list2 = await futureList2;
    return [...list1, ...list2];
  }
}
