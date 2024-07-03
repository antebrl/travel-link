import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';

part 'trip_activities_repository.g.dart';

class TripActivitiesRepository {
  const TripActivitiesRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String tripActivitiesPath(String tripId) => 'trips/$tripId/activities';

  // create

  Future<void> addActivity({
    required String tripId,
    required Activity activity,
  }) =>
      _firestore
          .collection(tripActivitiesPath(tripId))
          .add(activity.toFirebaseMap());

  // read

  Future<List<Activity>> fetchTripActivities({required String tripId}) async {
    final activities = await queryTripActivities(tripId: tripId).get();
    return activities.docs.map((doc) => doc.data()).toList();
  }

  //QUERIES
  Query<Activity> queryTripActivities({required String tripId}) => _firestore
      .collection(tripActivitiesPath(tripId))
      .withConverter(
        fromFirestore: (snapshot, _) =>
            Activity.fromFirebaseMap(snapshot.data()!, firebaseId: snapshot.id),
        toFirestore: (picturePost, _) => picturePost.toFirebaseMap(),
      );

  // delete

  Future<void> removeActivity({
    required String tripId,
    required String activityId,
  }) =>
      _firestore
          .collection(tripActivitiesPath(tripId))
          .doc(activityId)
          .delete();
}

@Riverpod(keepAlive: true)
TripActivitiesRepository tripActivitiesRepository(
    TripActivitiesRepositoryRef ref) {
  return TripActivitiesRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<Activity>> fetchTripActivities(
  FetchTripActivitiesRef ref,
  String tripId,
) {
  final repository = ref.watch(tripActivitiesRepositoryProvider);
  return repository.fetchTripActivities(tripId: tripId);
}
