// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';

class ProductDetailView extends StatefulWidget {
  final String custID;

  const ProductDetailView({super.key, this.custID = ''});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  //Sampling Datas//////
  final List _tempPackUnitData = [
    {'name': 'โหล', 'gain': '12'},
    {'name': 'แพค', 'gain': '144'},
    {'name': 'กล่อง', 'gain': '1440'}
  ];
  final List<Map> _tempSuppilerData = [
    {'name': 'พิจิตร', 'last order date': '12 ม.ค. 2567', 'price/unit': '15'},
    {'name': 'กนิษฐา', 'last order date': '12 ม.ค. 2567', 'price/unit': '15'},
    {
      'name': 'เลิศศักดิ์',
      'last order date': '12 ม.ค. 2567',
      'price/unit': '15'
    }
  ];
  ///////////////////////

  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _baseUnitController;

  @override
  void initState() {
    // debugPrint('PrtoductDetialView -> initState()');
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _baseUnitController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget noProductFoundWidget() {
    return const Text('No Prtoduct Found');
  }

  Widget ProductDetailWidget() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Prtoduct 's Detail"),
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
                Expanded(flex: 2, child: Text('Base Counting Unit')),
                Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _baseUnitController,
                    ))
              ]),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text('Packing Unit'))),
              Container(
                  width: double.infinity,
                  child: HDataTable(data: _tempPackUnitData)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text('Suppier List'))),
              Container(
                  width: double.infinity,
                  child: HDataTable(data: _tempSuppilerData)),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('PrtoductDetialView -> buildWidget -> id = ${widget.custID}');
    _idController.text = widget.custID;
    if (widget.custID == '') {
      return noProductFoundWidget();
    }
    return ProductDetailWidget();
  }
}
