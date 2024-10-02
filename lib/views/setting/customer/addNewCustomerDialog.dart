import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewCustomerDialog extends StatefulWidget {
  final Function onSaveNewCustomer;
  const NewCustomerDialog({super.key, required this.onSaveNewCustomer});

  @override
  State<NewCustomerDialog> createState() => _NewCustomerDialogState();
}

class _NewCustomerDialogState extends State<NewCustomerDialog> {
  bool? isProduct = false;
  bool? needMaterial = false;
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _zipcodeController;
  late TextEditingController _personController;
  late TextEditingController _telController;

  @override
  void initState() {
    debugPrint('_NewMachineDialogState -> initState()');
    super.initState();
    _addressController = TextEditingController();
    _nameController = TextEditingController();
    _zipcodeController = TextEditingController();
    _personController = TextEditingController();
    _telController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
            width: 800,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('New Customer'))),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: SvgPicture.asset(
                                  'images/home2.svg',
                                  width: 200,
                                )),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 10, 10),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('Name')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _nameController,
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('Address')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _addressController,
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('Zipcode')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _zipcodeController,
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child:
                                                        Text('Contact Person')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _personController,
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('Telephone')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _telController,
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                        ])))
                          ]),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                widget.onSaveNewCustomer();
                              },
                              child: const Text('Save')))
                    ]))));
  }
}
