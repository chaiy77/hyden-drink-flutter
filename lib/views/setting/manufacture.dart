import 'package:flutter/material.dart';
import 'package:hydenflutter/views/setting/manufacture/newWorkspaceDialog.dart';
import 'package:hydenflutter/views/setting/manufacture/workspaceDetailView.dart';
import 'package:hydenflutter/views/setting/manufacture/addIgetDeviceDialog.dart';

class SettingManufacture extends StatefulWidget {
  const SettingManufacture({super.key});

  @override
  State<SettingManufacture> createState() => _SettingManufactureState();
}

class _SettingManufactureState extends State<SettingManufacture> {
  Future<void> _handleSaveNewWorkspace() async {
    debugPrint('After save New machine');
  }

  Future<void> _clickNewMachine(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => NewWorkspaceDialog(
              onSaveNewWorkspace: _handleSaveNewWorkspace,
            ));
  }

  @override
  Widget build(BuildContext context) {
    // Widget machineDetailWidget(int index, String name) {
    //   return Padding(
    //       padding: const EdgeInsets.fromLTRB(50, 10, 20, 0),
    //       child: Column(children: [
    //         Container(
    //           // A fixed-height child.
    //           height: 120.0,
    //           decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.all(
    //                 Radius.circular(10),
    //               ),
    //               border: Border.all(
    //                 width: 1,
    //                 color: Colors.grey.withOpacity(0.2),
    //                 style: BorderStyle.solid,
    //               )),
    //           alignment: Alignment.center,
    //           child: Text('Fixed Height Content $name  ${index.toString()}'),
    //         ),
    //         Divider(thickness: 2, color: Colors.grey.withOpacity(0.4)),
    //       ]));
    // }

    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 20, 20),
        child: Column(children: [
          const SizedBox(height: 50, child: Text('Manufature Setting')),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              for (int i = 0; i < 2; i++) ...[
                WorkspaceDetailView(),
                Divider(thickness: 2, color: Colors.grey.withOpacity(0.4)),
              ]
            ],
          ))),
          SizedBox(
              height: 40,
              child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: FilledButton(
                    child: Text('Add Machine'),
                    onPressed: () async {
                      debugPrint('click new Machine');

                      await _clickNewMachine(context);
                    },
                  )))
        ]));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
