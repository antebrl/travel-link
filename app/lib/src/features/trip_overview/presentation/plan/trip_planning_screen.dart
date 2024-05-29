import 'package:flutter/material.dart';
import 'package:travel_link/src/features/checklists/presentation/checklists_screen.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/map/presentation/trip_map_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/destination_activities_screen.dart';

class TripPlanningScreen extends StatelessWidget {
  const TripPlanningScreen({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Placeholder for picture
        Stack(
          children: [
            Container(
              height: 200,
              color: Colors.grey,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.destination.formatted,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      trip.startDate.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Headings
        const SizedBox(height: 20),
        const Text(
          'Costs',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: const Text(
            'Map',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<TripMapScreen>(
                builder: (context) => const TripMapScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        GestureDetector(
          child: const Text(
            'Checklists',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<ChecklistsScreen>(
                builder: (context) => const ChecklistsScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        const Text(
          'Costs',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          child: const Text(
            'Activities',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<ChecklistsScreen>(
                builder: (context) => DestinationActivitiesScreen(placeId: trip.destination.placeId),
              ),
            );
          },
        ),
      ],
    );
  }
}
