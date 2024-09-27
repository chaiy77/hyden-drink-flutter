import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportState();
}

class _ReportState extends State<ReportPage> {
  final user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        menuIndex: 2,
        body: Container(
            margin: const EdgeInsets.all(50), child: const Text('Report')));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Report'))));
  }
}
