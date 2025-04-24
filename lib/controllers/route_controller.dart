import 'package:flutter/material.dart';
import '../models/route_model.dart';
import '../services/route_service.dart';

class RouteController extends ChangeNotifier {
  RouteModel? _route;

  RouteModel? get route => _route;

  Future<void> loadRoute(String path) async {
    _route = await RouteService.loadRouteFromAssets(path);
    notifyListeners();
  }
}
