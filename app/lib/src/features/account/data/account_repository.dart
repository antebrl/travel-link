import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    return _firestore
        .collection(usersBasePath)
        .doc(uid)
        .set(data, SetOptions(merge: true));
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
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(
  AccountRepositoryRef ref,
) {
  return AccountRepository(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
  );
}
