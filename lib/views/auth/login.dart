import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hydenflutter/components/waitingWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool authenticated = false;
  bool loading = true;

  final user = Get.put(UserController());

  @override
  void initState() {
    debugPrint('Login initState');
    super.initState();
    // _authentication();
    //getCurrentUser(context);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    Get.toNamed('/register');
  }

  Future<void> _login() async {
    debugPrint('call login');
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      await user.login(
          email: usernameController.text, password: passwordController.text);
      if (user.isLoggedIn.value) {
        Get.offNamed('/pos');
      }
    }
    Get.showSnackbar(const GetSnackBar(
        title: 'LogIn',
        message: 'Invalid username or password',
        backgroundColor: Color.fromARGB(255, 222, 68, 66),
        icon: Icon(Icons.refresh),
        duration: Duration(seconds: 3)));
  }

  @override
  Widget build(BuildContext context) {
    Widget loginWidget = Stack(children: [
      Container(),
      Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          'images/home2.svg',
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('email')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: usernameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('password')),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: passwordController,
                        style: const TextStyle(),
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        ElevatedButton(
                            // onPressed: () => {login(context, true)},
                            onPressed: () => {_login()},
                            // Get.toNamed('/pos')
                            // context.go('/pos'),
                            child: const Text('LOGIN')),
                        SizedBox(width: 40),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Text('Do not have an Account?   '),
                        InkWell(
                            child: const Text('Sign Up'),
                            onTap: () => _onRegister())
                      ]),
                    ]))
              ]))
    ]);

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 188, 241, 191),
            body:
                Obx(() => user.isWaiting.value ? WaitingWidget() : loginWidget)
            // body: loginWidget));
            ));
  }
}
