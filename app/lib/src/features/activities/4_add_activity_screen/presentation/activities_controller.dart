import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'activities_controller.g.dart';

@riverpod
class ActivitiesController extends _$ActivitiesController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> postActivity({
    required Activity activity,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(activityRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.postActivity(
        activity: activity,
        uid: currentUser!.uid,
        ),
    );

    if(state.hasError) logger.e(state.error);
    return state.hasError == false;
  }
}
