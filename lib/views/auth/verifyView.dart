import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final TextEditingController verifyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(80, 60, 80, 0),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(flex: 2, child: Text('Verify Code')),
                      Expanded(
                          flex: 6,
                          child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: verifyTextController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ))),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                            onPressed: () => {debugPrint('verify')},
                            child: Text('Verify')),
                      )
                    ],
                  )
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ]));
  }
}
