import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:psp_elaros/data/local/database.dart' as db;
import 'package:psp_elaros/data/local/database_seeder.dart';
import 'package:psp_elaros/data/models/heart_metrics_model.dart';
import 'package:psp_elaros/data/models/sleep_model.dart';
import 'package:psp_elaros/data/repositories/health_repository.dart';
import 'package:psp_elaros/data/repositories/trends_repository.dart';
import 'package:psp_elaros/models/metrics_view_model.dart';
import 'package:psp_elaros/models/trend_view_model.dart';
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

      int steps = await healthRepo.getSteps();
      await healthRepo.saveSteps(steps);

      HeartMetrics heartMetrics = await healthRepo.getHeartMetrics();
      await healthRepo.saveHeartMetrics(heartMetrics);

      Sleep sleepData = await healthRepo.getLastNightSleep();
      await healthRepo.saveSleep(sleepData);

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

  await Workmanager().initialize(callbackDispatcher);
  await Workmanager().registerPeriodicTask(
    "daily-health-sync-periodic",
    "syncHealthDataTask",
    frequency: const Duration(minutes: 15),
    constraints: Constraints(requiresBatteryNotLow: true),
  );

  final database = db.AppDatabase();

  // Remove before release
  if (kDebugMode) {
    await DatabaseSeeder(database: database).seedIfEmpty();
  }

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

  runApp(
    MultiProvider(
      providers: [
        Provider<db.AppDatabase>.value(value: database),
        ChangeNotifierProvider<TrendsViewModel>(
          create: (_) =>
              TrendsViewModel(repository: TrendsRepository(database: database))
                ..load(),
        ),
        ChangeNotifierProvider<MetricsViewModel>(
          create: (_) => MetricsViewModel()..loadMetrics(),
        ),
      ],
      child: const ElarosApp(),
    ),
  );
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
