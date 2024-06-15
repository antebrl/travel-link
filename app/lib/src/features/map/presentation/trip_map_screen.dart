import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/map/presentation/exchanged_way.dart';
import 'package:url_launcher/url_launcher.dart';

import 'points.dart';

LatLng pointOfView = const LatLng(49.8728, 8.6512);
List<Marker> listOfAllUsers = [
  createUserMarker(const LatLng(49.713088, 8.472136)),
  createUserMarker(const LatLng(49.714890, 8.472440)),
  createUserMarker(const LatLng(49.712380, 8.472030)),
];

// Define LatLng instances without const
LatLng latLng1 = const LatLng(49.690025, 8.463075);
LatLng latLng2 = const LatLng(49.691430, 8.463370);
LatLng latLng3 = const LatLng(49.688520, 8.462580);

// List of LatLng instances
List<LatLng> locations = [latLng1, latLng2, latLng3];

// Initialize listOfAllActivities with createLocationMarker function

bool displayRoute = false;

List<Marker> createDummyLocationMarkers(WidgetRef ref) {
  List<Marker> listOfAllActivities = [];
  return listOfAllActivities = [
    createLocationMarker(LatLng(49.690025, 8.463075), ref),
    createLocationMarker(LatLng(49.691430, 8.463370), ref),
    createLocationMarker(LatLng(49.688520, 8.462580), ref),
  ];
}

class TripMapScreen extends ConsumerStatefulWidget {
  const TripMapScreen({super.key});

  @override
  ConsumerState<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends ConsumerState<TripMapScreen> {
  @override
  Widget build(BuildContext context) {
    final sharedState = ref.watch(sharedStateProvider);
    List<Marker> listOfMarkers =
        createDummyLocationMarkers(ref) + listOfAllUsers;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
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
                  ),
                  moveAnimationDuration: Duration.zero,
                  positionStream: const LocationMarkerDataStreamFactory()
                      .fromGeolocatorPositionStream(
                    stream: Geolocator.getPositionStream(
                      locationSettings: const LocationSettings(
                        accuracy: LocationAccuracy.high,
                        timeLimit: Duration(minutes: 1),
                      ),
                    ),
                  ),
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: sharedState.way,
                      color: Theme.of(context).primaryColor,
                      borderColor: Colors.deepPurple,
                      borderStrokeWidth: 5,
                    ),
                  ],
                ),
                MarkerLayer(markers: listOfMarkers),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
