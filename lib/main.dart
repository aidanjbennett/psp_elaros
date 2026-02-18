import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/router/app_router.dart';
import 'package:psp_elaros/screens/about_screen.dart';
import 'package:psp_elaros/screens/home_screen.dart';
import 'package:psp_elaros/screens/metrics_screen.dart';
import 'package:psp_elaros/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // required before any async setup
  await NotificationService.init();

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

      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
