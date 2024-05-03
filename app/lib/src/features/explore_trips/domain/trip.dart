import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Trip extends Equatable {
  const Trip({
    required this.tripId,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.destination,
    required this.participants, 
    this.isPublic = false,
    //required this.image,
    //required this.activities,
  });

  final String tripId;
  final String name;
  final DateTime? startDate;
  final DateTime? endDate;
  final String destination;
  final bool isPublic;
  final List<String> participants;
  //final String image;
  //final List<Activity> activities;
  //final int chatId;
  //final List<Profile> participants;

  @override
  List<Object?> get props => [
        name,
        startDate,
        endDate,
        destination,
        isPublic,
        participants
      ];

  @override
  bool get stringify => true;

  factory Trip.fromMap(Map<dynamic, dynamic> value, String tripId) {
    return Trip(
      tripId: tripId,
      name: value['name'] as String,
      startDate: (value['startDate'] as Timestamp?)?.toDate(),
      endDate: (value['endDate'] as Timestamp?)?.toDate(),
      destination: value['destination'] as String,
      isPublic: value['isPublic'] as bool,
      participants: (value['participants'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'startDate': startDate != null ? Timestamp.fromDate(startDate!) : null,
      'endDate': endDate != null ? Timestamp.fromDate(endDate!) : null,
      'destination': destination,
      'isPublic': isPublic,
      'participants': participants,
    };
  }
}
