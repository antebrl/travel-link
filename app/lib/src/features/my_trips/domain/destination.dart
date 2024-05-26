import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  const Destination({
    required this.formatted,
    required this.type,
    required this.placeId,
    required this.lon,
    required this.lat,
    required this.country,
  });

  final String formatted;
  final String type;
  final String placeId;
  final String lon;
  final String lat;
  final String country;

  @override
  List<Object?> get props => [
        formatted,
        type,
        placeId,
        lon,
        lat,
        country,
      ];

  @override
  bool get stringify => true;

  factory Destination.fromMap(Map<dynamic, dynamic> value) {
    return Destination(
      formatted: value['formatted'] as String,
      type: value['result_type'] as String,
      placeId: value['place_id'] as String,
      lon: value['lon'] as String,
      lat: value['lat'] as String,
      country: value['country'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formatted': formatted,
      'result_type': type,
      'place_id': placeId,
      'lon': lon,
      'lat': lat,
      'country': country,
    };
  }
}
