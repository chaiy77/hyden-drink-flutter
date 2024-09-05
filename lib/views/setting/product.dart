import 'package:flutter/material.dart';

class SettingProduct extends StatefulWidget {
  const SettingProduct({super.key});

  @override
  State<SettingProduct> createState() => _SettingProductState();
}

class _SettingProductState extends State<SettingProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50), child: const Text('Setting Product'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
