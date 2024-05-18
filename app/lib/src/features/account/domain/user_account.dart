import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  const UserAccount({
    required this.id,
    required this.description,
    required this.displayName,
    required this.pictureUrl,
  });

  final String id;
  final String? description;
  final String? displayName;
  final String? pictureUrl;

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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'displayName': displayName,
      'pictureUrl': pictureUrl,
    };
  }
}
