import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hydenflutter/components/mainLayout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool authenticated = false;
  bool loading = true;

  @override
  void initState() {
    debugPrint('Login initState');
    super.initState();
    _authentication();
    //getCurrentUser(context);
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

  Future<void> login(BuildContext context, auth) async {
    debugPrint('call login');
    await _authentication();
    if (authenticated) {
      if (context.mounted) {
        debugPrint('Logined');
        context.go('/pos');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loginWidget = Stack(
      children: [
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
                          child: Image.asset(
                            'assets/images/iget-square.png',
                            width: 200,
                            height: 200,
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
                          controller: username,
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
                          controller: password,
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
                        ElevatedButton(
                            onPressed: () => {login(context, true)},
                            child: const Text('LOGIN'))
                      ]))
                ]))
      ],
    );

    Widget loadingWidget = Container(
        margin: const EdgeInsets.all(15.0),
        child: const Center(child: Text('Loadingaa')));

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 188, 241, 191),
            body: loading ? loadingWidget : loginWidget));
  }
}
