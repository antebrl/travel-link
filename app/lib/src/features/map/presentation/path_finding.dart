import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

Future<List<LatLng>> calculateRoute(
    String mobility, Coordinates startPunkt, Coordinates endPunkt) async {
  List<LatLng> way = [];
  bool displayRoute = false;
  final PolylinePoints polylinePoints = PolylinePoints();

  displayRoute = false;
  final url =
      Uri.parse('https://api.openrouteservice.org/v2/directions/$mobility');
  const String apiKey =
      '5b3ce3597851110001cf624879cd55beab9a4ae89e0ff1150c5ef718';

  final headers = {
    'Accept':
        'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
    'Authorization': apiKey,
    'Content-Type': 'application/json; charset=utf-8',
  };

  final request = {
    'coordinates': [
      [startPunkt.longitude, startPunkt.latitude],
      [endPunkt.longitude, endPunkt.latitude],
    ],
    'maneuvers': 'true',
  };

  final response =
      await http.post(url, headers: headers, body: jsonEncode(request));

  final Map jsonData = jsonDecode(response.body) as Map;

  // Check if the Coordinates are Invalid,
  // Should they be invalid the Map that is returned containes 2 and not 3 elements
  if (jsonData.containsKey('error')) {
    return way;
  }

  final features = jsonData['routes'][0];
  final String geometry = features['geometry'] as String;
  final List<PointLatLng> result = polylinePoints.decodePolyline(geometry);

  for (int i = 0; i < result.length; i++) {
    final LatLng newPoint = LatLng(result[i].latitude, result[i].longitude);
    way.add(newPoint);
  }
  return way;
}

Future<LatLng> getCurrentLocation() async {
  try {
    // Ensure the location services are enabled
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Get the current position
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Return the position as a LatLng
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    // Handle any errors here
    throw Exception('Could not get the current location: $e');
  }
}
