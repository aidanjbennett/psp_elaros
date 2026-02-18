import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsSubmenu extends StatefulWidget {
  const NotificationSettingsSubmenu({super.key});

  @override
  State<NotificationSettingsSubmenu> createState() => _NotificationSettingsSubmenuState();
}

class _NotificationSettingsSubmenuState extends State<NotificationSettingsSubmenu> {
  var items = ["Notification setting 1", "2nd notification option", "dwajhadwhj"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: ListView.builder(
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
