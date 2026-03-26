import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psp_elaros/data/models/goals/goals.dart';
import 'package:psp_elaros/data/models/goals/recurrence_type.dart';
import 'package:psp_elaros/widgets/goals/day_of_the_week_picker.dart';
import 'package:psp_elaros/widgets/goals/end_date_picker.dart';

enum GoalType { oneTime, recurring }
enum RepeatingTimeWindow { day, week, month, custom }

class AddGoalForm extends StatefulWidget {
  const AddGoalForm({super.key});

  @override
  State<AddGoalForm> createState() => _AddGoalFormState();
}

class _AddGoalFormState extends State<AddGoalForm> {
  int _pageNumber = 0;
  TimeOfDay? _selectedTime;
  Duration _sleepTarget = const Duration(hours: 8);

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _pickSleepDuration() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        // 1. We wrap it in a Container with a fixed height and background color
        // so it sits cleanly at the bottom of the screen.
        return Container(
          height: 280,
          padding: const EdgeInsets.all(8.0),
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  // 4. The actual picker widget
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm, // "hm" means Hours/Minutes
                    initialTimerDuration: _sleepTarget,
                    // This fires every time the wheel ticks to a new number
                    onTimerDurationChanged: (Duration newDuration) {
                      setState(() => _sleepTarget = newDuration);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      child: const Text('Done'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final _titleController = TextEditingController();

  GoalType _selectedGoalType = GoalType.oneTime;
  RepeatingTimeWindow _selectedRepeatingTimeWindow = RepeatingTimeWindow.day;
  MetricCategory _selectedCategory = MetricCategory.steps;

  // --- Quick Helper Methods for the Enum ---
  IconData _getIconForCategory(MetricCategory category) {
    switch (category) {
      case MetricCategory.steps: return Icons.directions_walk;
      case MetricCategory.sleep: return Icons.bedtime;
    // add your other cases here...
      default: return Icons.star;
    }
  }

  String _getLabelForCategory(MetricCategory category) {
    switch (category) {
      case MetricCategory.steps: return "Steps";
      case MetricCategory.sleep: return "Sleep";
    // add your other cases here...
      default: return "Goal";
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildStepOne() {
      final colorScheme = Theme.of(context).colorScheme;

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        key: const ValueKey("Page1"),
        children: [
          Text(
            "Create New Goal",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: "Goal Title",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            "WHAT DO YOU WANT TO TRACK?",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          // The Visual Category Grid
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.start,
            children: MetricCategory.values.map((category) {
              final isSelected = _selectedCategory == category;
              final icon = _getIconForCategory(category);
              final label = _getLabelForCategory(category);

              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = category),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: isSelected ? colorScheme.primary : colorScheme.primaryFixed.withAlpha(125),
                    borderRadius: BorderRadius.circular(isSelected ? 24 : 16),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : colorScheme.primaryFixedDim.withAlpha(100),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 32,
                        color: isSelected ? colorScheme.onPrimary : colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? colorScheme.onPrimary : colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    }

    Widget _buildStepTwo() {
      final colorScheme = Theme.of(context).colorScheme;

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        key: const ValueKey("Page2"),
        children: [
          Text(
            "Set Your Target",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // ==========================================
          // SCENARIO A: SLEEP GOAL
          // ==========================================
          if (_selectedCategory == MetricCategory.sleep) ...[
            Text(
              "TARGET SLEEP DURATION",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.bedtime),
              label: Text(
                "${_sleepTarget.inHours}h ${_sleepTarget.inMinutes.remainder(60)}m",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              onPressed: _pickSleepDuration,
            ),
            const SizedBox(height: 16),
            Text(
              "Sleep goals automatically reset daily.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ]

          // ==========================================
          // SCENARIO B: STEPS GOAL
          // ==========================================
          else if (_selectedCategory == MetricCategory.steps) ...[
            InputDecorator(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurfaceVariant,
                ),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
              child: SegmentedButton<GoalType>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: GoalType.oneTime,
                    label: const Text("One time"),
                    icon: _selectedGoalType == GoalType.oneTime ? const Icon(Icons.task_alt) : null,
                  ),
                  ButtonSegment(
                    value: GoalType.recurring,
                    label: const Text("Repeating"),
                    icon: _selectedGoalType == GoalType.recurring ? const Icon(Icons.repeat) : null,
                  )
                ],
                selected: <GoalType>{_selectedGoalType},
                onSelectionChanged: (Set<GoalType> newSelection) {
                  setState(() {
                    _selectedGoalType = newSelection.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            if (_selectedGoalType == GoalType.oneTime) ...[
              Text(
                "SELECT AN END DATE",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const EndDatePicker(),
                  const SizedBox(width: 8),
                  ActionChip(
                    avatar: const Icon(Icons.access_time),
                    label: Text(_selectedTime != null
                        ? "${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                        : "Select time"),
                    onPressed: _pickTime,
                  ),
                ],
              )
            ],

            if (_selectedGoalType == GoalType.recurring) ...[
              Text(
                "HOW OFTEN?",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  ChoiceChip(
                    label: const Text("Daily"),
                    avatar: const Icon(Icons.calendar_view_day),
                    selected: _selectedRepeatingTimeWindow == RepeatingTimeWindow.day,
                    showCheckmark: false,
                    onSelected: (bool selected) {
                      if (selected) setState(() => _selectedRepeatingTimeWindow = RepeatingTimeWindow.day);
                    },
                  ),
                  ChoiceChip(
                    label: const Text("Weekly"),
                    avatar: const Icon(Icons.calendar_view_week),
                    selected: _selectedRepeatingTimeWindow == RepeatingTimeWindow.week,
                    showCheckmark: false,
                    onSelected: (bool selected) {
                      if (selected) setState(() => _selectedRepeatingTimeWindow = RepeatingTimeWindow.week);
                    },
                  ),
                  ChoiceChip(
                    label: const Text("Monthly"),
                    avatar: const Icon(Icons.calendar_view_month),
                    selected: _selectedRepeatingTimeWindow == RepeatingTimeWindow.month,
                    showCheckmark: false,
                    onSelected: (bool selected) {
                      if (selected) setState(() => _selectedRepeatingTimeWindow = RepeatingTimeWindow.month);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              if (_selectedRepeatingTimeWindow == RepeatingTimeWindow.day)...[
                Text(
                  "RESET TIME?",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ActionChip(
                        avatar: const Icon(Icons.access_time),
                        label: Text(_selectedTime != null
                            ? "${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}"
                            : "Select time"
                        ),
                        onPressed: _pickTime
                    ),
                  ],
                )
              ],
              if (_selectedRepeatingTimeWindow == RepeatingTimeWindow.week)...[
                Text(
                  "RESET DAY?",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const DayOfTheWeekPicker(),
              ],
            ],

            const SizedBox(height: 16),
            Text(
              "TARGET STEPS",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "e.g. 10000",
                border: OutlineInputBorder(),
                suffixText: "steps",
              ),
            ),
          ],
        ],
      );
    }

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: keyboardSpace + 16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              alignment: Alignment.topCenter,
              clipBehavior: Clip.hardEdge,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),

                layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      ...previousChildren.map((Widget child) {
                        return Positioned(
                          top: 0, left: 0, right: 0,
                          child: child,
                        );
                      }),
                      if (currentChild != null) currentChild,
                    ],
                  );
                },

                transitionBuilder: (Widget child, Animation<double> animation) {
                  final isStepOne = child.key == const ValueKey("Page1");

                  final slideDirection = isStepOne ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);

                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: slideDirection,
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    )),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },

                child: _pageNumber == 0 ? _buildStepOne() : _buildStepTwo(),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                if (_pageNumber == 1) ...[
                  TextButton(
                    onPressed: () => setState(() => _pageNumber = 0),
                    child: const Text("Back"),
                  ),
                  const SizedBox(width: 8),
                ],

                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (_pageNumber == 0) {
                        setState(() => _pageNumber = 1);
                      } else {
                        // TODO: Validate data, create Goal, and pop the sheet
                        Navigator.pop(context);
                      }
                    },
                    child: Text(_pageNumber == 0 ? "Next" : "Save Goal"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}