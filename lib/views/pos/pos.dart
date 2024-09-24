import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

// import 'package:hydenflutter/components/mainLayout.dart';

class POSView extends StatefulWidget {
  const POSView({super.key});

  @override
  State<POSView> createState() => _POSViewState();
}

class _POSViewState extends State<POSView> {
  @override
  Widget build(BuildContext context) {
    final user = Get.put(Usercontroller());
    return Obx(() {
      if (user.isWaiting.value) {
        return Text('Waitng');
      } else {
        return Container(
            margin: const EdgeInsets.all(50),
            child: Column(children: [
              Text(user.username.value),
              FilledButton(
                  onPressed: () => user.login(), child: const Text('Click'))
            ]));
        // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
      }
    });
  }
}
