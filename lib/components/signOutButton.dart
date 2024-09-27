import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class SignOutButton extends StatelessWidget {
  final user = Get.put(UserController());
  void _signOut() {
    user.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () => _signOut(), child: Text('Sign Out'));
  }
}
