import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';
// import 'package:hydenflutter/components/mainLayout.dart';

class SettingCompany extends StatefulWidget {
  const SettingCompany({super.key});

  @override
  State<SettingCompany> createState() => _SettingCompanyState();
}

class _SettingCompanyState extends State<SettingCompany> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        child: Row(children: [
          Text('Setting Company'),
          HDataTable(),
        ]));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
