import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';

part 'trips_repository.g.dart';

//idea from https://github.com/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/features/entries/data/entries_repository.dart

class TripsRepository {
  const TripsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String tripPath(String tripId) =>
      'trips/$tripId';
  static String tripsBasePath = 'trips';


  // read
  Stream<Trip> watchTrip({required String tripId}) =>
      _firestore
          .doc(tripPath(tripId))
          .withConverter<Trip>(
            fromFirestore: (snapshot, _) => Trip.fromMap(
                snapshot.data()!, snapshot.id), //tripId = document-id
            toFirestore: (trip, _) => trip.toMap(),
          )
          .snapshots()
          .map((snapshot) => snapshot.data()!);

  Stream<List<Trip>> watchPublicTrips() =>
      queryPublicTrips()
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Future<List<Trip>> fetchPublicTrips() async {
    final trips = await queryPublicTrips().get();
    return trips.docs.map((doc) => doc.data()).toList();
  }


  //QUERIES

  Query<Trip> queryPublicTrips() =>
      _firestore.collection(tripsBasePath)
        .where('isPublic', isEqualTo: true)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                Trip.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (trip, _) => trip.toMap(),
          );
}

@Riverpod(keepAlive: true)
TripsRepository tripsRepository(TripsRepositoryRef ref) {
  return TripsRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<Trip>> fetchPublicTrips(FetchPublicTripsRef ref) {
  final repository = ref.watch(tripsRepositoryProvider);
  return repository.fetchPublicTrips();
}

@riverpod
Stream<Trip> tripStream(TripStreamRef ref, String tripId) {
  final repository = ref.watch(tripsRepositoryProvider);
  return repository.watchTrip(tripId: tripId);
}
