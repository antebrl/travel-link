import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/chat/domain/chat_message.dart';

part 'group_chat_repository.g.dart';

class GroupChatRepository {
  const GroupChatRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String tripChatPath(String tripId) => 'trips/$tripId/chat';

  // create
  Future<void> postMessage({
    required String uid,
    required String message,
    required Timestamp timestamp,
    required String tripId,
  }) =>
      _firestore.collection(tripChatPath(tripId)).add({
        'uid': uid,
        'message': message,
        'timestamp': timestamp,
      });

  Stream<List<ChatMessage>> watchChatMessages({required String tripId}) =>
      queryChatMessages(tripId: tripId)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  //QUERIES
  Query<ChatMessage> queryChatMessages({required String tripId}) => _firestore
      .collection(tripChatPath(tripId))
      .orderBy('timestamp', descending: true)
      .withConverter(
        fromFirestore: (snapshot, _) => ChatMessage.fromMap(snapshot.data()!),
        toFirestore: (message, _) => message.toMap(),
      );
}

@Riverpod(keepAlive: true)
GroupChatRepository groupChatRepository(GroupChatRepositoryRef ref) {
  return GroupChatRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<ChatMessage>> tripChatStream(TripChatStreamRef ref, String tripId) {
  final repository = ref.watch(groupChatRepositoryProvider);
  return repository.watchChatMessages(tripId: tripId);
}
