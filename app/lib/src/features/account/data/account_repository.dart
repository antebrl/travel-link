import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';

part 'account_repository.g.dart';


class AccountRepository {
  const AccountRepository(this._firestore, this._storage);
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  static const String usersBasePath = 'users';

//Create | Update

  Future<void> updateFirestoreUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    return _firestore.collection(usersBasePath).doc(uid).set(data, SetOptions(merge: true));
  }

  Future<void> updateProfilePicture({
    required User user,
    required Uint8List picture,
  }) async {
    final firestorageRef = _storage.ref().child('profile_pictures/${user.uid}');
    await firestorageRef.putData(
      picture,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final pictureUrl = await firestorageRef.getDownloadURL();

    await user.updatePhotoURL(pictureUrl);

    return updateFirestoreUserData(
        uid: user.uid,
        data: {
          'pictureUrl': pictureUrl,
        },
      );
  }

//READ

  Future<UserAccount?> fetchUser({required String uid}) async =>
      _firestore
        .collection(usersBasePath)
        .doc(uid)
        .withConverter<UserAccount>(
          fromFirestore: (snapshot, _) => UserAccount.fromMap(
              snapshot.data()!, snapshot.id), //tripId = document-id
          toFirestore: (userAcc, _) => userAcc.toMap(),
        )
        .get()
        .then((value) => value.data());

  Future<List<UserAccount>> fetchUsersQuery({required String query}) async {
    var queryUsers = usersQuery(query: query);
    if(query.isNotEmpty) {
       queryUsers = queryUsers.where('displayName', isGreaterThanOrEqualTo: query, isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length - 1) + 1));
    }
    final users = await queryUsers.get();
    return users.docs.map((doc) => doc.data()).toList();
  }

  Query<UserAccount> usersQuery({required String query}) =>
      _firestore
        .collection(usersBasePath)
        .limit(10)
        .withConverter<UserAccount>(
          fromFirestore: (snapshot, _) => UserAccount.fromMap(
              snapshot.data()!, snapshot.id), 
          toFirestore: (userAcc, _) => userAcc.toMap(),
        );
}


@Riverpod(keepAlive: true)
AccountRepository accountRepository(
    AccountRepositoryRef ref,) {
  return AccountRepository(
      FirebaseFirestore.instance, FirebaseStorage.instance,);
}

//cache users (used everywhere)
@Riverpod(keepAlive: true)
Future<UserAccount?> fetchUser(FetchUserRef ref, String uid) {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.fetchUser(uid: uid);
}

@riverpod
Future<List<UserAccount>> fetchUsersQuery(FetchUsersQueryRef ref, {required String query}) {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.fetchUsersQuery(query: query);
}
