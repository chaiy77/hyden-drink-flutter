import 'package:flutter/material.dart';
import 'package:hydenflutter/views/auth/verifyView.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 188, 241, 191),
            body: VerifyView()));
  }
}
