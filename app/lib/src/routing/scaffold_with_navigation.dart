import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/helper_functions.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

// see https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
// and https://github.com/bizz84/tmdb_movie_app_riverpod/blob/main/lib/src/routing/scaffold_with_nested_navigation.dart
class NavigationItem {
  NavigationItem({required this.icon, required this.selectedIcon});
  final IconData icon;
  final IconData selectedIcon;
}

final _navigationList = (
  trip: NavigationItem(icon: Icons.home_outlined, selectedIcon: Icons.home),
  myTrips:
      NavigationItem(icon: Icons.search_outlined, selectedIcon: Icons.search),
  activities: NavigationItem(
      icon: Icons.add_location_outlined, selectedIcon: Icons.add_location),
  profile: NavigationItem(
      icon: Icons.account_circle_outlined, selectedIcon: Icons.account_circle),
);

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: CustomColors.primary.withOpacity(0.2),
          backgroundColor: isDarkMode ? CustomColors.black : CustomColors.white,
          //surfaceTintColor: Colors.white,
        ),
        child: NavigationBar(
          //height: 80,
          elevation: 0,
          selectedIndex: navigationShell.currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: _goBranch,
          destinations: [
            NavigationDestination(
              icon:
                  Icon(_navigationList.trip.icon, color: CustomColors.darkGrey),
              selectedIcon: Icon(_navigationList.trip.selectedIcon,
                  color: Theme.of(context).primaryColor),
              label: context.loc.home,
            ),
            NavigationDestination(
              icon: Icon(_navigationList.myTrips.icon,
                  color: CustomColors.darkGrey),
              selectedIcon: Icon(_navigationList.myTrips.selectedIcon,
                  color: Theme.of(context).primaryColor),
              label: context.loc.discover,
            ),
            NavigationDestination(
              icon: Icon(_navigationList.activities.icon,
                  color: CustomColors.darkGrey),
              selectedIcon: Icon(_navigationList.activities.selectedIcon,
                  color: Theme.of(context).primaryColor),
              label: context.loc.activities,
            ),
            NavigationDestination(
              icon: Icon(_navigationList.profile.icon,
                  color: CustomColors.darkGrey),
              selectedIcon: Icon(_navigationList.profile.selectedIcon,
                  color: Theme.of(context).primaryColor),
              label: context.loc.profile,
            ),
          ],
        ),
      ),
    );
  }
}
