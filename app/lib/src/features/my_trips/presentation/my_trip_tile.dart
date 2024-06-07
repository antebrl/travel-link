import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';

class MyTripTile extends StatelessWidget {
  const MyTripTile({
    required this.trip,
    this.daysToGo,
    super.key,
  });

  final Trip trip;
  final int? daysToGo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 10, 35, 10),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          TripRoutes.tripDetails.name,
          pathParameters: {
            'tripId': trip.tripId,
          },
        ),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(135, 16, 16, 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      trip.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          trip.destination.formatted,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://example.com/photo1.jpg',
                          ), // Beispielbild URL
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://example.com/photo2.jpg',
                          ), // Beispielbild URL
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://example.com/photo3.jpg',
                          ), // Beispielbild URL
                        ),
                        const SizedBox(width: 5),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[200],
                          child: const Text('1'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC3DEED),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            trip.startDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(trip.startDate!)
                                : 'Flexible Dates',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        if (trip.endDate != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC3DEED),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              DateFormat('dd/MM/yyyy').format(trip.endDate!),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (trip.images.isNotEmpty)
                Positioned(
                  left: -25,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade600.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(1, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        trip.images[0],
                        height: 170,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Positioned(
                right: 9,
                top: 9,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800]!.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'In ${daysToGo ?? ''} Days',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
