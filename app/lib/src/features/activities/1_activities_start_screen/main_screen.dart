import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/curved_edges.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/activities_continents_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesMainScreen extends StatelessWidget {
  const ActivitiesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: CustomCurvedEdges(),
            child: Container(
              color: CustomColors.primary,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    // Weiße Kreise
                    Positioned(
                      top: -150,
                      right: -120,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: -170,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: CustomColors.primary,
                child: Text('Most popular activities'),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      //APIActivitiesScreen(),
                      const ActivitiesContinentsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Explore some Activities in ... :',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
          ),
          const SizedBox(height: 10),

          //

          const SizedBox(height: 10),
          Text(
            'Explore the most popular Activities: ',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
          )
        ],
      ),
    );
  }
}
