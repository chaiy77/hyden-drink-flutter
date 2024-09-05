import 'package:flutter/material.dart';

class SettingTransport extends StatefulWidget {
  const SettingTransport({super.key});

  @override
  State<SettingTransport> createState() => _SettingTransportState();
}

class _SettingTransportState extends State<SettingTransport> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        child: const Text('Setting Transport'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
