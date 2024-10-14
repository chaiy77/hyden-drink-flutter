// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/customerController.dart';

class CustomerDetailView extends StatefulWidget {
  final String custID;

  const CustomerDetailView({super.key, this.custID = ''});

  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _addController;
  late TextEditingController _provinceController;
  late TextEditingController _telController;
  late TextEditingController _zipcodeController;

  final cutomerController = Get.put(CustomerController());

  @override
  void initState() {
    debugPrint('customerDetialView -> initState()');
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _addController = TextEditingController();
    _telController = TextEditingController();
    _provinceController = TextEditingController();
    _zipcodeController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _addController.dispose();
    _telController.dispose();
    _zipcodeController.dispose();

    _provinceController.dispose();
    super.dispose();
  }

  Widget noCustomerFoundWidget() {
    return const Text('No Customer Found');
  }

  Widget CustomerDetailWidget(constext) {
    return FutureBuilder<Map>(
        future: cutomerController.getCustomerInfo(widget.custID),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          final item = snapshot.data;
          if (item != null) {
            // final item = snapshot.data;
            debugPrint('snapShot = ${item.toString()}');
            _idController.text = item['id'].toString();
            _nameController.text = item['name'].toString();
            _addController.text = item['address'].toString();
            _zipcodeController.text = item['zipcode'].toString();
          }
          return Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Customer 's Detail"),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('ID')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _idController,
                            enabled: false,
                          ))
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('Name')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _nameController,
                          ))
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('Address')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _addController,
                          ))
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('Province')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _provinceController,
                          ))
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('Zipcode')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _zipcodeController,
                          ))
                    ]),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(flex: 1, child: Text('Mobile')),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _telController,
                          ))
                    ])
                  ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.custID == '') {
      return noCustomerFoundWidget();
    }
    return Obx(() {
      return CustomerDetailWidget(context);
    });
  }
}
