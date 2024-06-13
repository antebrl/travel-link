import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';

part 'my_trips_repository.g.dart';

class MyTripsRepository {
  const MyTripsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String tripsBasePath = 'trips';

  // create
  Future<void> createTrip({
    required String uid,
    required String name,
    required String? description,
    required DateTime? start,
    required DateTime? end,
    required Destination destination,
    required List<String> images,
    bool isPublic = false,
    int? maxParticipants,
  }) =>
      _firestore.collection(tripsBasePath).add({
        'name': name,
        'description': description,
        'startDate': start != null ? Timestamp.fromDate(start) : null,
        'endDate': end != null ? Timestamp.fromDate(end) : null,
        'destination': destination.toMap(),
        'isPublic': isPublic,
        'participants': [uid],
        'maxParticipants': maxParticipants,
        'images': images,
      });

  Future<void> joinTrip({required Trip trip, required String uid}) async {
    final participants = trip.participants..add(uid);

    await _firestore
        .doc('$tripsBasePath/${trip.tripId}')
        .update({'participants': participants});
  }

  Future<List<Trip>> fetchMyTrips({required String uid}) async {
    final trips = await queryMyTrips(uid: uid).get();
    return trips.docs.map((doc) => doc.data()).toList();
  }

  //QUERIES

  Query<Trip> queryMyTrips({required String uid}) => _firestore
      .collection(tripsBasePath)
      .where('participants', arrayContains: uid)
      .orderBy('startDate')
      .withConverter(
        fromFirestore: (snapshot, _) =>
            Trip.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (trip, _) => trip.toMap(),
      );
}

@Riverpod(keepAlive: true)
MyTripsRepository myTripsRepository(MyTripsRepositoryRef ref) {
  return MyTripsRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<Trip>> fetchMyTrips(FetchMyTripsRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser!;

  final repository = ref.watch(myTripsRepositoryProvider);
  return repository.fetchMyTrips(uid: user.uid);
}
