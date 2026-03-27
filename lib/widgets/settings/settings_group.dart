import 'package:flutter/material.dart';
import 'settings_item.dart';
import 'settings_models.dart';

class SettingsGroup extends StatelessWidget {
  final String? title;
  final List<SettingsItemModel> items;

  const SettingsGroup({
    super.key,
    this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3. Conditional rendering: Only show if title is not null and not empty
        if (title != null && title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 4.0),
            child: Text(
              title!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 2),
          itemBuilder: (context, index) {
            final radius = _calculateRadius(index, items.length);
            return SettingsItem(item: items[index], borderRadius: radius);
          },
        ),
      ],
    );
  }

  BorderRadius _calculateRadius(int index, int total) {
    const r = Radius.circular(24.0);
    const s = Radius.circular(4.0);
    if (total == 1) return const BorderRadius.all(r);
    if (index == 0) return const BorderRadius.vertical(top: r, bottom: s);
    if (index == total - 1) return const BorderRadius.vertical(top: s, bottom: r);
    return const BorderRadius.all(s);
  }
}