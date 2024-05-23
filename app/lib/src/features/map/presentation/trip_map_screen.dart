import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

LatLng pointOfView = const LatLng(49.8728, 8.6512);

Future<LatLng> getCurrentLocation() async {
  try {
    // Ensure the location services are enabled
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Return the position as a LatLng
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    // Handle any errors here
    throw Exception('Could not get the current location: $e');
  }
}

class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 219, 226),
        //title: Text('Places of Worship for the God Emperor'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3, // Increase this flex to allocate more space to the map
            child: FlutterMap(
              options: MapOptions(
                initialCenter: pointOfView,
                minZoom: 3,
                maxZoom: 18,
                initialZoom: 12,
              ),
              nonRotatedChildren: [
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(
                          Uri.parse('https://openstreetmap.org/copyright')),
                    ),
                  ],
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                CurrentLocationLayer(
                  style: LocationMarkerStyle(
                    marker: const DefaultLocationMarker(
                      color: Colors.red,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    markerSize: const Size.square(35),
                    accuracyCircleColor: Colors.green.withOpacity(0.1),
                    headingSectorColor: Colors.green.withOpacity(0.8),
                    headingSectorRadius: 60,
                  ),
                  moveAnimationDuration: Duration.zero,
                  positionStream: const LocationMarkerDataStreamFactory()
                      .fromGeolocatorPositionStream(
                    stream: Geolocator.getPositionStream(
                      locationSettings: const LocationSettings(
                        accuracy: LocationAccuracy.high,
                        distanceFilter: 0,
                        timeLimit: Duration(minutes: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
