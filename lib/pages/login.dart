import 'package:flutter/material.dart';
import 'package:hydenflutter/views/auth/login.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 188, 241, 191),
            body: LoginView()));
  }
}
