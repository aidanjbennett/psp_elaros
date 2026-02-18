import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColourSettingsSubmenu extends StatefulWidget {
  const ColourSettingsSubmenu({super.key});

  @override
  State<ColourSettingsSubmenu> createState() => _ColourSettingsSubmenuState();
}

class _ColourSettingsSubmenuState extends State<ColourSettingsSubmenu> {
  var items = ["Colour option 1", "Colour 2", "Colour 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colour"),
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
