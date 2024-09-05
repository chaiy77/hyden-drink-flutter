import 'package:flutter/material.dart';

class SettingSuplier extends StatefulWidget {
  const SettingSuplier({super.key});

  @override
  State<SettingSuplier> createState() => _SettingSuplierState();
}

class _SettingSuplierState extends State<SettingSuplier> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50), child: const Text('Setting Suplier'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
