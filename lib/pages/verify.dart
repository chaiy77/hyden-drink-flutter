import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';
import 'package:hydenflutter/views/auth/verifyView.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 188, 241, 191),
            body: VerifyView()));
  }
}
