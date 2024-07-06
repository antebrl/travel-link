import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
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

    ref.invalidate(fetchUserProvider(currentUser!.uid));

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  Future<bool> updateEmail({required String email}) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    try {
      // ignore: deprecated_member_use
      await currentUser!.updateEmail(email);
    } catch (e) {
      logger.e(e);
    }

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  Future<bool> updatePassword({required String password}) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    await currentUser!.updatePassword(password);

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

    ref.invalidate(fetchUserProvider(currentUser.uid));

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

  Future<bool> updateUserData({
    required Map<String, dynamic> data,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;
    if (currentUser == null) return false;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(accountRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.updateFirestoreUserData(
        uid: currentUser.uid,
        data: data,
      ),
    );

    ref.invalidate(FetchUserProvider(currentUser.uid));

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

  Future<bool> saveProfileToDatabase(
      {required String publicName,
      required String description,
      required String city,
      required List<String> languageList,
      required List<String> interestsList,
      required Uint8List? profilePicture}) async {
    //set state to loading
    state = const AsyncLoading();

    state = await AsyncValue.guard(() {
      if (profilePicture != null) {
        // Update profile picture
        updateProfilePicture(
          picture: profilePicture,
        );
      }
      return updateUserData(
        data: {
          'publicName': publicName,
          'description': description,
          'city': city,
          'languages': languageList,
          'interests': interestsList,
        },
      );
    });

    if (state.hasError) logger.e(state.error);
    return state.hasError == false;
  }
}
