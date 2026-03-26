import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EndDatePicker extends StatefulWidget {
  const EndDatePicker({super.key});

  @override
  State<EndDatePicker> createState() => _EndDatePickerState();
}

class _EndDatePickerState extends State<EndDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        ActionChip(
          avatar: Icon(Icons.date_range),
          label: Text(
            selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'Select date',),
          onPressed: _selectDate,
        ),
      ],
    );
  }
}