import 'package:flutter/material.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class PublicTripCard extends StatelessWidget {
  const PublicTripCard({super.key, required this.onTap, required this.trip});

  final VoidCallback onTap;
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25, bottom:25,),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 390,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 320,
                  width: 275,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade800.withOpacity(0.6),
                      spreadRadius: 0.1,
                      blurRadius: 23,
                      offset: const Offset(1, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1998131648/de/foto/altstadt-von-burghausen-mit-burgberg.jpg?s=1024x1024&w=is&k=20&c=nvlz0e9DkNmf4_84ahASlYZVnGN-7NTKm9L3zppAOZI='),
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
                
              ),
              Text(
                trip.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                trip.name,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(double.maxFinite, 44),
                ),
                child: const Text(
                  'ADD TO CART',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
