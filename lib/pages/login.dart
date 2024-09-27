import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool authenticated = false;
  bool loading = true;

  final user = Get.put(UserController());

  @override
  void initState() {
    debugPrint('Login initState');
    super.initState();
    _authentication();
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

  Future<void> _authentication() async {
    debugPrint('call _authentication()');
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      authenticated = true;
      loading = false;
    });
  }

  Future<void> login() async {
    debugPrint('call login');
    await user.login(email: 'test@test.com', password: 'password');
    if (user.isLoggedIn.value) {
      Get.offNamed('/pos');
    } else {
      debugPrint('Loging failed');
    }
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
                          child: Text('username')),
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
                            onPressed: () => {login()},
                            // Get.toNamed('/pos')
                            // context.go('/pos'),
                            child: const Text('LOGIN')),
                        SizedBox(width: 40),
                        InkWell(
                          child: const Text('register'),
                          onTap: () => user.register(
                              email: usernameController.text,
                              password: passwordController.text),
                        )
                      ])
                    ]))
              ]))
    ]);

    Widget loadingWidget = Container(
        margin: const EdgeInsets.all(15.0),
        child: const Center(child: Text('Loadingaa')));

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 188, 241, 191),
            body: Obx(() => user.isWaiting.value ? loadingWidget : loginWidget)
            // body: loginWidget));
            ));
  }
}
