import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';


class NotificationSettingsSubmenu extends StatefulWidget {
  const NotificationSettingsSubmenu({super.key});

  @override
  State<NotificationSettingsSubmenu> createState() => _NotificationSettingsSubmenuState();
}

class _NotificationSettingsSubmenuState extends State<NotificationSettingsSubmenu> {
  bool _allNotifications = true;
  bool _strainWarningNotif = true;
  bool _overexertionAlertNotif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SettingsGroup(
            title: "Global Control",
            items: [
              SettingsItemModel(
                title: "Allow Notifications",
                helpText: "Disabling this silences all alerts immediately.",
                type: SettingsItemType.toggle,
                boolValue: _allNotifications,
                onBoolChanged: (val) => setState(() => _allNotifications = val),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SettingsGroup(
              title: "Cautionary Alerts",
            items: [
              SettingsItemModel(
                title: "Strain Warning",
                type: SettingsItemType.toggle,
                enabled: _allNotifications,
                boolValue: _strainWarningNotif,
                onBoolChanged: (val) => setState(() => _strainWarningNotif = val),
              ),
            ],
          ),
          SettingsGroup(
              title: "Risk Alerts",
            items: [
              SettingsItemModel(
                  title: "Overexertion Alert",
                type: SettingsItemType.toggle,
                enabled: _allNotifications,
                boolValue: _overexertionAlertNotif,
                onBoolChanged: (val) => setState(() => _overexertionAlertNotif = val)
              )
            ],
          )
        ],
      ),
    );
  }
}
