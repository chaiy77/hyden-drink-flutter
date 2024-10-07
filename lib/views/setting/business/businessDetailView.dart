// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydenflutter/views/setting/business/newBusinessDialog.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/userController.dart';
import 'package:hydenflutter/stores/controller/workplaceController.dart';

class BusinessDetailView extends StatefulWidget {
  final String custID;
  const BusinessDetailView({super.key, this.custID = ''});
  @override
  State<BusinessDetailView> createState() => _BusinessDetailViewState();
}

class _BusinessDetailViewState extends State<BusinessDetailView> {
  final workplace = Get.put(WorkplaceController());

  bool _edit = false;

  @override
  void initState() {
    // debugPrint('PrtoductDetialView -> initState()');
    super.initState();
  }

  Future<void> _createNewBusiness(var value) async {
    debugPrint('_createNewBusiness -> value = ${value.toString()}');

    await workplace.saveWorkplace(
        bName: value['name'],
        bAddress: value['address'],
        bZipcode: value['zipcode'],
        bTelephone: value['telephone']);
    setState(() {
      _edit = false;
    });
  }

  Future<void> _clickCreateNewBusiness(BuildContext context) async {
    debugPrint('_clickCreateNewBusiness');
    return await showDialog(
        context: context,
        builder: (context) => NewBusinessDialog(
            onSaveNewBusiness: (value) => _createNewBusiness(value),
            edit: _edit));
  }

  Future<void> _clickEditBusiness(BuildContext context) async {
    setState(() {
      _edit = true;
    });
    return await showDialog(
        context: context,
        builder: (context) => NewBusinessDialog(
            onSaveNewBusiness: (value) => _createNewBusiness(value),
            edit: _edit));
  }

  Widget BusinessNotFoundWidget() {
    return Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          children: [
            const Text('Please create new Business'),
            const SizedBox(height: 40),
            FilledButton(
                onPressed: () => _clickCreateNewBusiness(context),
                child: const Text('New Business'))
          ],
        ));
  }

  Widget BusinessDetailWidget() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 25, 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 40),
                      child: Text("Business Information"))),
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SvgPicture.asset(
                              'images/home2.svg',
                              width: 200,
                            ),
                          ),
                        ]))),
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Expanded(flex: 2, child: Text('Name')),
                                Expanded(
                                    flex: 3, child: Text(workplace.name.value))
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Expanded(flex: 2, child: Text('Address')),
                                Expanded(
                                    flex: 3,
                                    child: Text(workplace.address.value.isEmpty
                                        ? "-"
                                        : workplace.address.value))
                              ]),
                        ])))
              ]),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FilledButton(
                        child: Text('Edit'),
                        onPressed: () {
                          debugPrint('click edit business');
                          _clickEditBusiness(context);
                        },
                      )))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('PrtoductDetialView -> buildWidget -> id = ${widget.custID}');
    return Obx(() {
      return workplace.id.value.isEmpty
          ? BusinessNotFoundWidget()
          : BusinessDetailWidget();
    });
  }
}
