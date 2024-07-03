import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/map/presentation/exchanged_way.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'marker_creation.dart';

LatLng latLng1 = const LatLng(49.690025, 8.463075);
LatLng latLng2 = const LatLng(49.691430, 8.463370);
LatLng latLng3 = const LatLng(49.688520, 8.462580);

List<LatLng> locations = [latLng1, latLng2, latLng3];

bool displayRoute = false;

class TripMapScreen extends ConsumerStatefulWidget {
  const TripMapScreen({
    required this.participants,
    required this.destination,
    super.key,
  });

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
  List<Marker> activitiesMarker = [];
  bool activitiesFetched = false;

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

  Future<void> _fetchActivities() async {
    final CollectionReference activities =
        FirebaseFirestore.instance.collection('activities');
    final List<Marker> allActivitiesInDB = [];

    final QuerySnapshot querySnapshot = await activities.limit(100).get();

    for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
      final Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      final List<dynamic> categories = data['categories'] as List<dynamic>;
      final String description = data['description'] as String;
      final String name = data['name'] as String;
      final Map<String, dynamic> location =
          data['location'] as Map<String, dynamic>;
      final double lati = location['lat'] as double;
      final double long = location['lon'] as double;
      final Activity associatedActivity = Activity(
        name: name,
        categories: ['categories'],
        location: PlaceLocation(
          lat: lati,
          lon: long,
          city: 'city',
          country: 'country',
          formatted: 'formatted',
          countryCode: 'countryCode',
        ),
      );

      allActivitiesInDB.add(
        await _createMarkerBasedOnDescription(
          categories,
          description,
          name,
          lati,
          long,
          associatedActivity,
        ),
      );
    }

    setState(() {
      activitiesMarker = allActivitiesInDB;
      activitiesFetched = true;
    });
  }

  Future<Marker> _createMarkerBasedOnDescription(
    List<dynamic> categories,
    String description,
    String name,
    double latitude,
    double longitude,
    Activity associatedActivity,
  ) async {
    final typeOfActivity = categories[0];
    final LatLng positionOfActivity = LatLng(latitude, longitude);

    switch (typeOfActivity) {
      case ('natural'):
        return createNatureActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('sport'):
        return createSportsActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('accommodation'):
        return createAccomodationActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('camping'):
        return createCampingActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('entertainment'):
        return createEntertainmentActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('tourism'):
        return createTourismeActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('activity'):
        return createActivActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('catering'):
        return createCateringActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('education'):
        return createEducationActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('leisure'):
        return createLeisureActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      case ('religion'):
        return createReligousActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
      default:
        return createLeisureActivity(
          positionOfActivity,
          name,
          description,
          ref,
          associatedActivity,
        );
    }
  }

  Future<void> _postPosition(LatLng position) async {
    final repo = ref.read(accountControllerProvider.notifier);
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
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0.1,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.pictureUrl ?? CustomImages.defaultProfilePictureUrl,
                ),
              ),
            ),
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sharedState = ref.watch(sharedStateProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: activitiesFetched
                ? FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        widget.destination.lat ?? 49.8728,
                        widget.destination.lon ?? 8.6512,
                      ),
                      minZoom: 3,
                      maxZoom: 18,
                      initialZoom: 8,
                    ),
                    // ignore: deprecated_member_use
                    nonRotatedChildren: [
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => launchUrl(
                              Uri.parse(
                                'https://openstreetmap.org/copyright',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                      MarkerLayer(
                        markers: userMarkers + activitiesMarker,
                      ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
