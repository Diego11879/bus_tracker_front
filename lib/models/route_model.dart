import 'package:latlong2/latlong.dart';

class RouteModel {
  final String name;
  final List<LatLng> coordinates;

  RouteModel({required this.name, required this.coordinates});

  factory RouteModel.fromGeoJson(Map<String, dynamic> json) {
    final feature = json['features'][0];
    final coords = feature['geometry']['coordinates'] as List;

    final points =
        coords.map<LatLng>((coord) {
          return LatLng(coord[1], coord[0]);
        }).toList();

    return RouteModel(
      name: feature['properties']['name'] ?? 'Ruta sin nombre',
      coordinates: points,
    );
  }
}
