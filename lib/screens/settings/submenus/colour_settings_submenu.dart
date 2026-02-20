// lib/screens/settings/submenus/colour_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/dialog_utils.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';

class ColourSettingsSubmenu extends StatefulWidget {
  const ColourSettingsSubmenu({super.key});

  @override
  State<ColourSettingsSubmenu> createState() => _ColourSettingsSubmenuState();
}

class _ColourSettingsSubmenuState extends State<ColourSettingsSubmenu> {
  bool _isHighContrast = false;

  String _themeMode = "System (Default)";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Colours"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Appearance",
            items: [
              SettingsItemModel(
                title: "App Theme",
                icon: Icons.brightness_6_outlined,
                type: SettingsItemType.list,
                stringValue: _themeMode,
                onTap: () => showSettingsListDialog(
                  context: context,
                  title: "Select Theme",
                  options: ["System (Default)", "Light", "Dark"],
                  currentValue: _themeMode,
                  onSelected: (String newValue) {
                    setState(() {
                      _themeMode = newValue;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SettingsGroup(
            title: "Accessibility",
            items: [
              SettingsItemModel(
                title: "High Contrast",
                subtitle: "Maximises colour contrast on UI surfaces",
                icon: Icons.contrast,
                helpText: "High contrast mode increases the legibility of text...",
                type: SettingsItemType.toggle,
                boolValue: _isHighContrast,
                onBoolChanged: (val) => setState(() => _isHighContrast = val),
              ),
            ],
          ),
        ],
      ),
    );
  }
}