import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/route_model.dart';

class RouteService {
  static Future<RouteModel> loadRouteFromAssets(String path) async {
    final String jsonStr = await rootBundle.loadString(path);
    final Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return RouteModel.fromGeoJson(jsonMap);
  }
}
