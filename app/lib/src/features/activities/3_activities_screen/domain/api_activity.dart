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
    this.wikipediaUrl,
    this.openingHours,
    this.website,
    this.placeId,
    this.imagePath = '',
  });

  final String name;
  final String country;
  final String countryCode;
  final String city;
  final double lon;
  final double lat;
  final String formatted;

  final List<String> categories;

  final String? wikipediaUrl;

  final String? openingHours;
  final String? website;
  final String? placeId;

  String imagePath;

  static ApiActivity? fromMap(Map<String, dynamic> map) {
    if (!(map.containsKey('name') &&
            map.containsKey('country') &&
            map.containsKey('country_code') &&
            map.containsKey('city') &&
            map.containsKey('lon') &&
            map.containsKey('lat') &&
            map.containsKey('formatted')
        // Don´t load activities with no wiki_and_media entry
        // &&
        // map.containsKey('wiki_and_media') &&
        // (map['wiki_and_media'] as Map<String, dynamic>)
        //     .containsKey('wikipedia')
        ) ||
        map['name'] is int) {
      return null;
    }

    String? wikipediaUrl;
    if (map.containsKey('wiki_and_media') &&
        (map['wiki_and_media'] as Map<String, dynamic>)
            .containsKey('wikipedia')) {
      final wikipediaData = map['wiki_and_media']!['wikipedia']!.split(':');
      wikipediaUrl =
          'https://${wikipediaData[0]}.wikipedia.org/w/api.php?action=query&titles=${wikipediaData[1].replaceAll(' ', '_')}&prop=pageimages&format=json&pithumbsize=1000';
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
      wikipediaUrl: wikipediaUrl,
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
