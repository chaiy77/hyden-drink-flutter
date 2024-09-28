import 'package:flutter/material.dart';

class SettingIget extends StatefulWidget {
  const SettingIget({super.key});

  @override
  State<SettingIget> createState() => _SettingIgetState();
}

class _SettingIgetState extends State<SettingIget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50), child: const Text('Setting Iget'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
