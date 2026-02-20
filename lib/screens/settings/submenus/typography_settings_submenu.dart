// lib/screens/settings/submenus/typography_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';

class TypographySettingsSubmenu extends StatefulWidget {
  const TypographySettingsSubmenu({super.key});

  @override
  State<TypographySettingsSubmenu> createState() => _TypographySettingsSubmenuState();
}

class _TypographySettingsSubmenuState extends State<TypographySettingsSubmenu> {
  // Local state for our slider (Front-end only for now)
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Typography"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Text Settings",
            items: [
              SettingsItemModel(
                title: "Font Size",
                subtitle: "Adjust the global scale of text",
                icon: Icons.format_size,
                helpText: "Increasing the font size makes text easier to read, but may cause some items to take up more vertical space.",
                type: SettingsItemType.slider,
                min: 12.0,
                max: 32.0,
                doubleValue: _fontSize, // Tie to local state
                onDoubleChanged: (double newValue) {
                  setState(() {
                    _fontSize = newValue;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 32),

          // PREVIEW SECTION
          // This allows you to visually verify the slider is working
          const Padding(
            padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
            child: Text(
              "Preview",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.deepPurple.shade100),
            ),
            child: Column(
              children: [
                Text(
                  "Example Heading",
                  style: TextStyle(
                    fontSize: _fontSize + 4, // Make heading slightly larger
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "This is a preview of how your text will look throughout the application. Move the slider above to see it change in real-time.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}