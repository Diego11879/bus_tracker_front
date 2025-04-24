import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationMarker extends StatelessWidget {
  final LatLng position;

  const LocationMarker({required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          width: 40,
          height: 40,
          point: position,
          child: const Icon(Icons.directions_bus, size: 40, color: Colors.blue),
        ),
      ],
    );
  }
}
