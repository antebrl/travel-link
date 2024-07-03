import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/presentation/actions/about_screen.dart';
import 'package:travel_link/src/features/account/presentation/actions/account_information_screen.dart';
import 'package:travel_link/src/features/account/presentation/account_screen.dart';
import 'package:travel_link/src/features/account/presentation/actions/help_screen.dart';
import 'package:travel_link/src/features/account/presentation/actions/settings_screen.dart';
import 'package:travel_link/src/features/activities/0_activities_tabs_screen/activities_tabs_screen.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_screen.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/authentication/presentation/onboarding_screen.dart';
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
  account,
  profile,
  signIn,
  onboarding
}

enum AccountRoutes {
  accountInformation,
  notifications,
  security,
  settings,
  help,
  about
}

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
final _accountNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.account.name);

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
        if (path.startsWith('/${TopLevelDestinations.signIn.name}') ||
            path.startsWith('/${TopLevelDestinations.onboarding.name}')) {
          return '/${TopLevelDestinations.myTrips.name}';
        }
      } else {
        final onboardingCompleted = ref.read(onboardingCompletedProvider);
        if (!onboardingCompleted) {
          return '/${TopLevelDestinations.onboarding.name}';
        }
        if (path.startsWith('/${TopLevelDestinations.myTrips.name}') ||
            path.startsWith('/${TopLevelDestinations.account.name}')) {
          return '/${TopLevelDestinations.onboarding.name}';
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
      GoRoute(
        path: '/${TopLevelDestinations.onboarding.name}',
        name: TopLevelDestinations.onboarding.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/${TopLevelDestinations.profile.name}/:uid',
        name: TopLevelDestinations.profile.name,
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
                pageBuilder: (context, state) {
                  final index =
                      int.tryParse(state.uri.queryParameters['index'] ?? '0');
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: ActivitiesStartScreen(
                      initialIndex: index ?? 0,
                    ),
                  );
                },
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
          //Account Screen
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              //base route
              GoRoute(
                path: '/${TopLevelDestinations.account.name}',
                name: TopLevelDestinations.account.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const AccountScreen(),
                ),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'account_information',
                    name: AccountRoutes.accountInformation.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AccountAccountInformationScreen();
                    },
                  ),
                  GoRoute(
                    path: 'notifications',
                    name: AccountRoutes.notifications.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const Placeholder();
                    },
                  ),
                  GoRoute(
                    path: 'security',
                    name: AccountRoutes.security.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const Placeholder();
                    },
                  ),
                  GoRoute(
                    path: 'settings',
                    name: AccountRoutes.settings.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AccountSettingsScreen();
                    },
                  ),
                  GoRoute(
                    path: 'help',
                    name: AccountRoutes.help.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AccountHelpScreen();
                    },
                  ),
                  GoRoute(
                    path: 'about',
                    name: AccountRoutes.about.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AccountAboutScreen();
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
