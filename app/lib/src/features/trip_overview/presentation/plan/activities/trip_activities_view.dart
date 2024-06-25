import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/trip_overview/data/trip_activities_repository.dart';

class TripActivitiesView extends ConsumerWidget {
  const TripActivitiesView({required this.tripId, super.key});

  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedActivities = ref.watch(fetchTripActivitiesProvider(tripId));
    return const Placeholder();
  }
}
