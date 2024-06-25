import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/trip_overview/data/trip_activities_repository.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/activities/activity_item.dart';

class TripActivitiesView extends ConsumerWidget {
  const TripActivitiesView({required this.tripId, super.key});

  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedActivities = ref.watch(fetchTripActivitiesProvider(tripId));

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 30),
      child: SizedBox(
        height: 200,
        child: fetchedActivities.when(
          data: (activities) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return TripActivityItem(
                  activity: activity,
                  tripId: tripId,
                  key: UniqueKey(),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
