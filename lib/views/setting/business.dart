import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';
import 'package:hydenflutter/stores/controller/workplaceController.dart';
import 'package:hydenflutter/views/setting/business/newBusinessDialog.dart';
import 'package:hydenflutter/views/setting/business/businessDetailView.dart';

class SettingBusiness extends StatefulWidget {
  const SettingBusiness({super.key});

  @override
  State<SettingBusiness> createState() => _SettingBusinessState();
}

class _SettingBusinessState extends State<SettingBusiness> {
  // final user = Get.put(UserController());
  // final workplace = Get.put(WorkplaceController());

  // Future<void> _createNewBusiness(var value) async {
  //   debugPrint('_createNewBusiness -> value = ${value.toString()}');

  //   await workplace.saveWorkplace(
  //       bName: value['name'],
  //       bAddress: value['address'],
  //       bZipcode: value['zipcode'],
  //       bTelephone: value['telephone']);

  //   debugPrint(workplace.id.value);
  //   debugPrint(workplace.name.value);
  // }

  // Future<void> _clickCreateNewBusiness(BuildContext context) async {
  //   debugPrint('_clickCreateNewBusiness');
  //   return await showDialog(
  //       context: context,
  //       builder: (context) => NewBusinessDialog(
  //           onSaveNewBusiness: (value) => _createNewBusiness(value)));
  // }

  @override
  Widget build(BuildContext context) {
    return const BusinessDetailView();
    // debugPrint(workplace.id.value);
    // return Obx(() {
    //   return workplace.id.value.isEmpty
    //       ? Container(
    //           margin: const EdgeInsets.all(50),
    //           child: Column(
    //             children: [
    //               Text('Please create new Business'),
    //               SizedBox(height: 40),
    //               FilledButton(
    //                   onPressed: () => _clickCreateNewBusiness(context),
    //                   child: Text('New Business'))
    //             ],
    //           ))
    //       : Container(
    //           margin: const EdgeInsets.all(50),
    //           child: Obx(() {
    //             return Column(children: [
    //               Text(workplace.id.value),
    //               Text(workplace.name.value),
    //               HDataTable(),
    //             ]);
    //           }));
    // });
  }
  // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))))
}
