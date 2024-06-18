import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/small_activity_item.dart';

class HorizontalActivityList extends StatelessWidget {
  const HorizontalActivityList({
    required this.selectedActivities,
    super.key,
  });
  final List<Activity> selectedActivities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 5, right: 30),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectedActivities.length,
          itemBuilder: (context, index) {
            final activity = selectedActivities[index];
            return SmallActivityItem(
              activity: activity,
              key: UniqueKey(),
            );
          },
        ),
      ),
    );
  }
}
