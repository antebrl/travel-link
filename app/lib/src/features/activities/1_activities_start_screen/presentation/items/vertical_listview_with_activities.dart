import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/horizontal_activity_item.dart';

class VerticalActivityList extends StatelessWidget {
  const VerticalActivityList({
    required this.popularActivities,
    super.key,
  });
  final List<ApiActivity> popularActivities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 5, right: 30),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: popularActivities.length,
        itemBuilder: (context, index) {
          final activity = popularActivities[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: HorizontalActivityItem(
              activity: activity,
              key: UniqueKey(),
            ),
          );
        },
      ),
    );
  }
}
