import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';

class Pos extends StatefulWidget {
  const Pos({super.key});

  @override
  State<Pos> createState() => _PosState();
}

class _PosState extends State<Pos> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        menuIndex: 0,
        body: Container(
            margin: const EdgeInsets.all(50), child: const Text('Pos')));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
