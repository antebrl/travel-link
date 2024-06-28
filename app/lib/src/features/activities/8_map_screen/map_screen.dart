import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/map/presentation/exchanged_way.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'marker_creation.dart';

class MapScreenWithActivities extends ConsumerStatefulWidget {
  const MapScreenWithActivities({
    required this.fetchedApiActivities,
    required this.fetchedUserActivities,
    super.key,
  });

  final Future<List<Activity>> fetchedApiActivities;
  final Future<List<Activity>> fetchedUserActivities;

  @override
  _MapScreenWithActivitiesState createState() =>
      _MapScreenWithActivitiesState();
}

class _MapScreenWithActivitiesState
    extends ConsumerState<MapScreenWithActivities> {
  LatLng firstView = LatLng(49.8728, 8.6512); // Initial center
  List<Marker> allActivityMarkers = [];
  bool activitiesFetched = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: combineFutureLists(
          widget.fetchedApiActivities, widget.fetchedUserActivities),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: CustomColors.primary,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No activities found'));
        } else {
          final List<Activity> activities = snapshot.data!;
          for (int i = 0; i < activities.length; i++) {
            Marker createdActivity;
            final List<String> categories = activities[i].categories;
            final String typeOfActivity = categories[0];
            final String description = activities[i].description;
            final String name = activities[i].name;
            final double lat = activities[i].location.lat;
            final double long = activities[i].location.lon;
            final LatLng position = LatLng(lat, long);
            firstView = position; // Update firstView

            switch (typeOfActivity) {
              case 'natural':
                createdActivity =
                    createNatureActivity(position, name, description, ref);
                break;
              case 'sport':
                createdActivity =
                    createSportsActivity(position, name, description, ref);
                break;
              case 'accommodation':
                createdActivity = createAccomodationActivity(
                    position, name, description, ref);
                break;
              case 'camping':
                createdActivity =
                    createCampingActivity(position, name, description, ref);
                break;
              case 'entertainment':
                createdActivity = createEntertainmentActivity(
                    position, name, description, ref);
                break;
              case 'tourism':
                createdActivity =
                    createTourismeActivity(position, name, description, ref);
                break;
              case 'activity':
                createdActivity =
                    createActivActivity(position, name, description, ref);
                break;
              case 'catering':
                createdActivity =
                    createCateringActivity(position, name, description, ref);
                break;
              case 'education':
                createdActivity =
                    createEducationActivity(position, name, description, ref);
                break;
              case 'leisure':
                createdActivity =
                    createLeisureActivity(position, name, description, ref);
                break;
              case 'religion':
                createdActivity =
                    createReligousActivity(position, name, description, ref);
                break;
              default:
                createdActivity = createEntertainmentActivity(
                    position, name, description, ref);
                break;
            }
            allActivityMarkers.add(createdActivity);
            activitiesFetched = true;
          }

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
                            center: firstView, // Use firstView here
                            minZoom: 3,
                            maxZoom: 18,
                            zoom: 8,
                          ),
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
                                accuracyCircleColor:
                                    Colors.green.withOpacity(0.1),
                                headingSectorColor:
                                    Colors.green.withOpacity(0.8),
                              ),
                              moveAnimationDuration: Duration.zero,
                              positionStream:
                                  const LocationMarkerDataStreamFactory()
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
                              markers: allActivityMarkers,
                            ),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<List<T>> combineFutureLists<T>(
      Future<List<T>> futureList1, Future<List<T>> futureList2) async {
    List<T> list1 = await futureList1;
    //List<T> list2 = await futureList2;
    return [
      ...list1, /*...list2*/
    ];
  }
}
