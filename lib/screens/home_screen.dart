import 'package:flutter/material.dart';
import 'package:psp_elaros/services/notification_service.dart';
import 'package:psp_elaros/widgets/heart_rate_widget.dart';
import 'package:psp_elaros/widgets/hrv_widget.dart';
import 'package:psp_elaros/widgets/main_navbar_widget.dart';
import 'package:psp_elaros/widgets/sleep_widget.dart';
import 'package:psp_elaros/widgets/sleep_zones_widget.dart';
import 'package:psp_elaros/widgets/steps_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Elaros Health App")),
      bottomNavigationBar: MainNavbar(currentIndex: 0),
      body: SafeArea(
        child: Column(
          children: [
            // StepsWidget(),
            // HeartRateWidget(),
            // HRVWidget(),
            // SleepWidget(),
            // SleepZonesWidget(),
            ElevatedButton(
              onPressed: () => NotificationService.showNotification(
                id: 1,
                title: 'Test',
                body: 'Notifications are working!',
              ),
              child: const Text('Send Test Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
