import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/activities_main_screen.dart';
import 'package:travel_link/src/features/activities/7_search_screen/search_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/strings.dart';
import 'package:travel_link/src/utils/helpers/helper_functions.dart';

class ActivitiesStartScreen extends StatefulWidget {
  const ActivitiesStartScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<ActivitiesStartScreen> createState() => _ActivitiesStartScreenState();
}

class _ActivitiesStartScreenState extends State<ActivitiesStartScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            CustomStrings.appbarExploreActivities,
          ),
          bottom: TabBar(
            indicatorColor: CustomColors.primary,
            unselectedLabelColor: CustomColors.darkGrey,
            labelColor: CustomHelperFunctions.isDarkMode(context)
                ? CustomColors.white
                : CustomColors.primary,
            tabs: const [
              Tab(
                child: Text(CustomStrings.tabBarRecommended),
              ),
              Tab(
                child: Text(CustomStrings.tabBarExploreAll),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActivitiesMainScreen(),
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}
