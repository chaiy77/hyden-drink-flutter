import 'package:flutter/material.dart';

class SettingEmployee extends StatefulWidget {
  const SettingEmployee({super.key});

  @override
  State<SettingEmployee> createState() => _SettingEmployeeState();
}

class _SettingEmployeeState extends State<SettingEmployee> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        child: const Text('Setting Employee'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
