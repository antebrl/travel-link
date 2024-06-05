import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/presentation/account_screen.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/activitiesStart_screen.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_screen.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/activities_details_screen.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/authentication/presentation/custom_sign_in_screen.dart';
import 'package:travel_link/src/features/explore_trips/presentation/explore_trips_screen.dart';
import 'package:travel_link/src/features/explore_trips/presentation/trips_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/trip_overview_screen.dart';
import 'package:travel_link/src/utils/go_router/go_router_refresh_stream.dart';

import 'scaffold_with_navigation.dart';

part 'app_router.g.dart';

// general ideas on navigation see https://m2.material.io/design/navigation/understanding-navigation.html#forward-navigation

// shell routes, appear in the bottom navigation
// see https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
enum TopLevelDestinations { trips, myTrips, activities, profile, signIn }

enum AccountRoutes { settings, security, help, about }

enum ActivitiesRoutes { activityDetails, continent }

enum TripRoutes { tripDetails }

// GlobalKey is a factory, hence each call creates a key
//this is root, even if it navigates to people, it needs a separate key!!!

// only for debugging (~ Ante)
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _tripsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.trips.name);
final _myTripsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.myTrips.name);
final _activitiesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.activities.name);
final _profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.profile.name);

//https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/${TopLevelDestinations.trips.name}',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path.startsWith('/${TopLevelDestinations.signIn.name}')) {
          return '/${TopLevelDestinations.myTrips.name}';
        }
      } else {
        // TODO(Ante): also switch to signIn Page if user tries to join trip or add activity
        if (path.startsWith('/${TopLevelDestinations.myTrips.name}') ||
            path.startsWith('/${TopLevelDestinations.profile.name}')) {
          return '/${TopLevelDestinations.signIn.name}';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        pageBuilder: (context, state) => const NoTransitionPage(
          child:
              TripsScreen(), // Replace HomeScreen with your actual home screen widget
        ),
      ),
      GoRoute(
        path: '/${TopLevelDestinations.signIn.name}',
        name: TopLevelDestinations.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomSignInScreen(),
        ),
      ),
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigation(navigationShell: navigationShell);
        },
        branches: [
          //Trips Screen
          StatefulShellBranch(
            navigatorKey: _myTripsNavigatorKey,
            routes: [
              // base route
              GoRoute(
                path: '/${TopLevelDestinations.myTrips.name}',
                name: TopLevelDestinations.myTrips.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MyTripsScreen(),
                ),
              ),
            ],
          ),
          //My-Trips Screen
          StatefulShellBranch(
            navigatorKey: _tripsNavigatorKey,
            routes: [
              // base route
              GoRoute(
                path: '/${TopLevelDestinations.trips.name}',
                name: TopLevelDestinations.trips.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ExploreTripsScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'details/:tripId',
                    name: TripRoutes.tripDetails.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      final tripId = state.pathParameters['tripId']!;
                      return TripOverviewScreen(
                        tripId: tripId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          //Activities Screen
          StatefulShellBranch(
            navigatorKey: _activitiesNavigatorKey,
            routes: [
              // base route
              GoRoute(
                path: '/${TopLevelDestinations.activities.name}',
                name: TopLevelDestinations.activities.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const ActivitiesStartScreen(),
                ),
                routes: <RouteBase>[
                  // GoRoute(
                  //   path: 'details',
                  //   name: ActivitiesRoutes.activityDetails.name,
                  //   parentNavigatorKey: _rootNavigatorKey,
                  //   builder: (BuildContext context, GoRouterState state) {
                  //     final activity = state.extra as ApiActivity?;
                  //     return;
                  //   },
                  // ),
                  GoRoute(
                    path: 'continent/:continent',
                    name: ActivitiesRoutes.continent.name,
                    builder: (BuildContext context, GoRouterState state) {
                      final continentName = state.pathParameters['continent']!;
                      return ActivitiesScreen(
                        continent: Continent.getContinentByName(continentName),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          //Profile Screen
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              //base route
              GoRoute(
                path: '/${TopLevelDestinations.profile.name}',
                name: TopLevelDestinations.profile.name,
                pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    //child: const CustomProfileScreen(),
                    //child: ProfileScreen(),
                    child: const AccountScreen()),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'settings',
                    name: AccountRoutes.settings.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const Placeholder();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
