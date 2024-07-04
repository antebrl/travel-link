import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class UserAccount extends Equatable {
  const UserAccount({
    required this.id,
    required this.description,
    required this.publicName,
    required this.displayName,
    required this.city,
    required this.pictureUrl,
    required this.interests,
    required this.languages,
    this.position,
  });

  factory UserAccount.fromMap(Map<dynamic, dynamic> value, String id) {
    return UserAccount(
      id: id,
      description: value['description'] as String?,
      displayName: value['displayName'] as String?,
      publicName: value['publicName'] as String?,
      pictureUrl: value['pictureUrl'] as String?,
      city: value['city'] as String?,
      interests: value['interests'] != null
          ? (value['interests'] as List<dynamic>).cast<String>()
          : [],
      languages: value['languages'] != null
          ? (value['languages'] as List<dynamic>).cast<String>()
          : [],
      position: value['position'] != null
          ? LatLng.fromJson(value['position'] as Map<String, dynamic>)
          : null,
    );
  }

  final String id;
  final String? description;
  final String? displayName;
  final String? publicName;
  final String? pictureUrl;
  final String? city;

  final List<String> interests;
  final List<String> languages;
  final LatLng? position;

  @override
  List<Object?> get props => [
        id,
        description,
        displayName,
        publicName,
        city,
        pictureUrl,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'displayName': displayName,
      'publicName': publicName,
      'city': city,
      'pictureUrl': pictureUrl,
      'interests': interests,
      'languages': languages,
      'position': position?.toJson(),
    };
  }
}
