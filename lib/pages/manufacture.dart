import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';

class ManufacturePage extends StatefulWidget {
  const ManufacturePage({super.key});

  @override
  State<ManufacturePage> createState() => _ManufactureState();
}

class _ManufactureState extends State<ManufacturePage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        menuIndex: 1,
        body: Container(
            margin: const EdgeInsets.all(50),
            child: const Text('Manufacture')));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
