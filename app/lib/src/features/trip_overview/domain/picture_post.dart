import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PicturePost extends Equatable {
  const PicturePost({
    required this.id,
    required this.description,
    required this.uid,
    required this.username,
    required this.picture,
    required this.timestamp,
  });

  final String id;
  final String description;
  final String uid;
  final String? username;
  final String picture;
  final DateTime timestamp;

  @override
  List<Object?> get props => [
        id,
        description,
        uid,
        username,
        picture,
        timestamp
      ];

  @override
  bool get stringify => true;

  factory PicturePost.fromMap(Map<dynamic, dynamic> value, String id) {
    return PicturePost(
      id: id,
      description: value['description'] as String,
      uid: value['uid'] as String,
      username: value['username'] as String?,
      picture: value['picture'] as String,
      timestamp: (value['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'uid': uid,
      'username': username,
      'picture': picture,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
