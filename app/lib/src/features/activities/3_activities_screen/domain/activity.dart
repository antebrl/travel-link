import 'dart:io';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';

class Activity {
  Activity(
      {required this.name,
      required this.street,
      required this.country,
      required this.continentType,
      required this.description,
      required this.imageAssetPath,
      required this.city,
      this.image,
      required this.location});

  final String name;
  final String street;
  final String country;
  final String city;
  final ContinentType continentType;
  final String description;
  final String imageAssetPath;
  File? image; // Optional Image
  final PlaceLocation location;
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}
