import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';
import 'package:hydenflutter/views/setting/manufacture/addIgetDeviceDialog.dart';

class WorkspaceDetailView extends StatefulWidget {
  const WorkspaceDetailView({super.key});

  @override
  State<WorkspaceDetailView> createState() => _WorkspaceDetailViewState();
}

class _WorkspaceDetailViewState extends State<WorkspaceDetailView> {
  void _addIgetDevice() {
    debugPrint('Add IGET Device');
  }

  Future<void> _clickaAddIgetDervice(BuildContext context) async {
    debugPrint('clickAddigetDevice');
    return await showDialog(
        context: context,
        builder: (context) =>
            AddIgetDeviceDialog(onSaveIgetDevice: _addIgetDevice));
  }

  @override
  Widget build(BuildContext context) {
    Widget _machineDetailWidget = Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(flex: 2, child: Text('Name')),
            Expanded(
              flex: 10,
              child: Text('MA-01'),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Text('Type')),
              Expanded(flex: 10, child: Text('PET Blowing Machine'))
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(flex: 2, child: Text('Power')),
            Expanded(flex: 2, child: Text('15')),
            Expanded(flex: 8, child: Text('KW'))
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: Text('IGET Devices')),
                Expanded(flex: 10, child: HDataTable()),
              ]),
          Align(
              alignment: FractionalOffset.bottomRight,
              child: FilledButton(
                  onPressed: () async {
                    await _clickaAddIgetDervice(context);
                  },
                  child: Text('Add IGET Device'))),
        ]));

    return Container(
      // A fixed-height child.

      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
            style: BorderStyle.solid,
          )),
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.blueGrey.withOpacity(0.5),
                        child: SvgPicture.asset(
                          'images/home2.svg',
                          width: 200,
                        ))),
                Expanded(
                  flex: 3,
                  child: _machineDetailWidget,
                )
              ],
            ),
          ]),
    );

    // Divider(thickness: 2, color: Colors.grey.withOpacity(0.4)),
  }
}
