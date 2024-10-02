import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hydenflutter/views/setting/customer/addNewCustomerDialog.dart';
import 'package:hydenflutter/views/setting/customer/customerSearchView.dart';
import 'package:hydenflutter/views/setting/customer/customerDetialView.dart';

class SettingCustomer extends StatefulWidget {
  const SettingCustomer({super.key});

  @override
  State<SettingCustomer> createState() => _SettingCustomerState();
}

class _SettingCustomerState extends State<SettingCustomer> {
  String selectedCustID = '';

  Future<void> _handleSaveNewCustomer() async {
    safePrint('_handleSaveNewWorkspace');
  }

  Future<void> _clickNewCustomer(BuildContext context) async {
    safePrint('_clickNewWorkspace');
    return await showDialog(
        context: context,
        builder: (context) => NewCustomerDialog(
              onSaveNewCustomer: _handleSaveNewCustomer,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: SizedBox(height: 40, child: Text('Setting Customer')))),
        IntrinsicHeight(
            child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          CustomerSearchView(selectCustID: (data) {
                            setState(() {
                              selectedCustID = data.toString();
                            });
                          })
                        ])))),

            // Text('Row 2'),
            VerticalDivider(
                thickness: 2, width: 10, color: Colors.grey.withOpacity(0.4)),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CustomerDetailView(custID: selectedCustID)
                        ]))))
          ],
        )),
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomRight,
                child: FilledButton(
                  child: const Text('New Customer'),
                  onPressed: () {
                    _clickNewCustomer(context);
                  },
                )))
      ],
    );
  }
}
