import 'package:flutter/material.dart';

class SettingInventory extends StatefulWidget {
  const SettingInventory({super.key});

  @override
  State<SettingInventory> createState() => _SettingInventoryState();
}

class _SettingInventoryState extends State<SettingInventory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        child: const Text('Setting Inventory'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
