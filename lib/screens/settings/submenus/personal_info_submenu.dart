// lib/screens/settings/submenus/personal_info_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';
import 'package:psp_elaros/widgets/settings/dialog_utils.dart'; // Import your new helper

class PersonalInfoSettingsSubmenu extends StatefulWidget {
  const PersonalInfoSettingsSubmenu({super.key});

  @override
  State<PersonalInfoSettingsSubmenu> createState() => _PersonalInfoSettingsSubmenuState();
}

class _PersonalInfoSettingsSubmenuState extends State<PersonalInfoSettingsSubmenu> {
  // Local state variables
  String _name = "Alex User";
  String _age = "24";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Personal Info"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Identity",
            items: [
              SettingsItemModel(
                title: "Display Name",
                icon: Icons.badge_outlined,
                type: SettingsItemType.input,
                stringValue: _name, // Displays current value
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: "Display Name",
                  currentValue: _name,
                  keyboardType: TextInputType.name,
                  onChanged: (val) => setState(() => _name = val),
                ),
              ),
              SettingsItemModel(
                title: "Age",
                icon: Icons.cake_outlined,
                type: SettingsItemType.input,
                stringValue: _age,
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: "Age",
                  currentValue: _age,
                  keyboardType: TextInputType.number, // Numeric keyboard
                  onChanged: (val) => setState(() => _age = val),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}