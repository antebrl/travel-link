import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/chat/group_chat_repository.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'group_chat_controller.g.dart';

@riverpod
class GroupChatController extends _$GroupChatController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<bool> postMessage({
    required String message,
    required String tripId,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(groupChatRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.postMessage(
        uid: currentUser!.uid,
        name: currentUser.displayName!,
        message: message,
        tripId: tripId,
        timestamp: Timestamp.now(),
      ),
    );

    if(state.hasError) logger.e(state.error);
    return state.hasError == false;
  }

}
