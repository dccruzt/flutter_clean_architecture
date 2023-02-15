import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'core/design_system/app_theme.dart';
import 'di/dependency_injection.dart';
import 'ui/page/application_detail_page.dart';
import 'ui/page/applications_page.dart';
import 'ui/page/vehicles_page.dart';

void main() {
  _setupDependencies();
  runApp(const MyApp());
}

Future<void> _setupDependencies() async {
  await initServiceLocator();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: appThemeData,
      home: const ApplicationsPage(),
      routes: {
        AppRoutes.applicationDetail: (context) => const ApplicationDetailPage(),
        AppRoutes.vehicleSelection: (context) => const VehiclesPage(),
      },
    );
  }
}
