class ApiActivity {
  ApiActivity({
    required this.name,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.lon,
    required this.lat,
    required this.formatted,
    required this.categories,
    this.wikidataUrl,
    this.wikidataId, 
    this.openingHours,
    this.website,
    this.placeId,
    this.imagePaths = const [],
    this.description = '',
  });

  final String name;
  final String country;
  final String countryCode;
  final String city;
  final double lon;
  final double lat;
  final String formatted;

  final List<String> categories;

  final String? wikidataUrl;
  final String? wikidataId;

  final String? openingHours;
  final String? website;
  final String? placeId;

  List<String> imagePaths;
  String description;

  static ApiActivity? fromMap(Map<String, dynamic> map) {
    if (!(map.containsKey('name') &&
            map.containsKey('country') &&
            map.containsKey('country_code') &&
            map.containsKey('city') &&
            map.containsKey('lon') &&
            map.containsKey('lat') &&
            map.containsKey('formatted')
        ) ||
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
      country: map['country'] as String,
      countryCode: map['country_code'] as String,
      city: map['city'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
      formatted: map['formatted'] as String,
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
