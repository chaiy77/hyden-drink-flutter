import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';
// import 'package:hydenflutter/components/mainLayout.dart';

// class POSView extends StatefulWidget {
//   const POSView({super.key});

//   @override
//   State<POSView> createState() => _POSViewState();
// }

// class _POSViewState extends State<POSView> {
class POSView extends StatelessWidget {
  final user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    debugPrint(user.toString());
    debugPrint('================================');

    return Container(
        margin: const EdgeInsets.all(50),
        child: Column(children: [
          FilledButton(
              onPressed: () => Get.toNamed('/report'),
              child: const Text('Click'))
        ]));
    // }
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
