import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

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
