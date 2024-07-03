import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/data/continent_data.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/continent_item.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_screen.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class ActivitiesContinentsScreen extends StatelessWidget {
  const ActivitiesContinentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         context.loc.exploreActivities,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: 450,
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1 / .9,
                padding: const EdgeInsets.all(20),
                children: <Widget>[
                  for (final continent in continentData)
                    ContinentItem(
                      continent: continent,
                      onSelectContintent: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ActivitiesScreen(continent: continent),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
