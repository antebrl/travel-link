import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ApiActivitiesDetailsScreen extends StatelessWidget {
  const ApiActivitiesDetailsScreen({required this.activity, super.key});

  final ApiActivity activity;

  FlutterMap _createMap(double latitude, double longitude) {
    return FlutterMap(
      key: UniqueKey(),
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude),
        // interactionOptions: const InteractionOptions(
        //   flags: InteractiveFlag.none,
        // ),
        // Disable all user interactions
      ),
      children: [
        openStreetMapTileLater,
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(latitude, longitude),
              child: const Icon(
                Icons.location_pin,
                size: 40,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  TileLayer get openStreetMapTileLater => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exaple',
      );

  @override
  Widget build(BuildContext context) {
    Widget content;

    content = _createMap(activity.location.lat, activity.location.lon);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activity.name,
        ),
      ),
      body: Stack(
        children: [
          // Bild oben auf der Seite
          Positioned(
            top: -3,
            left: 0,
            right: 0,
            height: 250, // Höhe des Bildes anpassen
            child: activity.imagePaths.isEmpty
                ? Image.file(
                    activity.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    activity.imagePaths[0],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
          ),

          // Weiße Fläche mit abgerundeten Ecken und Schatten
          Positioned(
            top: 200, // Startpunkt für die weiße Fläche
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Explore: ${activity.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: CustomColors.primary,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              if (activity.description.isEmpty) ...[
                                Text(
                                  'Description: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: CustomColors.primary),
                                ),
                                Text(
                                  activity.description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                              const SizedBox(height: 10),
                              if (activity.openingHours != null) ...[
                                Text(
                                  'Opening hours: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: CustomColors.primary),
                                ),
                                Text(
                                  activity.openingHours!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                              const SizedBox(height: 10),
                              Text(
                                'Location: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: CustomColors.primary),
                              ),
                              Text(
                                activity.location.formatted,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                    color:
                                        CustomColors.primary.withOpacity(0.5),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: content,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Categories: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: CustomColors.primary),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceAround,
                                  spacing: 10.0, // Abstand zwischen den Chips
                                  runSpacing:
                                      5.0, // Abstand zwischen den Zeilen
                                  children: activity.categories.map((category) {
                                    return Chip(
                                      side: const BorderSide(
                                          color: CustomColors.primary),
                                      backgroundColor: CustomColors.white,
                                      labelStyle: const TextStyle(
                                          color: CustomColors.primary),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      label: Text(
                                        category,
                                        style: const TextStyle(
                                            color: CustomColors.primary),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
