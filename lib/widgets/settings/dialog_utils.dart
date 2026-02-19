import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for input formatters

// 1. The Radio List Dialog (Theme, Language, etc.)
void showSettingsListDialog({
  required BuildContext context,
  required String title,
  required List<String> options,
  required String currentValue,
  required ValueChanged<String> onSelected,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          child: RadioGroup<String>( // Central manager for all radio tiles
            groupValue: currentValue,
            onChanged: (value) {
              if (value != null) {
                onSelected(value);
                Navigator.pop(context);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map((option) => RadioListTile<String>(
                title: Text(option),
                value: option,
              )).toList(),
            ),
          ),
        ),
      );
    },
  );
}

// 2. The Text Input Dialog (Name, Age, Weight, etc.)
void showSettingsInputDialog({
  required BuildContext context,
  required String title,
  required String currentValue,
  required ValueChanged<String> onChanged,
  TextInputType keyboardType = TextInputType.text,
}) {
  final controller = TextEditingController(text: currentValue);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: true,
          // If it's a number keyboard, block non-digit characters
          inputFormatters: keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            hintText: "Enter $title",
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onChanged(controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}

// Multi field dialog for height in feet and inches
void showImperialHeightDialog({
  required BuildContext context,
  required int initialFeet,
  required int initialInches,
  required ValueChanged<int> onSaved,
}) {
  final feetController = TextEditingController(text: initialFeet.toString());
  final inchesController = TextEditingController(text: initialInches.toString());

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Height"),
        content: Row(
          children: [
            Expanded(
              child: TextField(
                controller: feetController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Feet",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: inchesController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: "Inches",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final feet = int.tryParse(feetController.text) ?? 0;
              final inches = int.tryParse(inchesController.text) ?? 0;

              onSaved((feet * 12) + inches);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}