import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/api_activity_item.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class APIActivitiesScreen extends ConsumerWidget {
  const APIActivitiesScreen(
      {super.key, required this.destination, required this.categoryList});
  final Destination destination;
  final Set<String> categoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedTrips = ref.watch(
      FetchActivitiesFromAPIProvider(
        lon: destination.lon!,
        lat: destination.lat!,
        categories: categoryList,
      ),
    );

    return fetchedTrips.when(
      data: (trips) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Activities'),
          ),
          body: Expanded(
            child: ListView.builder(
              itemCount: trips.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => APIActivityItem(
                key: UniqueKey(),
                activity: trips[index],
              ),
            ),
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Explore Activities'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading trips', error: error, stackTrace: stackTrace);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Activities'),
          ),
          body: const Center(
            child: Text('Error loading trips. Please try again later.'),
          ),
        );
      },
    );
  }
}
