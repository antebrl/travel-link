import 'dart:io';

import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

class ApiActivity {
  ApiActivity({
    required this.name,
    required this.categories,
    required this.location,
    this.wikidataUrl,
    this.wikidataId,
    this.openingHours,
    this.website,
    this.placeId,
    this.imagePaths = const [],
    this.description = '',
    this.continentType = ContinentType.none,
    this.image,
  });

  final String name;

  List<String> categories;

  final String? wikidataUrl;
  final String? wikidataId;

  final String? openingHours;
  final String? website;
  final String? placeId;

  List<String> imagePaths;
  String description;

//from normal activity
  ContinentType continentType;
  final PlaceLocation location;
  File? image; // Optional Image

  static ApiActivity? fromMap(Map<String, dynamic> map) {
    if (!(map.containsKey('name') &&
            map.containsKey('country') &&
            map.containsKey('country_code') &&
            map.containsKey('city') &&
            map.containsKey('lon') &&
            map.containsKey('lat') &&
            map.containsKey('formatted')) ||
        map['name'] is int) {
      return null;
    }

    String? wikidataUrl, wikidataId;
    if (map.containsKey('wiki_and_media') &&
        (map['wiki_and_media'] as Map<String, dynamic>)
            .containsKey('wikidata')) {
      wikidataId = map['wiki_and_media']['wikidata'] as String;
      wikidataUrl =
          'https://www.wikidata.org/w/api.php?action=wbgetentities&ids=$wikidataId&format=json&props=descriptions|claims';
    }

    return ApiActivity(
      name: map['name'] as String,
      location: PlaceLocation(
        lat: map['lat'] as double,
        lon: map['lon'] as double,
        city: map['city'] as String,
        country: map['country'] as String,
        formatted: map['formatted'] as String,
        countryCode: map['country_code'] as String,
      ),
      categories: (map['categories'] as List<dynamic>).cast<String>(),
      wikidataUrl: wikidataUrl,
      wikidataId: wikidataId,
      openingHours: map['opening_hours'] as String?,
      website: map['website'] as String?,
      placeId: map['place_id'] as String?,
    );
  }
}

Set<String> activityTypes = {
  'entertainment',
  'activity',
  'catering',
  'education',
  'leisure',
  'natural',
  'tourism',
  'religion',
  'camping',
  'sport',
  'accommodation',
};

class PlaceLocation {
  const PlaceLocation({
    required this.lat,
    required this.lon,
    //required this.street,
    required this.city,
    required this.country,
    required this.formatted,
    required this.countryCode,
  });

  final double lat;
  final double lon;
  //final String street;
  final String city;
  final String country;
  final String formatted;
  final String countryCode;
}
