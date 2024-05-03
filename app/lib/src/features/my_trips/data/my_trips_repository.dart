import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';

part 'my_trips_repository.g.dart';

class MyTripsRepository {
  const MyTripsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String tripsBasePath = 'trips';


  Future<List<Trip>> fetchMyTrips({required String uid}) async {
    final trips = await queryMyTrips(uid: uid).get();
    return trips.docs.map((doc) => doc.data()).toList();
  }


  //QUERIES

  Query<Trip> queryMyTrips({required String uid}) =>
    _firestore.collection(tripsBasePath)
      .where('participants', arrayContains: uid)
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
