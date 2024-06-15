import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

/*
Diese Datei existiert um die Variable Way zwischen den Marker Funktionen in 
points.dart und der Karte in trip_map_screen.dart zu organisieren. Dies muss
gemacht werden da NUR die Karte den Weg aus Polynomen anzeigen kann, die 
Funktionen jedoch die einzigen sind die die Berechnung machen koennen.
*/
class SharedState extends ChangeNotifier {
  List<LatLng> _way = [];

  List<LatLng> get way => _way;

  set way(List<LatLng> newWay) {
    _way = newWay;
    notifyListeners();
  }
}

final sharedStateProvider = ChangeNotifierProvider<SharedState>((ref) {
  return SharedState();
});
