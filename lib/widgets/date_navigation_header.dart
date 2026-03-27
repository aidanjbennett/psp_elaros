import 'package:flutter/material.dart';
import 'package:psp_elaros/style/app_style.dart';

class DateNavigationHeader extends StatelessWidget {
  final String label;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onPickDate;
  final bool canGoForward;

  const DateNavigationHeader({
    super.key,
    required this.label,
    required this.onPrevious,
    required this.onNext,
    required this.onPickDate,
    required this.canGoForward,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: const Icon(Icons.chevron_left),
          color: AppColors.onBackground,
        ),
        Expanded(
          child: InkWell(
            onTap: onPickDate,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.onBackground
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: canGoForward ? onNext : null,
          icon: const Icon(Icons.chevron_right),
          color: AppColors.onBackground,
        ),
      ],
    );
  }
}