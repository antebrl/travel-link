import 'dart:io';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

class Activity {
  Activity({
    required this.name,
    required this.continentType,
    required this.description,
    required this.imagePath,
    required this.location,
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
