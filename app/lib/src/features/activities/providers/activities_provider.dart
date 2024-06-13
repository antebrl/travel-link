import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';

class ActivitiesNotifier extends StateNotifier<List<ApiActivity>> {
  ActivitiesNotifier(super.initialState);

  void addActivity(ApiActivity newActivity) {
    state = [newActivity, ...state];
  }
}

final activitiesProvider =
    StateNotifierProvider<ActivitiesNotifier, List<ApiActivity>>((ref) {
  final initialState = activityData;
  return ActivitiesNotifier(initialState);
});

final activitiesDataProvider = Provider((ref) {
  return activityData;
});
