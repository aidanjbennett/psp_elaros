// lib/screens/settings/submenus/motion_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';

class MotionSettingsSubmenu extends StatefulWidget {
  const MotionSettingsSubmenu({super.key});

  @override
  State<MotionSettingsSubmenu> createState() => _MotionSettingsSubmenuState();
}

class _MotionSettingsSubmenuState extends State<MotionSettingsSubmenu> {
  // State variables for the switches
  bool _reduceMotion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Motion"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            // No title used here per your preference for a flat look
            items: [
              // Primary Toggle: Reduce Motion
              SettingsItemModel(
                title: "Reduce Motion",
                subtitle: "Minimizes animations across the app",
                icon: Icons.animation,
                helpText: "Turning this on simplifies interface transitions and reduces flashing or moving elements, which can help prevent motion sickness.",
                type: SettingsItemType.toggle,
                boolValue: _reduceMotion, // Updated from 'value'
                onBoolChanged: (val) { // Updated from 'onChanged'
                  setState(() => _reduceMotion = val);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}