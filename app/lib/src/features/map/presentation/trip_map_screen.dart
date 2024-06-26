import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/map/presentation/exchanged_way.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'marker_creation.dart';

//LatLng pointOfView = const LatLng(49.8728, 8.6512);
// List<Marker> listOfAllUsers = [
//   createUserMarker(const LatLng(49.713088, 8.472136)),
//   createUserMarker(const LatLng(49.714890, 8.472440)),
//   createUserMarker(const LatLng(49.712380, 8.472030)),
// ];

// Define LatLng instances without const
LatLng latLng1 = const LatLng(49.690025, 8.463075);
LatLng latLng2 = const LatLng(49.691430, 8.463370);
LatLng latLng3 = const LatLng(49.688520, 8.462580);

// List of LatLng instances
List<LatLng> locations = [latLng1, latLng2, latLng3];

// Initialize listOfAllActivities with createLocationMarker function

bool displayRoute = false;

List<Marker> createDummyLocationMarkers(WidgetRef ref) {
  // ignore: unused_local_variable
  List<Marker> listOfAllActivities = [];
  return listOfAllActivities = [
    createLeisureActivity(const LatLng(49.690025, 8.463075), ref),
    createReligousActivity(const LatLng(49.691430, 8.463370), ref),
    createNatureActivity(const LatLng(49.688520, 8.462580), ref),
    createSportsActivity(const LatLng(49.71, 8.5), ref),
    createActivActivity(const LatLng(49.73, 8.6), ref),
    createCampingActivity(const LatLng(49.75, 8.7), ref),
  ];
}

class TripMapScreen extends ConsumerStatefulWidget {
  const TripMapScreen(
      {required this.participants, required this.destination, super.key});

  final List<String> participants;
  final Destination destination;

  Future<List<UserAccount>> _fetchParticipants(WidgetRef ref) async {
    final currentUserId = ref.read(firebaseAuthProvider).currentUser?.uid;
    final List<UserAccount> users = [];
    for (int i = 0; i < participants.length; i++) {
      final user = await ref.read(FetchUserProvider(participants[i]).future);
      if (user != null && user.id != currentUserId && user.position != null) {
        users.add(user);
      }
    }
    return users;
  }

  @override
  ConsumerState<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends ConsumerState<TripMapScreen> {
  LatLng? _lastPosition;
  List<Marker> userMarkers = [];

  @override
  void initState() {
    super.initState();
    _startLocationUpdates();
    _fetchAndDisplayParticipants();
    _fetchActivities();
  }

  void _startLocationUpdates() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 500,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) async {
      if (!mounted) return;
      final currentLatLng = LatLng(position.latitude, position.longitude);
      // Manually handle the distance filter
      if (_lastPosition == null ||
          Geolocator.distanceBetween(
                position.latitude,
                position.longitude,
                _lastPosition!.latitude,
                _lastPosition!.longitude,
              ) >
              500) {
        _lastPosition = currentLatLng;
        await _postPosition(currentLatLng);
      }
    });
  }

  Future<dynamic> _fetchActivities() async {
    // Reference to the Firestore collection
    CollectionReference activities =
        FirebaseFirestore.instance.collection('activities');

    // Query the collection with a limit of 100 documents
    QuerySnapshot querySnapshot = await activities.limit(100).get();

    // Process the query results
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      final Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      final String documentId = doc.id;
      final List<dynamic> categories = data['categories'] as List<dynamic>;
      final String creatorId = data['creatorId'] as String;
      final String description = data['description'] as String;
      final List<dynamic> imagePaths = data['imagePaths'] as List<dynamic>;
      final Map<String, dynamic> location =
          data['location'] as Map<String, dynamic>;
      final lati = location['lat'];
      final long = location['lon'];

      print('Categories: $categories');
      print('Description: $description');
      print('Coordinates: $long , $lati');
    }
  }

  Future<void> _postPosition(LatLng position) async {
    final repo = ref.read(accountControllerProvider.notifier);
    print('Position: $position');
    await repo.updateUserData(data: {'position': position.toJson()});
  }

  Future<void> _fetchAndDisplayParticipants() async {
    final users = await widget._fetchParticipants(ref);
    setState(() {
      userMarkers = users.map((user) {
        return Marker(
          width: 40,
          height: 40,
          point: LatLng(user.position!.latitude, user.position!.longitude),
          child: GestureDetector(
            onTap: () {
              print('Marker tapped');
              //Show public user profile
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0.1,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    user.pictureUrl ?? CustomImages.defaultProfilePictureUrl),
              ),
            ),
          ),
        );
      }).toList();
    });
  }
  //TODO: get all activities for the activity

  //TODO: Modify the Widget that is displayed if an activity is clicked to reference more informations that are stored

  //TODO: Soft the different activities to and cretae the activities markers acordingly.

  @override
  Widget build(BuildContext context) {
    final sharedState = ref.watch(sharedStateProvider);
    final List<Marker> listOfMarkers =
        createDummyLocationMarkers(ref) + userMarkers;

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
                initialCenter: LatLng(
                  widget.destination.lat ?? 49.8728,
                  widget.destination.lon ?? 8.6512,
                ),
                minZoom: 3,
                maxZoom: 18,
                initialZoom: 12,
              ),
              // ignore: deprecated_member_use
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
