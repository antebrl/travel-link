import 'dart:core';

import 'package:flutter_geocoder/geocoder.dart';
import 'package:latlong2/latlong.dart';

LatLng convertCoordinatesToLatLng(Coordinates element) {
  return LatLng(element.longitude!, element.longitude!);
}

Coordinates convertLatLngToCoordinates(LatLng element) {
  return Coordinates(element.latitude, element.longitude);
}
