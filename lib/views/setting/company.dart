import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class SettingCompany extends StatefulWidget {
  const SettingCompany({super.key});

  @override
  State<SettingCompany> createState() => _SettingCompanyState();
}

class _SettingCompanyState extends State<SettingCompany> {
  @override
  Widget build(BuildContext context) {
    final user = Get.put(UserController());

    return Container(
        margin: const EdgeInsets.all(50),
        child: Obx(() {
          return Row(children: [
            Text(user.username.value),
            HDataTable(),
          ]);
        }));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
