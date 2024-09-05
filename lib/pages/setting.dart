import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydenflutter/components/mainLayout.dart';
import 'package:hydenflutter/views/setting/company.dart';
import 'package:hydenflutter/views/setting/customer.dart';
import 'package:hydenflutter/views/setting/employee.dart';
import 'package:hydenflutter/views/setting/inventory.dart';
import 'package:hydenflutter/views/setting/product.dart';
import 'package:hydenflutter/views/setting/supplier.dart';
import 'package:hydenflutter/views/setting/transport.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        menuIndex: 3, // sidebar index
        body: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(child: Text('Company')),
                  Tab(child: Text('Products')),
                  Tab(child: Text('Employees')),
                  Tab(child: Text('Supliers')),
                  Tab(child: Text('Customers')),
                  Tab(child: Text('Transport')),
                ],
              ),
              title: Text('Setting'),
            ),
            body: TabBarView(
              children: [
                SettingCompany(),
                SettingProduct(),
                SettingEmployee(),
                SettingCustomer(),
                SettingSuplier(),
                SettingTransport()
              ],
            ),
          ),
        )
        // Container(
        //     margin: const EdgeInsets.all(50),
        //     child:
        //     const Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text('Company\'s detail'),
        //           Text('Products'),
        //           Padding(
        //               padding: EdgeInsets.only(left: 20),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text('Product'),
        //                   Text('Material'),
        //                   Text('Misc'),
        //                 ],
        //               )),
        //           Text('Customers'),
        //           Text('Suppliers'),
        //           Text('Employees'),
        //           Text('Production'),
        //           Padding(
        //               padding: EdgeInsets.only(left: 20),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text('Machines'),
        //                   Text('Sensors'),
        //                 ],
        //               )),
        //           Text('Inventory'),
        //           Text('Transport'),
        //         ]
        //         )
        //         )
        );
    // return const SafeArea(child: Scaffold(body: Center(child: Text('Setting'))));
  }
}
