import 'package:flutter/material.dart';
import 'settings_models.dart';

class SettingsItem extends StatelessWidget {
  final SettingsItemModel item;
  final BorderRadius borderRadius;

  const SettingsItem({super.key, required this.item, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.enabled ? 1.0 : 0.4, // Standard M3 disabled opacity
      child: Container(
        decoration: BoxDecoration(
          // Dynamically sets the card background to the lightest shade of the base color
          color: item.baseColor.shade50,
          borderRadius: borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            // Disable interaction if item is disabled
            onTap: item.enabled ? _handleTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                // Reclaims space if no icon exists
                leading: item.icon != null ? _buildLeading() : null,
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                subtitle: item.subtitle != null
                    ? Text(item.subtitle!, style: TextStyle(color: Colors.grey.shade600, fontSize: 13))
                    : null,
                trailing: IntrinsicWidth(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (item.helpText != null) _buildHelpButton(context),
                      if (item.helpText != null && item.type != SettingsItemType.info)
                        const SizedBox(width: 4),
                      _buildTrailingAction(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleTap() {
    if (item.type == SettingsItemType.toggle) {
      item.onBoolChanged?.call(!(item.boolValue ?? false));
    } else {
      item.onTap?.call();
    }
  }

  Widget _buildLeading() {
    return Ink(
      decoration: BoxDecoration(
        color: item.baseColor.shade100,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Center(
          child: Icon(
            item.icon,
            size: item.customIconSize ?? 20,
            color: item.baseColor.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildHelpButton(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      icon: Icon(Icons.help_outline, size: 20, color: item.baseColor.shade300),
      onPressed: item.enabled ? () => _showHelpDialog(context) : null,
    );
  }

  Widget _buildTrailingAction(BuildContext context) {
    switch (item.type) {
      case SettingsItemType.toggle:
        return Switch(
          value: item.boolValue ?? false,
          // Setting onChanged to null is what triggers the M3 greyscale state
          onChanged: item.enabled ? item.onBoolChanged : null,
        );

      case SettingsItemType.slider:
        return SizedBox(
          width: 140, // FIX: Provides a width constraint for the slider
          child: Slider(
            value: item.doubleValue ?? item.min,
            min: item.min,
            max: item.max,
            // null callback triggers the grey/disabled visual
            onChanged: item.enabled ? item.onDoubleChanged : null,
          ),
        );

      case SettingsItemType.list:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                item.stringValue ?? "",
                style: TextStyle(
                  color: item.enabled ? Colors.grey.shade700 : Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              color: item.enabled ? Colors.grey : Colors.grey.shade300,
              size: 20,
            ),
          ],
        );

      case SettingsItemType.input:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the current value text
            Text(
              item.stringValue ?? "",
              style: TextStyle(
                color: item.enabled ? item.baseColor.shade700 : Colors.grey.shade400,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 6),
            // A small edit icon to indicate interactivity
            Icon(
                Icons.edit_outlined,
                color: item.enabled ? Colors.grey.shade500 : Colors.grey.shade300,
                size: 18
            ),
          ],
        );

      case SettingsItemType.info:
        return const SizedBox.shrink();

      case SettingsItemType.action:
      case SettingsItemType.navigation:
      default:
        return Icon(
            Icons.chevron_right,
            color: item.enabled ? Colors.grey.shade600 : Colors.grey.shade300,
            size: 22
        );
    }
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(item.title),
        content: Text(item.helpText!),
        actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text("OK"))],
      ),
    );
  }
}