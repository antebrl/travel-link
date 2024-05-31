import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/utils/constants/api_constants.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'api_activities_repository.g.dart';

class ApiActivitiesRepository {
  //TODO
  // Future<Person> getActivityDetailsById({required int placeId}) async {

  // }

  Future<List<ApiActivity>> getActivitiesInPlace(
      {required double lon,
      required double lat,
      required Set<String> categories}) async {
    final String categoriesString = categories.join(',');
    final String url =
        '${CustomApiConstants.placesBaseURL}?categories=$categoriesString&filter=circle:$lon,$lat,5000&apiKey=${CustomApiConstants.geoapifySecretKey}&limit=50';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final destinations =
          json.decode(response.body)['features'] as List<dynamic>;
      logger.d(destinations);

      return destinations
          .map(
            (activity) => ApiActivity.fromMap(
                activity['properties'] as Map<String, dynamic>),
          )
          .where((apiActivity) => apiActivity != null)
          .cast<ApiActivity>()
          .toList();
    } else {
      logger.e(
        'Failed to load and parse destination suggestions',
        error: response.body,
      );
      return [];
    }
  }
}

@Riverpod(keepAlive: true)
ApiActivitiesRepository apiActivitiesRepository(
        ApiActivitiesRepositoryRef ref) =>
    ApiActivitiesRepository();

@Riverpod(keepAlive: true)
Future<List<ApiActivity>> fetchActivitiesFromAPI(
  FetchActivitiesFromAPIRef ref, {
  required double lon,
  required double lat,
  Set<String> categories = const {'entertainment'},
}) {
  final repo = ref.watch(apiActivitiesRepositoryProvider);
  return repo.getActivitiesInPlace(lon: lon, lat: lat, categories: categories);
}
