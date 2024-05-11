import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/gallery/shared_gallery_repository.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'shared_gallery_controller.g.dart';

@riverpod
class SharedGalleryController extends _$SharedGalleryController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> postPicture({
    required String description,
    required Uint8List picture,
    required String tripId,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(sharedGalleryRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.postPicture(
        description: description,
        uid: currentUser!.uid,
        picture: picture,
        tripId: tripId,
      ),
    );

    if(state.hasError) logger.e(state.error);
    return state.hasError == false;
  }
}
