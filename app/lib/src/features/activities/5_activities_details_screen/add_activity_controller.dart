import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/trip_overview/data/trip_activities_repository.dart';

part 'add_activity_controller.g.dart';

@riverpod
class AddActivityController extends _$AddActivityController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<void> addActivityToTrip({required Activity activity, required String tripId}) async {

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(tripActivitiesRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.addActivity(tripId: tripId, activity: activity),
    );
  }

}
