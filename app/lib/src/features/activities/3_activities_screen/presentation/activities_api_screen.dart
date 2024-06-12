import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
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
  ConsumerState<APIActivitiesScreen> createState() =>
      _APIActivitiesScreenState();
}

class _APIActivitiesScreenState extends ConsumerState<APIActivitiesScreen> {
  List<Activity> addedActivities = [];

  bool isActivityNearDestination(
    Activity activity,
    double destLat,
    double destLon,
  ) {
    const double thresholdDistance = 100; // Threshold distance in Kilometers
    final double activityLat = activity.location.lat;
    final double activityLon = activity.location.lon;

    final double distance =
        calculateDistance(activityLat, activityLon, destLat, destLon);

    return distance <= thresholdDistance;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double radiusEarth = 6371;
    final double dLat = degreesToRadians(lat2 - lat1);
    final double dLon = degreesToRadians(lon2 - lon1);
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(lat1)) *
            cos(degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radiusEarth * c;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  Future<void> addActivity() async {
    final newActivity = await Navigator.of(context).push<Activity>(
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

    final fetchedUserActivities = ref.watch(fetchActivitiesProvider);

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
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                          spacing: 10,
                          runSpacing: 5,
                          children: widget.categoryList.map((category) {
                            return Chip(
                              side: const BorderSide(
                                color: CustomColors.primary,
                              ),
                              backgroundColor: CustomColors.white,
                              labelStyle: const TextStyle(
                                color: CustomColors.primary,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              label: Text(
                                category,
                                style: const TextStyle(
                                  color: CustomColors.primary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                fetchedUserActivities.when(
                  data: (userActivities) {
                    final List<Activity> nearbyActivities = userActivities
                        .where(
                          (activity) =>
                              isActivityNearDestination(
                                activity,
                                widget.destination.lat!,
                                widget.destination.lon!,
                              ) &&
                              activity.isUserCreated &&
                              (activity.isPublic ||
                                      activity.creatorId == 'ME'),
                        )
                        .toList();
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => APIActivityItem(
                          key: UniqueKey(),
                          activity: nearbyActivities[index],
                        ),
                        childCount: nearbyActivities.length,
                      ),
                    );
                  },
                  loading: () => const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stackTrace) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child:
                            Text('Error loading images. Please try again later.'),
                      ),
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Explore more: ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: CustomColors.primary,
                              ),
                    ),
                  ),
                ),
                FutureBuilder<List<Activity>>(
                  future: fetchedActivities,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.primary,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'Error loading activies. Please try again later.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      );
                    } else {
                      final activities = snapshot.data!
                        ..sort((a, b) {
                          if (a.wikidataUrl != null && b.wikidataUrl == null) {
                            return -1;
                          } else if (a.wikidataUrl == null &&
                              b.wikidataUrl != null) {
                            return 1;
                          } else {
                            return 0;
                          }
                        });
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => APIActivityItem(
                            key: UniqueKey(),
                            activity: activities[index],
                          ),
                          childCount: activities.length,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            MapScreenWithActivities(fetchedActivities: fetchedActivities),
          ],
        ),
      ),
    );
  }
}
