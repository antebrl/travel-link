import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      lat: 37.422,
      lon: -122.084,
      city: '',
      country: '',
      countryCode: '',
      formatted: '',
    ),
  });
  final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  final List<Marker> _markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_markers.isEmpty
            ? context.loc.pickTheLocation
            : context.loc.locationSelected),
        actions: [
          if (_markers.isNotEmpty)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(37.422, -122.084),
          onTap: (tapPos, latlng) {
            setState(
              () {
                if (_markers.isNotEmpty) _markers.clear();

                _pickedLocation = latlng;
                _markers.add(
                  Marker(
                    point: latlng,
                    child: const Icon(
                      Icons.location_on,
                      color: CustomColors.primary,
                      size: 40,
                    ),
                  ),
                );
              },
            );
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.exaple',
          ),
          if (_pickedLocation == null)
            const MarkerLayer(markers: [])
          else
            MarkerLayer(
              markers: [for (int i = 0; i < _markers.length; i++) _markers[i]],
            ),
        ],
      ),
    );
  }
}
