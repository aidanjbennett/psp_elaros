import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// ✅ Must be top-level — runs in a separate isolate when app is terminated
@pragma('vm:entry-point')
void onBackgroundNotificationTapped(NotificationResponse response) {
  if (kDebugMode) {
    print('Background notification tapped: payload=${response.payload}');
  }
}

class NotificationService {
  NotificationService._();

  static final _plugin = FlutterLocalNotificationsPlugin();

  // ─── Initialisation ────────────────────────────────────────────────────────

  static Future<void> init() async {
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(android: android, iOS: iOS),
      onDidReceiveNotificationResponse: _onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse:
          onBackgroundNotificationTapped,
    );

    await _requestPermissions();
  }

  // ─── Permissions ───────────────────────────────────────────────────────────

  static Future<void> _requestPermissions() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestExactAlarmsPermission();

    await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // ─── Details Builder ───────────────────────────────────────────────────────

  static NotificationDetails _buildDetails({
    String channelId = 'default_channel',
    String channelName = 'General',
    String channelDescription = 'General app notifications',
    Importance importance = Importance.high,
    Priority priority = Priority.high,
  }) {
    final android = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: importance,
      priority: priority,
      icon: '@mipmap/ic_launcher',
    );
    const iOS = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    return NotificationDetails(android: android, iOS: iOS);
  }

  // ─── Show ──────────────────────────────────────────────────────────────────

  /// Shows a notification immediately.
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: _buildDetails(),
      payload: payload,
    );
  }

  // ─── Schedule ──────────────────────────────────────────────────────────────

  /// Schedules a notification at a specific [dateTime].
  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
    String? payload,
    String timeZoneName = 'UTC',
  }) async {
    final location = tz.getLocation(timeZoneName);
    final scheduledDate = tz.TZDateTime.from(dateTime, location);

    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: _buildDetails(),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // ─── Repeating ─────────────────────────────────────────────────────────────

  /// Schedules a notification to repeat on a given [interval].
  static Future<void> scheduleRepeatingNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval interval,
    String? payload,
  }) async {
    await _plugin.periodicallyShow(
      id: id,
      title: title,
      body: body,
      repeatInterval: interval,
      notificationDetails: _buildDetails(),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // ─── Cancel ────────────────────────────────────────────────────────────────

  /// Cancels a specific notification by [id].
  static Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id: id);
  }

  /// Cancels all pending and shown notifications.
  static Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }

  // ─── Tap Handler ──────────────────────────────────────────────────────────

  static void _onNotificationTapped(NotificationResponse response) {
    // Called when user taps a notification while app is in foreground/background.
    // Use response.payload to navigate or handle logic.
    print('Notification tapped: payload=${response.payload}');
  }
}
