import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/models/heart_metrics_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/style/app_style.dart';
import 'package:workmanager/workmanager.dart';
import 'dart:io';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      final database = db.AppDatabase();
      final healthRepo = HealthRepository(database: database);

      // Steps
      int steps = await healthRepo.getSteps();
      await healthRepo.saveSteps(steps);

      // Heart Rate and HRV
      HeartMetrics heartMetrics = await healthRepo.getHeartMetrics();
      await healthRepo.saveHeartMetrics(heartMetrics);

      // Sleep
      Sleep sleepData = await healthRepo.getLastNightSleep();
      await healthRepo.saveSleep(sleepData);

      // iOS Workaround (Manual Re-scheduling)
      if (Platform.isIOS) {
        Workmanager().registerOneOffTask(
          "daily-health-sync",
          "syncHealthDataTask",
          initialDelay: const Duration(minutes: 15),
        );
      }

      await database.close();
      return Future.value(true);
    } catch (e) {
      if (kDebugMode) print("Background Task Failed: $e");
      return Future.value(false);
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: deprecated_member_use
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);

  // Use Periodic Task for 24-hour intervals
  await Workmanager().registerPeriodicTask(
    "daily-health-sync-periodic", // Unique Name
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
