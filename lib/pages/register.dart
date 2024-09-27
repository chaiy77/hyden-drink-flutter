import 'package:flutter/material.dart';
import 'package:hydenflutter/views/auth/register.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 188, 241, 191),
            body: RegisterView()));
  }
}
