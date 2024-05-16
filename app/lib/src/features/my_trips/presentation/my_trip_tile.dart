import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class MyTripTile extends StatelessWidget {
  const MyTripTile({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Container(
        decoration: boxDecoration,
        child: ListTile(
          leading: Image.network('https://via.placeholder.com/150'),
          title: Text(
            trip.name,
            style: TextStyle(
                color: Colors.lightBlue[200], fontWeight: FontWeight.bold,),
          ),
          subtitle: Text(trip.destination),
          tileColor: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () => context.pushNamed(
            TripRoutes.tripDetails.name,
            pathParameters: {
              'tripId': trip.tripId,
            },
          ),
        ),
      ),
    );
  }
}
