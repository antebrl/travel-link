import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/data/continent_data.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/continent_item.dart';
import 'package:travel_link/src/routing/app_router.dart';

class ActivitiesContinentsScreen extends StatelessWidget {
  const ActivitiesContinentsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  width: 450,
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(20),
                    children: <Widget>[
                      for (final continent in continentData)
                        ContinentItem(
                          continent: continent,
                          onSelectContintent: () => context.pushNamed(
                            ActivitiesRoutes.continent.name,
                            pathParameters: {
                              'continent': continent.name.replaceAll(' ', ''),
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
