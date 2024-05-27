import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> updateProfilePicture({
    required Uint8List picture,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(accountRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.updateProfilePicture(
        user: currentUser!,
        picture: picture,
      ),
    );

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  Future<bool> updateDisplayName({required String displayName}) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(accountRepositoryProvider);

    await currentUser!.updateDisplayName(displayName);

    state = await AsyncValue.guard(
      () => repository.updateFirestoreUserData(
        uid: currentUser.uid,
        data: {
          'displayName': displayName,
        },
      ),
    );

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  Future<bool> updateUserData({
    required Map<String, dynamic> data,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(accountRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.updateFirestoreUserData(
        uid: currentUser!.uid,
        data: data,
      ),
    );

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  // Explicit functions to set user data

  Future<bool> updateDescription({required String description}) {
    return updateUserData(
      data: {
        'description': description,
      },
    );
  }
}
