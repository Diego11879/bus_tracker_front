import 'package:bus_tracker_test001/widgets/location_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import '../controllers/location_controller.dart';
import '../controllers/route_controller.dart';

class MapScreen extends StatefulWidget {
  final String routePath;

  const MapScreen({super.key, required this.routePath});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapController = MapController();

  @override
  void initState() {
    super.initState();

    // Inicializar ubicación
    final locationCtrl = Provider.of<LocationController>(
      context,
      listen: false,
    );
    locationCtrl.initialize().catchError((e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    });

    // Cargar ruta desde archivo
    final routeCtrl = Provider.of<RouteController>(context, listen: false);
    routeCtrl.loadRoute(widget.routePath);
  }

  void _centerMapOnUser() {
    final locationCtrl = Provider.of<LocationController>(
      context,
      listen: false,
    );
    final pos = locationCtrl.currentPosition;

    if (pos != null) {
      mapController.move(pos, mapController.camera.zoom);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ubicación no disponible')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationController, RouteController>(
      builder: (context, locationCtrl, routeCtrl, _) {
        final pos = locationCtrl.currentPosition;
        final route = routeCtrl.route;

        if (pos == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(route?.name ?? 'Mapa de Ruta'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(initialCenter: pos, initialZoom: 16),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  if (route != null)
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: route.coordinates,
                          strokeWidth: 4.0,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  LocationMarker(position: pos),
                ],
              ),
              Positioned(
                top: 20,
                right: 20,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  onPressed: _centerMapOnUser,
                  child: const Icon(Icons.my_location, color: Colors.cyan),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
