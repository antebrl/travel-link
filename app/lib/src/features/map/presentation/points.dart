import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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

Marker createLocationMarker(LatLng position) {
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
          icon: Icon(Icons.local_activity, color: color),
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
