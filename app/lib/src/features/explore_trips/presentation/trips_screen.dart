import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/data/trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trip_tile.dart';
import 'package:travel_link/src/utils/logging/logger.dart';
import 'package:travel_link/src/utils/theme/widget_themes/appBar_theme.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedTrips = ref.watch(fetchPublicTripsProvider);
    
    return fetchedTrips.when(
      data: (trips) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Trips'),
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
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Explore Trips'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading trips', error: error, stackTrace: stackTrace);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Trips'),
          ),
          body: const Center(
            child: Text('Error loading trips. Please try again later.'),
          ),
        );
      },
    );
  }
}
