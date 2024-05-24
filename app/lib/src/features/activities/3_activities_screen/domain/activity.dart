import 'dart:io';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

enum ActivityType {
  sight,
  culture,
  eatAndDrink,
  shopping,
  nightlife,
  sports,
  nature,
  education,
}

class Activity {
  Activity({
    required this.name,
    required this.continentType,
    required this.description,
    required this.imagePath,
    required this.location,
    this.types, // Multiple ActivityTypes
    this.image,
    this.isUserCreated = false,
  });

  final String name;
  final ContinentType continentType;
  final String description;
  String imagePath;

  File? image; // Optional Image
  final PlaceLocation location;
  final bool isUserCreated;

  //Später zu final machen + required
  List<ActivityType>? types; // List of ActivityTypes
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.street,
    required this.city,
    required this.country,
  });

  final double latitude;
  final double longitude;
  final String street;
  final String city;
  final String country;
}
