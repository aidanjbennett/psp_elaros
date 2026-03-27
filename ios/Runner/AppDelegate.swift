import Flutter
import UIKit
import workmanager_apple

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // Notifications
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }

    // Work Manager Required
    WorkmanagerPlugin.registerBGProcessingTask(
      withIdentifier: "daily-health-sync"
    )

    WorkmanagerPlugin.registerPeriodicTask(
      withIdentifier: "daily-health-sync-periodic",
      frequency: NSNumber(value: 15 * 60)  // (15 min minimum)
    )

    WorkmanagerDebug.setCurrent(LoggingDebugHandler())

    GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
