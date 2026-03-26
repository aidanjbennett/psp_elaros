import 'package:flutter/material.dart';

enum DaysOfTheWeek { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

class DayOfTheWeekPicker extends StatefulWidget {
  const DayOfTheWeekPicker({super.key});

  @override
  State<DayOfTheWeekPicker> createState() => _DayOfTheWeekPickerState();
}

class _DayOfTheWeekPickerState extends State<DayOfTheWeekPicker> {
  // 1. State variables must be initialized (or made nullable)
  DaysOfTheWeek _selectedDay = DaysOfTheWeek.monday;

  // 2. A simple map to translate the enum into your desired UI initials
  final Map<DaysOfTheWeek, String> _dayLabels = {
    DaysOfTheWeek.monday: 'M',
    DaysOfTheWeek.tuesday: 'T',
    DaysOfTheWeek.wednesday: 'W',
    DaysOfTheWeek.thursday: 'T',
    DaysOfTheWeek.friday: 'F',
    DaysOfTheWeek.saturday: 'S',
    DaysOfTheWeek.sunday: 'S',
  };

  @override
  Widget build(BuildContext context) {
    // 3. Row evenly spaces out exactly 7 items across the screen
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // .map() loops through your enum and turns each one into a button
      children: DaysOfTheWeek.values.map((day) {
        final isSelected = _selectedDay == day;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = day;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,  // Forces a perfect circle
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Filled when selected, transparent when unselected
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              // Outlined to match your styling request
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                width: 1.5,
              ),
            ),
            child: Text(
              _dayLabels[day]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // White text when selected, standard text color when unselected
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}