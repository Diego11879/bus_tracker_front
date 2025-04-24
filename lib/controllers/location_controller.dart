import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationController extends ChangeNotifier {
  LatLng? _currentPosition;
  Stream<Position>? _positionStream;

  LatLng? get currentPosition => _currentPosition;

  Future<void> initialize() async {
    final hasPermission = await LocationService.checkAndRequestPermission();
    if (!hasPermission) throw Exception("Sin permisos de ubicación");

    final position = await LocationService.getCurrentPosition();
    _currentPosition = LatLng(position.latitude, position.longitude);
    notifyListeners();

    _positionStream = LocationService.getPositionStream();
    _positionStream!.listen((Position pos) {
      _currentPosition = LatLng(pos.latitude, pos.longitude);
      notifyListeners();
    });
  }
}
