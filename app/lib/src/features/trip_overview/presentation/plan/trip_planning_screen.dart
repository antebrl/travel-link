import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/features/checklists/presentation/checklists_screen.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/map/presentation/trip_map_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class TripPlanningScreen extends StatelessWidget {
  const TripPlanningScreen({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // pictures of trip/destination
        Stack(
          children: [
            Image.network(
              //Wikipedia entry but no picture
              trip.images[0],
              height: 145,
              width: double.infinity,
              fit: BoxFit.cover,
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
                      trip.startDate != null ? CustomFormatter.formatDateRange(startDate: trip.startDate!, endDate: trip.endDate!) : 'flexible Dates',
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColors.primary,
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
        RichText(
                      //Trip description
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                        children: [
                          const TextSpan(
                            text: '„',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: trip.description,
                          ),
                          const TextSpan(
                            text: '”',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
        const SizedBox(height: 10),
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
                builder: (context) => APIActivitiesScreen(
                  destination: trip.destination,
                  categoryList: {'entertainment'},
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
