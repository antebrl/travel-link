import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  const Destination({
    required this.formatted,
    this.placeId,
    this.lon,
    this.lat,
    this.country,
  });

  final String formatted;
  final String? placeId;
  final double? lon;
  final double? lat;
  final String? country;

  @override
  List<Object?> get props => [
        formatted,
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
      placeId: value['place_id'] as String?,
      lon: value['lon'] as double?,
      lat: value['lat'] as double?,
      country: value['country'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formatted': formatted,
      'place_id': placeId,
      'lon': lon,
      'lat': lat,
      'country': country,
    };
  }
}
