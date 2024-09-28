import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewMachineDialog extends StatefulWidget {
  final Function onSaveNewMachine;
  const NewMachineDialog({super.key, required this.onSaveNewMachine});

  @override
  State<NewMachineDialog> createState() => _NewMachineDialogState();
}

class _NewMachineDialogState extends State<NewMachineDialog> {
  bool? isProduct = false;
  bool? needMaterial = false;
  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _powerController;

  @override
  void initState() {
    debugPrint('_NewMachineDialogState -> initState()');
    super.initState();
    _typeController = TextEditingController();
    _nameController = TextEditingController();
    _powerController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
            width: 600,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: SvgPicture.asset(
                                  'images/image-missing.svg',
                                  width: 200,
                                )),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
                                                Expanded(
                                                    flex: 2,
                                                    child: Text('Name')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _nameController,
                                                    )),
                                                Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Text('Type')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _typeController,
                                                    )),
                                                Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Text('Power')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _powerController,
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text('  kW')),
                                              ]),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Checkbox(
                                                            value: isProduct,
                                                            onChanged:
                                                                (bool? value) {
                                                              debugPrint(
                                                                  'Product ${value.toString()}');
                                                              setState(() {
                                                                isProduct =
                                                                    value;
                                                              });
                                                            })),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                            'Output as Product')),
                                                  ])),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Checkbox(
                                                            value: needMaterial,
                                                            onChanged:
                                                                (bool? value) {
                                                              debugPrint(
                                                                  'Material ${value.toString()}');
                                                              setState(() {
                                                                needMaterial =
                                                                    value;
                                                              });
                                                            })),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                            'Set Material')),
                                                  ]))
                                        ])))
                          ]),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                widget.onSaveNewMachine();
                              },
                              child: Text('Save')))
                    ]))));
  }
}
