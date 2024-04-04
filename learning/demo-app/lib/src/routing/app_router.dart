import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/counter/presentation/counter_screen.dart';
import '../features/rest_crud_demo/domain/person.dart';
import '../features/rest_crud_demo/presentation/details_screen.dart';
import '../features/rest_crud_demo/presentation/people_screen.dart';
import 'scaffold_with_navigation.dart';

part 'app_router.g.dart';

// general ideas on navigation see https://m2.material.io/design/navigation/understanding-navigation.html#forward-navigation

// shell routes, appear in the bottom navigation
// see https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
enum TopLevelDestinations { people, counter }

// GlobalKey is a factory, hence each call creates a key
//this is root, even if it navigates to people, it needs a separate key!!!
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _peopleNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.people.name);
final _counterNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.counter.name);

// other destinations, reachable from a top level destination
enum SubRoutes { details }

enum Parameter { id }

//https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/${TopLevelDestinations.people.name}',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _peopleNavigatorKey,
            routes: [
              // base route people
              GoRoute(
                path: '/${TopLevelDestinations.people.name}', // path: /people
                name: TopLevelDestinations.people.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const PeopleScreen(),
                ),
                routes: <RouteBase>[
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).
                  GoRoute(
                    path: '${SubRoutes.details.name}/:${Parameter.id.name}',
                    name: SubRoutes.details.name,
                    builder: (BuildContext context, GoRouterState state) {
                      // alternatively use https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html
                      final id =
                          int.parse(state.pathParameters[Parameter.id.name]!);
                      final person = _extractPersonFromExtra(state.extra);
                      return DetailsScreen(id: id, person: person);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _counterNavigatorKey,
            routes: [
              GoRoute(
                path: '/${TopLevelDestinations.counter.name}',
                name: TopLevelDestinations.counter.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const CounterScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Person? _extractPersonFromExtra(Object? extra) {
  return extra == null
      ? null
      : extra is Person
          ? extra
          : extra is Map // if you come back from bottom navigation, e.g. look
              // at details of a person, go to counter via bottom navigation,
              // use bottom navigation to go to people/home
              ? Person.fromJson(
                  extra as Map<String, Object?>,
                )
              : null;
}
