import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/create_trip_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trip_tile.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedTrips = ref.watch(fetchMyTripsProvider);
    
    return fetchedTrips.when(
      data: (trips) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Trips'),
          ),
          body: ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return MyTripTile(
                trip: trip,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>( //specifies type of information the bottom sheet will return
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
      }
    );
  }
}
