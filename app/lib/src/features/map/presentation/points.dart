import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'path_finding.dart';
import 'converter.dart';
import 'exchanged_way.dart';

Marker createUserMarker(LatLng position) {
  final Completer<Marker> markerCompleter = Completer<Marker>();
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Colors.purple);
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);

  Marker newMarker = Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.person, color: color),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ValueListenableBuilder<Color>(
                      valueListenable: starColorNotifier,
                      builder: (context, starColor, child) {
                        return IconButton(
                          icon: Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          onPressed: () {
                            print('Hello you.....');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );

  markerCompleter.complete(newMarker);
  return newMarker;
}

Marker createLocationMarker(LatLng position, WidgetRef ref) {
  final LatLng locationPosition = position;
  final Completer<Marker> markerCompleter = Completer<Marker>();
  final ValueNotifier<Color> colorNotifier =
      ValueNotifier<Color>(Colors.purple);
  final ValueNotifier<Color> starColorNotifier =
      ValueNotifier<Color>(Colors.grey);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  return Marker(
    point: position,
    width: 20,
    height: 20,
    child: ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, color, child) {
        return IconButton(
          icon: Icon(Icons.local_activity, color: color),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: ValueListenableBuilder<bool>(
                  valueListenable: isLoadingNotifier,
                  builder: (context, isLoading, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ValueListenableBuilder<Color>(
                          valueListenable: starColorNotifier,
                          builder: (context, starColor, child) {
                            return IconButton(
                              icon: Icon(
                                Icons.route_rounded,
                                color: starColor,
                              ),
                              onPressed: () async {
                                isLoadingNotifier.value = true;
                                print('Starting the research');
                                final LatLng currentUserLocation =
                                    await getCurrentLocation();
                                List<LatLng> route;

                                route = await calculateRoute(
                                  'cycling-regular',
                                  convertLatLngToCoordinates(
                                      currentUserLocation),
                                  convertLatLngToCoordinates(locationPosition),
                                );

                                // Update the shared state with the new route
                                ref.read(sharedStateProvider).way = route;

                                isLoadingNotifier.value = false;
                              },
                            );
                          },
                        ),
                        if (isLoading) CircularProgressIndicator(),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
