// lib/screens/settings/submenus/hr_zones_settings.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';
import 'package:psp_elaros/widgets/settings/dialog_utils.dart';

// A simple data class to hold the state of each zone
class HRZone {
  final String name;
  final MaterialColor color;
  int minBpm;
  int maxBpm;

  HRZone({
    required this.name,
    required this.color,
    required this.minBpm,
    required this.maxBpm,
  });
}

class HRZonesSettingsSubmenu extends StatefulWidget {
  const HRZonesSettingsSubmenu({super.key});

  @override
  State<HRZonesSettingsSubmenu> createState() => _HRZonesSettingsSubmenuState();
}

class _HRZonesSettingsSubmenuState extends State<HRZonesSettingsSubmenu> {
  int _age = 24;
  int _restingHr = 65;
  int _maxHr = 196; // Standard 220 - Age

  late List<HRZone> _zones;

  @override
  void initState() {
    super.initState();
    _zones = [
      // FIX: Swapped Colors.grey for Colors.blueGrey for better accessibility contrast
      HRZone(name: "Zone 1 (Recovery)", color: Colors.blueGrey, minBpm: 0, maxBpm: 0),
      HRZone(name: "Zone 2 (Endurance)", color: Colors.blue, minBpm: 0, maxBpm: 0),
      HRZone(name: "Zone 3 (Aerobic)", color: Colors.green, minBpm: 0, maxBpm: 0),
      HRZone(name: "Zone 4 (Threshold)", color: Colors.orange, minBpm: 0, maxBpm: 0),
      HRZone(name: "Zone 5 (Maximum)", color: Colors.red, minBpm: 0, maxBpm: 0),
    ];
    _recalculateZones();
  }

  // The Karvonen Formula for accurate HR zones based on Heart Rate Reserve (HRR)
  void _recalculateZones() {
    int hrReserve = _maxHr - _restingHr;

    setState(() {
      // Zone 1: 50% - 59% of HRR
      _zones[0].minBpm = _restingHr + (hrReserve * 0.50).round();
      _zones[0].maxBpm = _restingHr + (hrReserve * 0.60).round() - 1;

      // Zone 2: 60% - 69% of HRR
      _zones[1].minBpm = _restingHr + (hrReserve * 0.60).round();
      _zones[1].maxBpm = _restingHr + (hrReserve * 0.70).round() - 1;

      // Zone 3: 70% - 79% of HRR
      _zones[2].minBpm = _restingHr + (hrReserve * 0.70).round();
      _zones[2].maxBpm = _restingHr + (hrReserve * 0.80).round() - 1;

      // Zone 4: 80% - 89% of HRR
      _zones[3].minBpm = _restingHr + (hrReserve * 0.80).round();
      _zones[3].maxBpm = _restingHr + (hrReserve * 0.90).round() - 1;

      // Zone 5: 90% - 100% of HRR
      _zones[4].minBpm = _restingHr + (hrReserve * 0.90).round();
      _zones[4].maxBpm = _maxHr;
    });
  }

  // Local dialog for manual override of a specific zone
  void _showZoneOverrideDialog(HRZone zone) {
    final minController = TextEditingController(text: zone.minBpm.toString());
    final maxController = TextEditingController(text: zone.maxBpm.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Override ${zone.name}"),
          content: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: minController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(labelText: "Min BPM", border: OutlineInputBorder()),
                  autofocus: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: maxController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(labelText: "Max BPM", border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            TextButton(
              onPressed: () {
                setState(() {
                  zone.minBpm = int.tryParse(minController.text) ?? zone.minBpm;
                  zone.maxBpm = int.tryParse(maxController.text) ?? zone.maxBpm;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Heart Rate Zones"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Baseline Metrics",
            items: [
              SettingsItemModel(
                title: "Age",
                icon: Icons.cake_outlined,
                type: SettingsItemType.input,
                stringValue: _age.toString(),
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: "Age",
                  currentValue: _age.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    final parsed = int.tryParse(val);
                    if (parsed != null) {
                      setState(() {
                        _age = parsed;
                        _maxHr = 220 - _age; // Standard Max HR formula
                        _recalculateZones();
                      });
                    }
                  },
                ),
              ),
              SettingsItemModel(
                title: "Resting Heart Rate",
                icon: Icons.favorite_border,
                type: SettingsItemType.input,
                stringValue: "$_restingHr bpm",
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: "Resting HR (bpm)",
                  currentValue: _restingHr.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    final parsed = int.tryParse(val);
                    if (parsed != null) {
                      setState(() {
                        _restingHr = parsed;
                        _recalculateZones();
                      });
                    }
                  },
                ),
              ),
              SettingsItemModel(
                title: "Maximum Heart Rate",
                icon: Icons.monitor_heart_outlined,
                type: SettingsItemType.input,
                stringValue: "$_maxHr bpm",
                onTap: () => showSettingsInputDialog(
                  context: context,
                  title: "Max HR (bpm)",
                  currentValue: _maxHr.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    final parsed = int.tryParse(val);
                    if (parsed != null) {
                      setState(() {
                        _maxHr = parsed;
                        _recalculateZones();
                      });
                    }
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Reset button for manual overrides
          TextButton.icon(
            onPressed: _recalculateZones,
            icon: const Icon(Icons.refresh),
            label: const Text("Auto-Calculate from Baseline"),
          ),

          const SizedBox(height: 16),



          SettingsGroup(
            title: "Configured Zones (Tap to Override)",
            items: _zones.asMap().entries.map((entry) {
              int index = entry.key;
              HRZone zone = entry.value;

              // Core visual feature: The inner circle grows larger as the intensity increases
              double progressiveSize = 8.0 + (index * 4.0); // 8, 12, 16, 20, 24

              return SettingsItemModel(
                title: zone.name,
                subtitle: "${zone.minBpm} - ${zone.maxBpm} bpm",
                icon: Icons.circle,
                type: SettingsItemType.navigation, // Shows the chevron indicating interactivity
                baseColor: zone.color,             // Passes the distinct zone color into the component
                customIconSize: progressiveSize,   // Applies the dynamic icon scaling
                onTap: () => _showZoneOverrideDialog(zone),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}