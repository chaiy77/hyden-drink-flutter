import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddIgetDeviceDialog extends StatefulWidget {
  final Function onSaveIgetDevice;
  const AddIgetDeviceDialog({super.key, required this.onSaveIgetDevice});

  @override
  State<AddIgetDeviceDialog> createState() => _AddIgetDeviceDialogState();
}

class _AddIgetDeviceDialogState extends State<AddIgetDeviceDialog> {
  late TextEditingController _igetSerialController;

  @override
  void initState() {
    debugPrint('_AddIgetDeviceDialogState -> initState()');
    super.initState();
    _igetSerialController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
            width: 400,
            height: 200,
            child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IGET Device'),
                      Row(children: [
                        Expanded(flex: 2, child: Text('Device Serial')),
                        Expanded(
                            flex: 4,
                            child: TextField(
                              textAlignVertical: TextAlignVertical(y: 0),
                              controller: _igetSerialController,
                            )),
                      ]),
                      Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: FilledButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    widget.onSaveIgetDevice();
                                  },
                                  child: Text('Save'))))
                    ]))));
  }
}
