// lib/screens/settings/submenus/health_bio_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';
import 'package:psp_elaros/widgets/settings/dialog_utils.dart';

class HealthBiometricsSubmenu extends StatefulWidget {
  const HealthBiometricsSubmenu({super.key});

  @override
  State<HealthBiometricsSubmenu> createState() => _HealthBiometricsSubmenuState();
}

class _HealthBiometricsSubmenuState extends State<HealthBiometricsSubmenu> {
  int _heightCm = 175;
  int _weightKg = 70;
  bool _useMetric = true;

  // --- Height Logic ---
  String get _displayHeight {
    if (_useMetric) return "$_heightCm cm";

    int totalInches = (_heightCm / 2.54).round();
    int feet = totalInches ~/ 12;
    int inches = totalInches % 12;
    return "$feet'$inches\"";
  }

  // --- Weight Logic ---
  String get _displayWeight {
    if (_useMetric) return "$_weightKg kg";
    return "${(_weightKg * 2.20462).round()} lbs";
  }

  void _saveWeight(String val) {
    final int? parsed = int.tryParse(val);
    if (parsed != null) {
      setState(() {
        _weightKg = _useMetric ? parsed : (parsed / 2.20462).round();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Health Biometrics"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Preferences",
            items: [
              SettingsItemModel(
                title: "Use Metric System",
                subtitle: _useMetric ? "Centimeters & Kilograms" : "Feet/Inches & Pounds",
                icon: Icons.straighten,
                type: SettingsItemType.toggle,
                boolValue: _useMetric,
                onBoolChanged: (val) => setState(() => _useMetric = val),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SettingsGroup(
            title: "Body Measurements",
            items: [
              SettingsItemModel(
                title: "Height",
                icon: Icons.height,
                type: SettingsItemType.input,
                stringValue: _displayHeight,
                onTap: () {
                  if (_useMetric) {
                    // Standard single input for Centimeters
                    showSettingsInputDialog(
                      context: context,
                      title: "Height (cm)",
                      currentValue: _heightCm.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        final parsed = int.tryParse(val);
                        if (parsed != null) setState(() => _heightCm = parsed);
                      },
                    );
                  } else {
                    // Custom dual input for Feet & Inches
                    int totalInches = (_heightCm / 2.54).round();
                    showImperialHeightDialog(
                      context: context,
                      initialFeet: totalInches ~/ 12,
                      initialInches: totalInches % 12,
                      onSaved: (int newTotalInches) {
                        setState(() {
                          _heightCm = (newTotalInches * 2.54).round();
                        });
                      },
                    );
                  }
                },
              ),
              SettingsItemModel(
                title: "Current Weight",
                icon: Icons.monitor_weight_outlined,
                type: SettingsItemType.input,
                stringValue: _displayWeight,
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: _useMetric ? "Weight (kg)" : "Weight (lbs)",
                  currentValue: _useMetric ? _weightKg.toString() : (_weightKg * 2.20462).round().toString(),
                  keyboardType: TextInputType.number,
                  onChanged: _saveWeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}