import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';
import 'package:hydenflutter/views/pos/posView.dart';

class PosPage extends StatefulWidget {
  const PosPage({super.key});

  @override
  State<PosPage> createState() => _PosState();
}

class _PosState extends State<PosPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(menuIndex: 0, body: POSView());
  }
}
