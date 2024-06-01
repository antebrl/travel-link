import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/api_activity_item.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class APIActivitiesScreen extends ConsumerWidget {
  const APIActivitiesScreen(
      {required this.destination, required this.categoryList, super.key});
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
        print(trips.length);
        //Sort activities: With wiki_and_media entry at the top
        trips.sort((a, b) {
          if (a.wikipediaUrl != null && b.wikipediaUrl == null) {
            return -1; // a should come before b
          } else if (a.wikipediaUrl == null && b.wikipediaUrl != null) {
            return 1; // b should come before a
          } else {
            return 0; // a and b are equal in terms of sorting
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Explore Activities!',
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                'Activies in ${destination.formatted}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: CustomColors.primary),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  spacing: 10.0, // Abstand zwischen den Chips
                  runSpacing: 5.0, // Abstand zwischen den Zeilen
                  children: categoryList.map((category) {
                    return Chip(
                      side: const BorderSide(color: CustomColors.primary),
                      backgroundColor: CustomColors.white,
                      labelStyle: const TextStyle(color: CustomColors.primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      label: Text(
                        category,
                        style: const TextStyle(color: CustomColors.primary),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (context, index) => APIActivityItem(
                    key: UniqueKey(),
                    activity: trips[index],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Loading Activities!'),
        ),
        body: const Center(
          child: CircularProgressIndicator(
            color: CustomColors.primary,
          ),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading trips', error: error, stackTrace: stackTrace);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Loading Activities!'),
          ),
          body: Center(
            child: Text(
              'Error loading activies. Please try again later.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
