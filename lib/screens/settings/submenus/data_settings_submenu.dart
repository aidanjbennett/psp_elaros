// lib/screens/settings/submenus/export_data_settings.dart
import 'package:flutter/material.dart';
import 'package:psp_elaros/widgets/settings/settings_group.dart';
import 'package:psp_elaros/widgets/settings/settings_models.dart';
import 'package:psp_elaros/widgets/settings/dialog_utils.dart';

class ExportDataSettingsSubmenu extends StatefulWidget {
  const ExportDataSettingsSubmenu({super.key});

  @override
  State<ExportDataSettingsSubmenu> createState() => _ExportDataSettingsSubmenuState();
}

class _ExportDataSettingsSubmenuState extends State<ExportDataSettingsSubmenu> {
  // Local state for the dropdown
  String _dateRange = "Last 30 Days";

  // Mock function to simulate the export action
  void _showMockExportDialog(String format) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exporting Data"),
        content: Text("Gathering your pacing logs and heart rate data for the $_dateRange...\n\n(This will generate a $format file in the final backend implementation.)"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Export Data"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingsGroup(
            title: "Data Range",
            items: [
              SettingsItemModel(
                title: "Select Timeframe",
                subtitle: "Currently: $_dateRange",
                icon: Icons.date_range,
                type: SettingsItemType.list,
                stringValue: _dateRange,
                onTap: () => showSettingsListDialog(
                  context: context,
                  title: "Select Timeframe",
                  options: ["Last 7 Days", "Last 30 Days", "Last 3 Months", "All Time"],
                  currentValue: _dateRange,
                  onSelected: (val) => setState(() => _dateRange = val),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SettingsGroup(
            title: "Export Formats",
            items: [
              SettingsItemModel(
                title: "Export as CSV",
                subtitle: "Best for spreadsheets and manual analysis",
                icon: Icons.table_chart_outlined,
                type: SettingsItemType.action, // Shows the right chevron
                onTap: () => _showMockExportDialog("CSV"),
              ),
              SettingsItemModel(
                title: "Export as JSON",
                subtitle: "Best for importing into other health apps",
                icon: Icons.data_object,
                type: SettingsItemType.action,
                onTap: () => _showMockExportDialog("JSON"),
              ),
              SettingsItemModel(
                title: "Generate PDF Report",
                subtitle: "A readable summary for your medical team",
                icon: Icons.picture_as_pdf_outlined,
                type: SettingsItemType.action,
                onTap: () => _showMockExportDialog("PDF"),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SettingsGroup(
            title: "Information",
            items: [
              SettingsItemModel(
                title: "What is included?",
                subtitle: "Your export includes heart rate zones, biometrics, and logged activity pacing. No identifiable account details are included in raw data files.",
                icon: Icons.info_outline,
                type: SettingsItemType.info, // Read-only, no chevron
              ),
            ],
          ),
        ],
      ),
    );
  }
}