import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/models/heart_metrics_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/services/heart_rate_service.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:workmanager/workmanager.dart';
import 'background/steps_sync_task.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';

Future<void> _registerBackgroundTask() async {
  await Workmanager().initialize(stepSyncTaskCallbackDispatcher);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);

  // Use Periodic Task for 24-hour intervals
  await Workmanager().registerPeriodicTask(
    "daily-health-sync", // Unique Name
    "syncHealthDataTask", // Task Name
    frequency: const Duration(minutes: 15),
    constraints: Constraints(
      requiresBatteryNotLow: true, // Save battery life
    ),
  );

  final database = db.AppDatabase();

  await NotificationService.init();

  final healthRepo = HealthRepository(database: database);
  await healthRepo.requestPermissions();

  await Future.wait([
    healthRepo.getLastNightSleep(),
    healthRepo.getSteps(),
    healthRepo.getHeartRateVariabilityRate(),
    healthRepo.getHeartRateList(),
  ]);

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
      routerConfig: router,

      theme: AppTheme.light(),
    );
  }
}
