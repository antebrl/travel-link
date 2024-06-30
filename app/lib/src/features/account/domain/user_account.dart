import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class UserAccount extends Equatable {
  const UserAccount({
    required this.id,
    required this.description,
    required this.displayName,
    required this.pictureUrl,
    this.position,
  });

  final String id;
  final String? description;
  final String? displayName;
  final String? pictureUrl;
  final LatLng? position;

  @override
  List<Object?> get props => [
        id,
        description,
        displayName,
        pictureUrl,
      ];

  @override
  bool get stringify => true;

  factory UserAccount.fromMap(Map<dynamic, dynamic> value, String id) {
    return UserAccount(
      id: id,
      description: value['description'] as String?,
      displayName: value['displayName'] as String?,
      pictureUrl: value['pictureUrl'] as String?,
      position: value['position'] != null ? LatLng.fromJson(value['position'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'displayName': displayName,
      'pictureUrl': pictureUrl,
      'position': position?.toJson(),
    };
  }
}
