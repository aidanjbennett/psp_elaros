import 'package:flutter/material.dart';

class TimePickerDialog extends StatefulWidget {
  const TimePickerDialog({super.key});

  @override
  State<TimePickerDialog> createState() => _TimePickerDialogState();
}

class _TimePickerDialogState extends State<TimePickerDialog> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showDialog<TimeOfDay>(
        context: context,
        builder: (BuildContext context) => Dialog(
          insetPadding: EdgeInsets.all(8),
          child: TimePickerDialog(),
        )
    );

    setState(() {
      selectedTime = pickedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
