// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
  late TextEditingController _telController;
  late TextEditingController _tambolController;
  late TextEditingController _amphurController;
  late TextEditingController _provinceController;

  @override
  void initState() {
    debugPrint('customerDetialView -> initState()');
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _addController = TextEditingController();
    _telController = TextEditingController();
    _tambolController = TextEditingController();
    _amphurController = TextEditingController();
    _provinceController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _addController.dispose();
    _telController.dispose();
    _tambolController.dispose();
    _amphurController.dispose();
    _provinceController.dispose();
    super.dispose();
  }

  Widget noCustomerFoundWidget() {
    return const Text('No Customer Found');
  }

  Widget customerDetailWidget() {
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
                Expanded(flex: 1, child: Text('Tambol')),
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _tambolController,
                    ))
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(flex: 1, child: Text('Amphur')),
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _amphurController,
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
                Expanded(flex: 1, child: Text('Mobile')),
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _telController,
                    ))
              ])
            ]));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('customerDetialView -> buildWidget -> id = ${widget.custID}');
    _idController.text = widget.custID;
    if (widget.custID == '') {
      return noCustomerFoundWidget();
    }
    return customerDetailWidget();
  }
}
