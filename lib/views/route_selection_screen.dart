import 'package:flutter/material.dart';
import 'map_screen.dart';

class RouteSelectionScreen extends StatelessWidget {
  const RouteSelectionScreen({super.key});

  final List<Map<String, String>> availableRoutes = const [
    {
      "name": "MB72 A - San José",
      "file": "lib/assets/routes/MB72_A_To_SanJose.json",
    },
    {
      "name": "MB72 B - Retorno",
      "file": "lib/assets/routes/MB72_B_Return.json",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selecciona una ruta")),
      body: ListView.builder(
        itemCount: availableRoutes.length,
        itemBuilder: (context, index) {
          final route = availableRoutes[index];
          return ListTile(
            leading: const Icon(Icons.alt_route),
            title: Text(route["name"]!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MapScreen(routePath: route["file"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
