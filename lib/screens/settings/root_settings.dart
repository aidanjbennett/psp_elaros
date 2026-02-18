import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootSettings extends StatefulWidget {
  const RootSettings({super.key});

  @override
  State<RootSettings> createState() => _RootSettingsState();
}

class _RootSettingsState extends State<RootSettings> {
  final Map<String, String> settingsMap = {
    "Colours": "colour",
    "Motion": "motion",
    "Notifications": "notification"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView.builder(
        itemCount: settingsMap.length,
        itemBuilder: (context, index) {
          String title = settingsMap.keys.elementAt(index);
          String routePath = settingsMap.values.elementAt(index);

          return ListTile(
            title: Text(title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/$routePath'),
          );
        },
      ),
    );
  }
}
