import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/activities_continents_screen.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/features/activities/7_api_search_screen/search_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/helper_functions.dart';

class ActivitiesStartScreen extends StatefulWidget {
  const ActivitiesStartScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesStartScreen> createState() => _ActivitiesStartScreenState();
}

class _ActivitiesStartScreenState extends State<ActivitiesStartScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Explore Activities!',
          ),
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: CustomColors.primary,
            unselectedLabelColor: CustomColors.darkGrey,
            labelColor: CustomHelperFunctions.isDarkMode(context)
                ? CustomColors.white
                : CustomColors.primary,
            tabs: const [
              Tab(
                child: Text('Recommended'),
              ),
              Tab(
                child: Text('Explore All'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Text('Main'),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            //APIActivitiesScreen(),
                            const ActivitiesContinentsScreen(),
                      ),
                    );
                  },
                  child: Text('Continent'),
                )
              ],
            ),
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}
