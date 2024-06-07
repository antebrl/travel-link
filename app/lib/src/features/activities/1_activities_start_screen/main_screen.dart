import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/curved_edges.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/activities_continents_screen.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesMainScreen extends StatefulWidget {
  const ActivitiesMainScreen({super.key});

  @override
  State<ActivitiesMainScreen> createState() => _ActivitiesMainScreenState();
}

class _ActivitiesMainScreenState extends State<ActivitiesMainScreen> {
  ContinentType selectedContinent = ContinentType.none;
  List<ApiActivity> selectedActivities = [];

  @override
  void initState() {
    super.initState();
    _selectRandomContinent();
  }

  void _selectRandomContinent() {
    final continents =
        ContinentType.values.where((c) => c != ContinentType.none).toList();
    final random = Random();
    setState(() {
      selectedContinent = continents[random.nextInt(continents.length)];
      selectedActivities = _getRandomActivities(selectedContinent, 20);
    });
  }

  List<ApiActivity> _getRandomActivities(ContinentType continent, int count) {
    final filteredActivities = activityData
        .where((activity) => activity.continentType == continent)
        .toList();
    filteredActivities.shuffle();
    return filteredActivities.take(count).toList();
  }

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
          Text(
            'Explore top Activities from all continents:',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
          ),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 40, top: 5, bottom: 15, right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'images/continents/ContinentsMap.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
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
          Column(
            children: [
              Text(
                'Explore some Activities in ${selectedContinent.toString().split('.').last} :',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: CustomColors.primary,
                    ),
              ),
              ListView.builder(
                itemCount: selectedActivities.length,
                itemBuilder: (context, index) {
                  final activity = selectedActivities[index];
                  return ListTile(
                    title: Text(activity.name),
                    subtitle: Text(activity.location.formatted),
                  );
                },
              ),
            ],
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
