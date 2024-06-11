import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/create_trip_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/current_trip_tile.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trip_tile.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  (List<List<Trip>>, List<int?>) sortTripsByDate(List<Trip> trips) {
    final List<List<Trip>> tripsByDate = [
      [],
      [],
      [],
    ];
    final List<int?> daysToGo = [];

    for (final trip in trips) {
      if (trip.startDate == null || trip.endDate == null) {
        //flexible trips will be shown at the end of the upcoming trips section
        tripsByDate[1].add(trip);
        daysToGo.add(null);
        continue;
      }

      if (trip.endDate!.isBefore(DateTime.now())) {
        tripsByDate[2].add(trip); // Previous trips
      } else if (trip.startDate!.isAfter(DateTime.now())) {
        tripsByDate[1].add(trip); // Upcoming trips
        daysToGo.add(
          trip.startDate!.difference(DateTime.now()).inDays,
        ); // DaysToGo for upcoming trips
      } else {
        tripsByDate[0].add(trip); // Current trips
      }
    }

    //sort upcoming trips
    final indices = List<int>.generate(daysToGo.length, (index) => index)
      ..sort((a, b) {
        final valueA = daysToGo[a];
        final valueB = daysToGo[b];
        if (valueA == null && valueB == null) return 0;
        if (valueA == null)
          return 1; //flexible dates will be sorted at the end of the list
        if (valueB == null) return -1;
        return valueA.compareTo(valueB);
      });

    tripsByDate[1] = [for (final i in indices) tripsByDate[1][i]];

    //sort previsous trips
    tripsByDate[2].sort((a, b) => a.endDate!.compareTo(b.endDate!));

    return (tripsByDate, [for (final i in indices) daysToGo[i]]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final cardWidth = screenWidth / 1.12;

    final screenOrientationPortrait =
        mediaQuery.orientation == Orientation.portrait;

    final fetchedTrips = ref.watch(fetchMyTripsProvider);

    return fetchedTrips.when(
      data: (trips) {
        final (sortedTrips, daysToGo) = sortTripsByDate(trips);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: CustomColors.primaryBackground,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/images/my-trips/travel.gif',
                              fit: BoxFit.cover,
                              height: 50,
                            ),
                          ),
                          const Align(
                            child: Text(
                              'My Trips',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Current trips
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: sortedTrips[0].length,
                      itemBuilder: (context, index) {
                        final trip = sortedTrips[0][index];
                        return CurrentTripTile(
                          trip: trip,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 16),
                      child: Text(
                        'Upcoming trips',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          color: CustomColors.primary.withOpacity(0.8),
                        ),
                      ),
                    ),
                    if (sortedTrips[1].isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'No upcoming trips yet.',
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        ),
                      )
                    else
                    // Upcoming trips
                    if (screenOrientationPortrait)
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: sortedTrips[1].length,
                        itemBuilder: (context, index) {
                          final trip = sortedTrips[1][index];
                          return MyTripTile(
                            trip: trip,
                            cardWidth: cardWidth,
                            daysToGo: daysToGo[index],
                          );
                        },
                      )
                    else
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (cardWidth / 2) / 216,
                        ),
                        itemCount: sortedTrips[1].length,
                        itemBuilder: (context, index) {
                          final trip = sortedTrips[1][index];
                          return MyTripTile(
                            trip: trip,
                            cardWidth: cardWidth / 2,
                            daysToGo: daysToGo[index],
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 16),
                      child: Text(
                        'Previous trips',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          color: CustomColors.primary.withOpacity(0.8),
                        ),
                      ),
                    ),
                    if (sortedTrips[2].isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'No previous trips found',
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        ),
                      )
                    else
                      // Previous trips
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: sortedTrips[2].length,
                        itemBuilder: (context, index) {
                          final trip = sortedTrips[2][index];
                          return MyTripTile(
                            cardWidth: cardWidth,
                            trip: trip,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (context) => const CreateTripScreen(),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading trips', error: error, stackTrace: stackTrace);
        return const Scaffold(
          body: Center(
            child: Text('Error loading trips. Please try again later.'),
          ),
        );
      },
    );
  }
}
