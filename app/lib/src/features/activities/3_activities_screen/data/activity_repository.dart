import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';

part 'activity_repository.g.dart';

class ActivityRepository {
  const ActivityRepository(this._firestore, this._storage);
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  static String tripActivitiesPath(String tripId) => 'trips/$tripId/activities';
  static String activityPath = 'activities';

  // create
  Future<void> postActivity({
    required String uid,
    required Activity activity,
  }) async {
    final timestamp = Timestamp.now();
    final pictureId =
        '${activity.name}_${uid}_${timestamp.millisecondsSinceEpoch}';
    final firestorageRef = _storage.ref().child('activities/$pictureId');
    await firestorageRef.putData(
      activity.imageBytes!,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final String pictureUrl = await firestorageRef.getDownloadURL();

    activity
      ..imagePaths = [pictureUrl]
      ..creatorId = uid;

    await _firestore.collection(activityPath).add(activity.toFirebaseMap());
  }

  //NOT USED AT THE MOMENT
  Future<void> addToTrip({
    required String tripId,
    required Activity activity,
  }) =>
      _firestore
          .collection(tripActivitiesPath(tripId))
          .add(activity.toFirebaseMap());

  Future<List<Activity>> fetchActivities(
      {required Set<String> categories}) async {
    final posts = await queryActivities(categories: categories).get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  //NOT USED
  Future<List<Activity>> fetchActivitiesByTrip({required String tripId}) async {
    final posts = await queryActivitiesByTrip(tripId: tripId).get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  // //QUERIES
  Query<Activity> queryActivities({required Set<String> categories}) =>
      _firestore
          .collection(activityPath)
          .where('categories', arrayContainsAny: categories)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                Activity.fromFirebaseMap(snapshot.data()!),
            toFirestore: (activity, _) => activity.toFirebaseMap(),
          );

  // NOT USED
  Query<Activity> queryActivitiesByTrip({required String tripId}) =>
      _firestore.collection(tripActivitiesPath(tripId)).withConverter(
            fromFirestore: (snapshot, _) =>
                Activity.fromFirebaseMap(snapshot.data()!),
            toFirestore: (activity, _) => activity.toFirebaseMap(),
          );
}

@Riverpod(keepAlive: true)
ActivityRepository activityRepository(ActivityRepositoryRef ref) {
  return ActivityRepository(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
  );
}

@riverpod
Future<List<Activity>> fetchActivities(
  FetchActivitiesRef ref, {
  required Set<String> categories,
}) {
  final repository = ref.watch(activityRepositoryProvider);
  return repository.fetchActivities(categories: categories);
}
