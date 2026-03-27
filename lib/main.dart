
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workmanager/workmanager.dart';

import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/models/heart_metrics_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/services/heart_rate_service.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/style/app_style.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();



// Register periodic background task
await Workmanager().registerPeriodicTask(
"daily-health-sync", // Unique ID
"syncHealthDataTask", // Task name
frequency: const Duration(minutes: 15),
constraints: Constraints(
requiresBatteryNotLow: true,
),
);

final database = db.AppDatabase();

// Initialize notifications
await NotificationService.init();

// Setup health repository
final healthRepo = HealthRepository(database: database);
await healthRepo.requestPermissions();

// Preload health data
await Future.wait([
healthRepo.getLastNightSleep(),
healthRepo.getSteps(),
healthRepo.getHeartRateVariabilityRate(),
healthRepo.getHeartRateList(),
]);

// System UI styling
SystemChrome.setSystemUIOverlayStyle(
const SystemUiOverlayStyle(
statusBarColor: Colors.transparent,
systemNavigationBarColor: Colors.transparent,
systemNavigationBarIconBrightness: Brightness.dark,
systemNavigationBarDividerColor: Colors.transparent,
),
);

runApp(const ElarosApp());
}

class ElarosApp extends StatelessWidget {
const ElarosApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp.router(
title: 'My Flutter App',
  theme: AppTheme.light(),
routerConfig: router,
);
}
}

