import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';

part 'my_trips_controller.g.dart';

@riverpod
class MyTripsController extends _$MyTripsController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> createTrip({
    required String name,
    required DateTime? start,
    required DateTime? end,
    required String destination,
    required bool isPublic,
    int? maxParticipants,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(myTripsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.createTrip(
        uid: currentUser!.uid,
        name: name,
        start: start,
        end: end,
        destination: destination,
        isPublic: isPublic,
        maxParticipants: maxParticipants,
      ),
    );

    return state.hasError == false;
  }

  Future<void> joinTrip({required Trip trip}) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(myTripsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.joinTrip(uid: currentUser!.uid, trip: trip),
    );
  }

  // Future<void> leaveTrip(String tripId) async {
  //   final currentUser = ref.read(firebaseAuthProvider).currentUser;

  //   //set state to loading
  //   state = const AsyncLoading();

  //   final repository = ref.read(myTripsRepositoryProvider);

  //   state = await AsyncValue.guard(
  //     () => repository.leaveTrip(uid: currentUser!.uid, tripId: tripId),
  //   );
  // }
}
