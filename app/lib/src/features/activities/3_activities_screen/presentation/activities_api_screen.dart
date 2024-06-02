import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/api_activity_item.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class APIActivitiesScreen extends ConsumerStatefulWidget {
  const APIActivitiesScreen({
    required this.destination,
    required this.categoryList,
    Key? key,
  }) : super(key: key);

  final Destination destination;
  final Set<String> categoryList;

  @override
  _APIActivitiesScreenState createState() => _APIActivitiesScreenState();
}

class _APIActivitiesScreenState extends ConsumerState<APIActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    final fetchedActivities = ref.watch(
      FetchActivitiesFromAPIProvider(
        lon: widget.destination.lon!,
        lat: widget.destination.lat!,
        categories: widget.categoryList,
      ),
    );

    return fetchedActivities.when(
      data: (trips) {
        print(trips.length);
        //Sort activities: With wiki_and_media entry at the top
        trips.sort((a, b) {
          if (a.wikidataUrl != null && b.wikidataUrl == null) {
            return -1; // a should come before b
          } else if (a.wikidataUrl == null && b.wikidataUrl != null) {
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
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Activities in ${widget.destination.formatted}',
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
                        children: widget.categoryList.map((category) {
                          return Chip(
                            side: const BorderSide(color: CustomColors.primary),
                            backgroundColor: CustomColors.white,
                            labelStyle:
                                const TextStyle(color: CustomColors.primary),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            label: Text(
                              category,
                              style:
                                  const TextStyle(color: CustomColors.primary),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: TextField(
                        onChanged: (string) {},
                        decoration: const InputDecoration(
                          labelText: 'Search activities...',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => APIActivityItem(
                    key: UniqueKey(),
                    activity: trips[index],
                  ),
                  childCount: trips.length,
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
