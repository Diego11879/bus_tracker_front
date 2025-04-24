import 'package:bus_tracker_test001/controllers/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/route_selection_screen.dart';
import 'controllers/location_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => RouteController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map App',
      home: RouteSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
