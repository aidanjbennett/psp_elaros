// lib/screens/settings/root_settings.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import your new reusable components
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';

class RootSettings extends StatelessWidget {
  const RootSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          // APP GROUP
          SettingsGroup(
            title: "App",
            items: [
              SettingsItemModel(
                title: "Notifications",
                subtitle: "Permissions & Alerts",
                icon: Icons.notifications_outlined,
                onTap: () => context.push('/settings/notification'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ACCESSIBILITY GROUP
          SettingsGroup(
            title: "Accessibility",
            items: [
              SettingsItemModel(
                title: "Colours",
                subtitle: "Light / Dark, High Contrast",
                icon: Icons.palette_outlined,
                onTap: () => context.push('/settings/colour'),
              ),
              SettingsItemModel(
                title: "Motion",
                subtitle: "Reduced motion",
                icon: Icons.animation,
                onTap: () => context.push('/settings/motion'),
              ),
              SettingsItemModel(
                title: "Typography",
                subtitle: "Font size",
                icon: Icons.text_fields,
                onTap: () => context.push('/settings/typography'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // DATA GROUP
          SettingsGroup(
            title: "Data",
            items: [
              SettingsItemModel(
                title: "Personal Information",
                subtitle: "Name, Age",
                icon: Icons.person_outline,
                onTap: () => context.push('/settings/personal_info'),
              ),
              SettingsItemModel(
                title: "Health Biometrics",
                subtitle: "Height, Weight",
                icon: Icons.monitor_heart_outlined,
                onTap: () => context.push('/settings/health_biometrics'),
              ),
              SettingsItemModel(
                title: "Heart Rate Zones",
                subtitle: "Zone thresholds",
                icon: Icons.favorite_border,
                onTap: () => context.push('/settings/heart_rate'),
              ),
              SettingsItemModel(
                title: "Data Management",
                subtitle: "Export / Reset Data",
                icon: Icons.storage,
                onTap: () => context.push('/settings/data'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}