import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/curved_edges.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/activities_continents_screen.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/popular_activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/horizontal_activity_item.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/small_activity_item.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesMainScreen extends StatefulWidget {
  const ActivitiesMainScreen({super.key});

  @override
  State<ActivitiesMainScreen> createState() => _ActivitiesMainScreenState();
}

class _ActivitiesMainScreenState extends State<ActivitiesMainScreen> {
  final DestinationController _controller = DestinationController();
  ContinentType selectedContinent = ContinentType.none;
  List<ApiActivity> selectedActivities = [];
  String getContinentDisplayName(ContinentType continent) {
    switch (continent) {
      case ContinentType.northAmerica:
        return 'North America';
      case ContinentType.southAmerica:
        return 'South America';
      case ContinentType.africa:
        return 'Africa';
      case ContinentType.europe:
        return 'Europe';
      case ContinentType.asia:
        return 'Asia';
      case ContinentType.australia:
        return 'Australia';
      case ContinentType.none:
      default:
        return '';
    }
  }

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
              padding: EdgeInsets.zero,
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
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: AutoCompleteSearch(
                          controller: _controller,
                          horizontalPadding: 95,
                          filterByType: 'amenity',
                          textFieldDecoration: InputDecoration(
                            hintText: 'Activity...',
                            fillColor: CustomColors.white,
                            filled: true,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: CustomColors.white,
                              ),
                            ),
                            labelStyle: const TextStyle(
                              color: CustomColors
                                  .primary, // Farbe für den Labeltext
                            ),
                          ),
                          textStyle: const TextStyle(
                            color: CustomColors
                                .primary, // Farbe für den Eingabetext
                          ),
                        ),
                      ),
                    )
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
          Padding(
            padding:
                const EdgeInsets.only(left: 40, top: 5, bottom: 15, right: 40),
            child: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                    'assets/images/continents/ContinentsMap.png',
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
                        const ActivitiesContinentsScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                'Explore some Activities in ${getContinentDisplayName(selectedContinent)}:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: CustomColors.primary,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 5, bottom: 15, right: 30),
                child: SizedBox(
                  height: 200, // Höhe des horizontalen ListViews
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedActivities.length,
                    itemBuilder: (context, index) {
                      final activity = selectedActivities[index];
                      return SmallActivityItem(
                        activity: activity,
                        key: UniqueKey(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 5, bottom: 15, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Explore the most popular Activities: ',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: CustomColors.primary,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popularActivityData.length,
                  itemBuilder: (context, index) {
                    final activity = popularActivityData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: HorizontalActivityItem(
                        activity: activity,
                        key: UniqueKey(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
