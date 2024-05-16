import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.name,
    required this.uid,
    required this.message,
    required this.timestamp,
  });

  final String name;
  final String uid;
  final String message;
  final DateTime timestamp;

  @override
  List<Object?> get props => [
        name,
        uid,
        message,
        timestamp
      ];

  @override
  bool get stringify => true;

  factory ChatMessage.fromMap(Map<dynamic, dynamic> value) {
    return ChatMessage(
      name: value['name'] as String,
      uid: value['uid'] as String,
      message: value['message'] as String,
      timestamp: (value['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'message': message,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
