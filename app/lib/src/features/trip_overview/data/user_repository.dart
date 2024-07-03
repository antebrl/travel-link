import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';

part 'user_repository.g.dart';

class UserRepository {
  const UserRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static const String usersBasePath = 'users';

//READ

  Future<UserAccount?> fetchUser({required String uid}) async => _firestore
      .collection(usersBasePath)
      .doc(uid)
      .withConverter<UserAccount>(
        fromFirestore: (snapshot, _) => UserAccount.fromMap(
          snapshot.data()!,
          snapshot.id,
        ),
        toFirestore: (userAcc, _) => userAcc.toMap(),
      )
      .get()
      .then((value) => value.data());

  Future<List<UserAccount>> fetchUsersQuery(
      {required String query, required List<String> participants}) async {
    var queryUsers = usersQuery(query: query, participants: participants);
    if (query.isNotEmpty) {
      queryUsers = queryUsers.where('displayName',
          isGreaterThanOrEqualTo: query,
          isLessThan: query.substring(0, query.length - 1) +
              String.fromCharCode(query.codeUnitAt(query.length - 1) + 1));
    }
    final users = await queryUsers.get();
    return users.docs.map((doc) => doc.data()).toList();
  }

  Query<UserAccount> usersQuery(
          {required String query, required List<String> participants}) =>
      _firestore
          .collection(usersBasePath)
          .limit(10)
          .where(FieldPath.documentId, whereNotIn: participants)
          .withConverter<UserAccount>(
            fromFirestore: (snapshot, _) => UserAccount.fromMap(
              snapshot.data()!,
              snapshot.id,
            ),
            toFirestore: (userAcc, _) => userAcc.toMap(),
          );
}

@Riverpod(keepAlive: true)
UserRepository userRepository(
  UserRepositoryRef ref,
) {
  return UserRepository(
    FirebaseFirestore.instance,
  );
}

//cache users (used everywhere)
@Riverpod(keepAlive: true)
Future<UserAccount?> fetchUser(FetchUserRef ref, String uid) {
  final repository = ref.watch(userRepositoryProvider);
  return repository.fetchUser(uid: uid);
}

@riverpod
Future<List<UserAccount>> fetchUsersQuery(FetchUsersQueryRef ref,
    {required String query, required List<String> participants}) {
  final repository = ref.watch(userRepositoryProvider);
  return repository.fetchUsersQuery(query: query, participants: participants);
}
