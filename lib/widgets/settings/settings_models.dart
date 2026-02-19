import 'package:flutter/material.dart';

enum SettingsItemType { navigation, toggle, slider, list, input, action, info }

class SettingsItemModel {
  final String title;
  final String? subtitle;
  final String? helpText;
  final IconData? icon;
  final SettingsItemType type;
  final VoidCallback? onTap;
  final MaterialColor baseColor;
  final double? customIconSize;

  // Data for specific types
  final bool? boolValue;
  final double? doubleValue;
  final String? stringValue;
  final List<String>? options;
  final bool enabled;
  final double min;
  final double max;

  final ValueChanged<bool>? onBoolChanged;
  final ValueChanged<double>? onDoubleChanged;
  final ValueChanged<String>? onStringChanged;

  SettingsItemModel({
    required this.title,
    this.subtitle,
    this.helpText,
    this.icon,
    this.type = SettingsItemType.navigation,
    this.onTap,
    this.boolValue,
    this.baseColor = Colors.deepPurple,
    this.customIconSize,
    this.doubleValue,
    this.stringValue,
    this.options,
    this.min = 0.0,
    this.max = 1.0,
    this.enabled = true,
    this.onBoolChanged,
    this.onDoubleChanged,
    this.onStringChanged,

  });
}