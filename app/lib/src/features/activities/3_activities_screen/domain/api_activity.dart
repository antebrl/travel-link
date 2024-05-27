import 'package:equatable/equatable.dart';

class ApiActivity extends Equatable {
  const ApiActivity({
    required this.name,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.lon,
    required this.lat,
    required this.formatted,
    required this.categories,
    required this.isWikiAndMedia,
    this.wikiData, 
    this.wikipediaName,
    this.openingHours,
    this.website,
    this.placeId,
  });

  final String name;
  final String country;
  final String countryCode;
  final String city;
  final double lon;
  final double lat;
  final String formatted;

  final List<String> categories;
  final bool isWikiAndMedia; //will load picture from wikipedia

  final String? wikipediaName;
  final String? wikiData;

  final String? openingHours;
  final String? website;
  final String? placeId;

  @override
  List<Object?> get props => [
        name,
        country,
        countryCode,
        city,
        lon,
        lat,
        formatted,
        categories,
        isWikiAndMedia,
        wikipediaName,
        wikiData,
        openingHours,
        website,
        placeId,
      ];

  @override
  bool get stringify => true;

  factory ApiActivity.fromMap(Map<String, dynamic> map) {
    return ApiActivity(
      name: map['name'] as String,
      country: map['country'] as String,
      countryCode: map['country_code'] as String,
      city: map['city'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
      formatted: map['formatted'] as String,
      categories: map['categories'] as List<String>,
      isWikiAndMedia: (map['details'] as List<String>).contains('details.wiki_and_media'),
      wikiData: map['wiki_and_media']?['wikidata'] as String?,
      wikipediaName: map['wiki_and_media']?['wikipedia'] as String?,
      openingHours: map['opening_hours'] as String?,
      website: map['website'] as String?,
      placeId: map['place_id'] as String?,
    );
  }
}
