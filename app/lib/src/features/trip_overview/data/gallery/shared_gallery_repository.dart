import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/trip_overview/domain/picture_post.dart';

part 'shared_gallery_repository.g.dart';

class SharedGalleryRepository {
  const SharedGalleryRepository(this._firestore, this._storage);
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  static String tripGalleryPath(String tripId) => 'trips/$tripId/gallery';

  // create
  Future<void> postPicture({
    required String description,
    required String uid,
    required Uint8List picture,
    required String tripId,
  }) async {
    final timestamp = Timestamp.now();
    final pictureId = '${tripId}_${uid}_${timestamp.millisecondsSinceEpoch}';
    final firestorageRef = _storage.ref().child('gallery/$pictureId');
    await firestorageRef.putData(
      picture,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final pictureUrl = await firestorageRef.getDownloadURL();

    return _firestore.collection(tripGalleryPath(tripId)).doc(pictureId).set({
      'description': description,
      'uid': uid,
      'picture': pictureUrl,
      'timestamp': timestamp,
    });
  }

  Future<List<PicturePost>> fetchPicturePosts({required String tripId}) async {
    final posts = await queryTripsPicturePosts(tripId: tripId).get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  //QUERIES
  Query<PicturePost> queryTripsPicturePosts({required String tripId}) =>
      _firestore
          .collection(tripGalleryPath(tripId))
          .orderBy('timestamp', descending: true)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                PicturePost.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (picturePost, _) => picturePost.toMap(),
          );
}

@Riverpod(keepAlive: true)
SharedGalleryRepository sharedGalleryRepository(
    SharedGalleryRepositoryRef ref) {
  return SharedGalleryRepository(
      FirebaseFirestore.instance, FirebaseStorage.instance);
}

@riverpod
Future<List<PicturePost>> fetchPicturePosts(
    FetchPicturePostsRef ref, String tripId) {
  final repository = ref.watch(sharedGalleryRepositoryProvider);
  return repository.fetchPicturePosts(tripId: tripId);
}
