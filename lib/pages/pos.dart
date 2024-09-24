import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';
import 'package:hydenflutter/views/pos/pos.dart';

class Pos extends StatefulWidget {
  const Pos({super.key});

  @override
  State<Pos> createState() => _PosState();
}

class _PosState extends State<Pos> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(menuIndex: 0, body: POSView());
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
