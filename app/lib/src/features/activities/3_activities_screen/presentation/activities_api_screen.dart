import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/activity_item.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/api_activity_item.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/add_activity_screen.dart';
import 'package:travel_link/src/features/activities/8_map_screen/map_screen.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/helper_functions.dart';

class APIActivitiesScreen extends ConsumerStatefulWidget {
  const APIActivitiesScreen({
    required this.destination,
    required this.categoryList,
    super.key,
  });

  final Destination destination;
  final Set<String> categoryList;

  @override
  _APIActivitiesScreenState createState() => _APIActivitiesScreenState();
}

class _APIActivitiesScreenState extends ConsumerState<APIActivitiesScreen> {
  List<ApiActivity> addedActivities = [];

  bool isActivityNearDestination(
      ApiActivity activity, double destLat, double destLon) {
    const double thresholdDistance = 40; // Threshold distance in Kilometers
    final double activityLat = activity.location.lat;
    final double activityLon = activity.location.lon;

    final double distance =
        calculateDistance(activityLat, activityLon, destLat, destLon);

    return distance <= thresholdDistance;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radiusEarth = 6371.0;
    double dLat = degreesToRadians(lat2 - lat1);
    double dLon = degreesToRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radiusEarth * c;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  Future<void> addActivity() async {
    final newActivity = await Navigator.of(context).push<ApiActivity>(
      MaterialPageRoute(
        builder: (ctx) => const AddActivityScreen(),
      ),
    );
    if (newActivity == null) return;

    setState(() {
      addedActivities.add(newActivity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fetchedActivities = ref.watch(
      FetchActivitiesFromAPIProvider(
        lon: widget.destination.lon!,
        lat: widget.destination.lat!,
        categories: widget.categoryList,
      ).future,
    );

    return FutureBuilder<List<ApiActivity>>(
      future: fetchedActivities,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading Activities!'),
            ),
            body: const Center(
              child: CircularProgressIndicator(
                color: CustomColors.primary,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
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
        } else {
          final trips = snapshot.data!;

          final List<ApiActivity> nearbyActivities = addedActivities
              .where(
                (activity) =>
                    isActivityNearDestination(
                      activity,
                      widget.destination.lat!,
                      widget.destination.lon!,
                    ) &&
                    activity.isUserCreated &&
                    (activity.isPublic ||
                        (!activity.isPublic &&
                            activity.createdByThisUser == 'ME')),
              )
              .toList();

          trips.sort((a, b) {
            if (a.wikidataUrl != null && b.wikidataUrl == null) {
              return -1;
            } else if (a.wikidataUrl == null && b.wikidataUrl != null) {
              return 1;
            } else {
              return 0;
            }
          });
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Explore Activities!',
                ),
                actions: [
                  IconButton(
                    onPressed: addActivity,
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
                bottom: TabBar(
                  isScrollable: false,
                  indicatorColor: CustomColors.primary,
                  unselectedLabelColor: CustomColors.darkGrey,
                  labelColor: CustomHelperFunctions.isDarkMode(context)
                      ? CustomColors.white
                      : CustomColors.primary,
                  tabs: const [
                    Tab(
                      child: Text('Search'),
                    ),
                    Tab(
                      child: Text('Map'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Activities in ${widget.destination.formatted}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: CustomColors.primary),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Wrap(
                                alignment: WrapAlignment.spaceAround,
                                spacing: 10.0,
                                runSpacing: 5.0,
                                children: widget.categoryList.map((category) {
                                  return Chip(
                                    side: const BorderSide(
                                        color: CustomColors.primary),
                                    backgroundColor: CustomColors.white,
                                    labelStyle: const TextStyle(
                                        color: CustomColors.primary),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    label: Text(
                                      category,
                                      style: const TextStyle(
                                          color: CustomColors.primary),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            if (nearbyActivities.isNotEmpty)
                              Text(
                                'Added by Users: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: CustomColors.primary,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      if (nearbyActivities.isNotEmpty) ...{
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => ActivityItem(
                              key: UniqueKey(),
                              activity: nearbyActivities[index],
                            ),
                            childCount: nearbyActivities.length,
                          ),
                        ),
                      },
                      SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Explore more: ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: CustomColors.primary,
                                ),
                          ),
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
                  MapScreenWithActivities(fetchedActivities: fetchedActivities),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
