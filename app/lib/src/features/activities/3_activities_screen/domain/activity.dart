import 'dart:io';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

class Activity {
  Activity({
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
    this.isPublic = true,
    this.isUserCreated = false,
    this.creatorId,
    this.amountVisitors,
  });

  final String name;

  final List<String> categories;

  final String? wikidataUrl;
  final String? wikidataId;

  final String? openingHours;
  final String? website;
  final String? placeId;

  List<String> imagePaths;
  String description;

  bool isPublic;
  bool isUserCreated;
  String? creatorId;

  final PlaceLocation location;

  //Only for local use#
  ContinentType continentType;
  File? image;
  String? amountVisitors;

  static Activity? fromMap(Map<String, dynamic> map) {
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

    String? wikidataUrl;
    String? wikidataId;
    if (map.containsKey('wiki_and_media') &&
        (map['wiki_and_media'] as Map<String, dynamic>)
            .containsKey('wikidata')) {
      wikidataId = map['wiki_and_media']['wikidata'] as String;
      wikidataUrl =
          'https://www.wikidata.org/w/api.php?action=wbgetentities&ids=$wikidataId&origin=*&format=json&props=descriptions|claims';
    }

    return Activity(
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

  Map<String, dynamic> toFirebaseMap() {
    return {
      'name': name,
      'categories': categories,
      'wikidataUrl': wikidataUrl,
      'wikidataId': wikidataId,
      'openingHours': openingHours,
      'website': website,
      'placeId': placeId,
      'imagePaths': imagePaths,
      'description': description,
      'isPublic': isPublic,
      'isUserCreated': isUserCreated,
      'creatorId': creatorId,
      'location': location.toMap(),
    };
  }

  // Converts a map to a Place object
  factory Activity.fromFirebaseMap(Map<String, dynamic> map) {
    return Activity(
      name: map['name'] as String,
      categories: (map['categories'] as List<dynamic>).cast<String>(),
      wikidataId: map['wikidataId'] as String?,
      openingHours: map['openingHours'] as String?,
      website: map['website'] as String?,
      placeId: map['placeId'] as String?,
      imagePaths: (map['categories'] as List<dynamic>).cast<String>(),
      description: map['description'] as String,
      isPublic: map['isPublic'] as bool,
      isUserCreated: map['isUserCreated'] as bool,
      creatorId: map['creatorId'] as String?,
      location: PlaceLocation.fromMap(map['location'] as Map<String, dynamic>),
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
    required this.city,
    required this.country,
    required this.formatted,
    required this.countryCode,
  });

  final double lat;
  final double lon;
  final String city;
  final String country;
  final String formatted;
  final String countryCode;

  // Converts a PlaceLocation object to a map
  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'city': city,
      'country': country,
      'formatted': formatted,
      'countryCode': countryCode,
    };
  }

  // Converts a map to a PlaceLocation object
  factory PlaceLocation.fromMap(Map<String, dynamic> map) {
    return PlaceLocation(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      city: map['city'] as String,
      country: map['country'] as String,
      formatted: map['formatted'] as String,
      countryCode: map['countryCode'] as String,
    );
  }
}
