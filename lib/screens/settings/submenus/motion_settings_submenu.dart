import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotionSettingsSubmenu extends StatefulWidget {
  const MotionSettingsSubmenu({super.key});

  @override
  State<MotionSettingsSubmenu> createState() => _MotionSettingsSubmenuState();
}

class _MotionSettingsSubmenuState extends State<MotionSettingsSubmenu> {
  var items = ["Motion 1", "Motion 2", "Motion 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motion"),
      ),
      body : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
