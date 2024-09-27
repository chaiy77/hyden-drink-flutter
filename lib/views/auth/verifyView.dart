import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class VerifyView extends StatelessWidget {
  VerifyView({super.key});
  final TextEditingController verifyTextController = TextEditingController();

  final UserController user = Get.put(UserController());

  Future<void> _onConfirmUser() async {
    final username = user.username.value;
    final code = verifyTextController.text;
    if (verifyTextController.text.isNotEmpty) {
      final bool result =
          await user.confirmUser(username: username, confirmationCode: code);

      safePrint('======== VerifyView -> onConfirmUser ===========');
      safePrint(result.toString());
      safePrint('----------------------------------------------------');
      if (result) {
        user.verified.value = true;
        user.email.value = username;
        user.username.value = username;
        Get.offAllNamed('/pos');
      } else {
        Get.showSnackbar(const GetSnackBar(
            title: 'User Confirmation',
            message: 'Error maybe worng verify code',
            backgroundColor: Color.fromARGB(255, 222, 68, 66),
            icon: Icon(Icons.refresh),
            duration: Duration(seconds: 3)));
      }
      verifyTextController.text = '';
    } else {
      Get.showSnackbar(const GetSnackBar(
          title: 'User Confirmation',
          message:
              'Something when wrong, please try agiain or need to new register',
          backgroundColor: Color.fromARGB(255, 222, 68, 66),
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3)));
    }
  }

  @override
  Widget build(BuildContext context) {
    safePrint('====== VerifyView ==========');
    safePrint(user.username.value);
    safePrint('--------------------------------');
    return Padding(
        padding: EdgeInsets.fromLTRB(80, 60, 80, 0),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text('Verify Code'))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: verifyTextController,
                        autofocus: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: FilledButton(
                              onPressed: () => _onConfirmUser(),
                              child: Text('Verify')))),
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ]));
  }
}
