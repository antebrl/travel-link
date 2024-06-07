import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/create_trip_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trip_tile.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  (List<List<Trip>>, List<int>) sortTripsByDate(List<Trip> trips) {
    final List<List<Trip>> tripsByDate = [
      [],
      [],
      [],
    ];
    final List<int> daysToGo = [];

    for (final trip in trips) {
      if (trip.startDate == null || trip.endDate == null) {
        continue;
      }

      if (trip.endDate!.isBefore(DateTime.now())) {
        tripsByDate[2].add(trip); // Previous trips
      } else if (trip.startDate!.isAfter(DateTime.now())) {
        tripsByDate[1].add(trip); // Upcoming trips
        daysToGo.add(trip.startDate!
            .difference(DateTime.now())
            .inDays); // DaysToGo for upcoming trips
      } else {
        tripsByDate[0].add(trip); // Current trips
      }
    }

    return (tripsByDate, daysToGo);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedTrips = ref.watch(fetchMyTripsProvider);

    return fetchedTrips.when(
        data: (trips) {
          final (sortedTrips, daysToGo) = sortTripsByDate(trips);

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Trips'),
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                //List of current trips
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: sortedTrips[1].length,
                  itemBuilder: (context, index) {
                    final trip = sortedTrips[1][index];
                    return MyTripTile(
                      trip: trip,
                    );
                  },
                ),
                //List of upcoming trips
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: sortedTrips[1].length,
                  itemBuilder: (context, index) {
                    final trip = sortedTrips[1][index];
                    return MyTripTile(
                      trip: trip,
                      daysToGo: daysToGo[index],
                    );
                  },
                ),
                //List of previous trips
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: sortedTrips[2].length,
                  itemBuilder: (context, index) {
                    final trip = sortedTrips[2][index];
                    return MyTripTile(
                      trip: trip,
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  //specifies type of information the bottom sheet will return
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const CreateTripScreen(),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
        loading: () => Scaffold(
              appBar: AppBar(
                title: const Text('My Trips'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, stackTrace) {
          logger.e('Error loading trips', error: error, stackTrace: stackTrace);
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Trips'),
            ),
            body: const Center(
              child: Text('Error loading trips. Please try again later.'),
            ),
          );
        });

    //   return fetchedTrips.when(
    //     data: (trips) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: const Text('My Trips'),
    //         ),
    //         body: ListView.builder(
    //           itemCount: trips.length,
    //           itemBuilder: (context, index) {
    //             final trip = trips[index];
    //             return MyTripTile(
    //               trip: trip,
    //             );
    //           },
    //         ),
    //         floatingActionButton: FloatingActionButton(
    //           onPressed: () {
    //             showModalBottomSheet<void>( //specifies type of information the bottom sheet will return
    //               context: context,
    //               isScrollControlled: true,
    //               builder: (context) => const CreateTripScreen(),
    //             );
    //           },
    //           child: const Icon(Icons.add),
    //         ),
    //       );
    //     },
    //     loading: () => Scaffold(
    //       appBar: AppBar(
    //         title: const Text('My Trips'),
    //       ),
    //       body: const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     ),
    //     error: (error, stackTrace) {
    //       logger.e('Error loading trips', error: error, stackTrace: stackTrace);
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: const Text('My Trips'),
    //         ),
    //         body: const Center(
    //           child: Text('Error loading trips. Please try again later.'),
    //         ),
    //       );
    //     }
    //   );
    // }
  }
}
