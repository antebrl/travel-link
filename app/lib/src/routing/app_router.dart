import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/presentation/account_screen.dart';
import 'package:travel_link/src/features/account/presentation/edit_profile_screen.dart';
import 'package:travel_link/src/features/activities/0_activities_tabs_screen/activities_tabs_screen.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_screen.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/authentication/presentation/custom_sign_in_screen.dart';
import 'package:travel_link/src/features/explore_trips/presentation/explore_trips_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_screen.dart';
import 'package:travel_link/src/features/profile/public_profile_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/trip_overview_screen.dart';
import 'package:travel_link/src/utils/go_router/go_router_refresh_stream.dart';

import 'scaffold_with_navigation.dart';

part 'app_router.g.dart';

// general ideas on navigation see https://m2.material.io/design/navigation/understanding-navigation.html#forward-navigation

// shell routes, appear in the bottom navigation
// see https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
enum TopLevelDestinations {
  trips,
  myTrips,
  activities,
  user,
  account,
  signInHome,
  signInAccount
}

enum AccountRoutes { edit, settings, security, help, about }

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
final _accountNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.account.name);
final _userNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.user.name);

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
        if (path.startsWith('/${TopLevelDestinations.signInHome.name}')) {
          return '/${TopLevelDestinations.myTrips.name}';
        }
        if (path.startsWith('/${TopLevelDestinations.signInAccount.name}')) {
          return '/${TopLevelDestinations.account.name}';
        }
      } else {
        if (path.startsWith('/${TopLevelDestinations.myTrips.name}')) {
          return '/${TopLevelDestinations.signInHome.name}';
        }
        if (path.startsWith('/${TopLevelDestinations.account.name}')) {
          return '/${TopLevelDestinations.signInAccount.name}';
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
          child: ExploreTripsScreen(),
        ),
      ),
      // USER PROFILE
      GoRoute(
        path: '/${TopLevelDestinations.user.name}/:uid',
        name: TopLevelDestinations.user.name,
        pageBuilder: (context, state) {
          final uid = state.pathParameters['uid']!;
          return NoTransitionPage(
            child: UserProfileScreen(
              targetuid: uid,
            ),
          );
        },
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
              GoRoute(
                path: '/${TopLevelDestinations.signInHome.name}',
                name: TopLevelDestinations.signInHome.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CustomSignInScreen(),
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
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              // Route for the user's own account
              GoRoute(
                path: '/${TopLevelDestinations.account.name}',
                name: TopLevelDestinations.account.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const AccountScreen(),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'edit',
                    parentNavigatorKey: _rootNavigatorKey,
                    name: AccountRoutes.edit.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const EditProfileScreen();
                    },
                  ),
                  GoRoute(
                    path: 'settings',
                    name: AccountRoutes.settings.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const Placeholder();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: '/${TopLevelDestinations.signInAccount.name}',
                name: TopLevelDestinations.signInAccount.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CustomSignInScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
