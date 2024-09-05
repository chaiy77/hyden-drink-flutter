import 'package:flutter/material.dart';

class SettingCustomer extends StatefulWidget {
  const SettingCustomer({super.key});

  @override
  State<SettingCustomer> createState() => _SettingCustomerState();
}

class _SettingCustomerState extends State<SettingCustomer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(50),
        child: const Text('Setting Customer'));
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Pos'))));
  }
}
