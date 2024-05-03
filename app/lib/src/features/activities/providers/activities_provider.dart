import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';

class ActivitiesNotifier extends StateNotifier<List<Activity>> {
  ActivitiesNotifier(super.initialState);

  void addActivity(Activity newActivity) {
    state = [newActivity, ...state];
  }
}

final activitiesProvider =
    StateNotifierProvider<ActivitiesNotifier, List<Activity>>((ref) {
  final initialState = activityData; // Verwende activityData als Startzustand
  return ActivitiesNotifier(initialState);
});

final activitiesDataProvider = Provider((ref) {
  return activityData;
});
