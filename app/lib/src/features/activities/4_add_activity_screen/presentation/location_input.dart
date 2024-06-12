import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as gecoding;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/map_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({required this.onSelectLocation, super.key});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<StatefulWidget> createState() {
    return _LocationInput();
  }
}

class _LocationInput extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  Future<void> _savePlace(double latitude, double longitude) async {
    try {
      final List<gecoding.Placemark> placemarks =
          await gecoding.placemarkFromCoordinates(latitude, longitude);
      // Extract address from placemark
      final gecoding.Placemark placemark = placemarks[0];
      final String city = placemark.locality!;
      final String country = placemark.country!;
      final String countryCode = placemark.isoCountryCode!;

      final String address =
          '${placemark.street}, ${placemark.locality}, ${placemark.country}';

      setState(() {
        _pickedLocation = PlaceLocation(
          lat: latitude,
          lon: longitude,
          city: city,
          country: country,
          formatted: address,
          countryCode: countryCode,
        );
        _isGettingLocation = false;
      });

      widget.onSelectLocation(_pickedLocation!);
    } catch (e) {
      logger.e(e);
      return;
    }
  }

  Future<void> _getCurrentLocation() async {
    final Location location = Location();

    _pickedLocation = null;

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      return;
    }

    await _savePlace(latitude, longitude);
  }

  Future<void> _selectOnMap() async {
    final pickedLocation = await Navigator.of(context)
        .push<LatLng>(MaterialPageRoute(builder: (ctx) => const MapScreen()));

    if (pickedLocation == null) {
      return;
    }

    await _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  FlutterMap _createMap(double latitude, double longitude) {
    return FlutterMap(
      key: UniqueKey(),
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude),
      ),
      children: [
        openStreetMapTileLayer,
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

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exaple',
      );

  @override
  Widget build(BuildContext context) {
    Widget content;

    content = Text(
      'Add location',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );

    if (_isGettingLocation) {
      content = const CircularProgressIndicator(
        color: CustomColors.primary,
      );
    }

    if (_pickedLocation != null) {
      content = _createMap(_pickedLocation!.lat, _pickedLocation!.lon);
    }

    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: CustomColors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: content,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.location_on),
                label: const Text('Get Current Location'),
                onPressed: _getCurrentLocation,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.map),
                label: const Text('Select on Map'),
                onPressed: _selectOnMap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
