// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/components/table/hdatatable.dart';
import 'package:hydenflutter/stores/controller/productController.dart';
import 'package:hydenflutter/components/waitingWidget.dart';

class ProductDetailView extends StatefulWidget {
  final String productID;

  const ProductDetailView({super.key, this.productID = ''});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final _product = Get.put(ProductController());
  bool _edit = false;

  //Sampling Datas//////
  // final List _tempPackUnitData = [
  //   {'name': 'โหล', 'gain': '12'},
  //   {'name': 'แพค', 'gain': '144'},
  //   {'name': 'กล่อง', 'gain': '1440'}
  // ];
  // final List<Map> _tempSuppilerData = [
  //   {'name': 'พิจิตร', 'last order date': '12 ม.ค. 2567', 'price/unit': '15'},
  //   {'name': 'กนิษฐา', 'last order date': '12 ม.ค. 2567', 'price/unit': '15'},
  //   {
  //     'name': 'เลิศศักดิ์',
  //     'last order date': '12 ม.ค. 2567',
  //     'price/unit': '15'
  //   }
  // ];
  ///////////////////////

  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _baseUnitController;
  late TextEditingController _priceController;

  @override
  void initState() {
    // debugPrint('PrtoductDetialView -> initState()');
    super.initState();
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _baseUnitController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _baseUnitController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Widget noProductFoundWidget() {
    return const Text('No Prtoduct Found');
  }

  Widget ProductDetailWidget(context) {
    // await _product
    // await _product.getProductInfo(widget.productID);
    return FutureBuilder<Map>(
        future: _product.getProductInfo(widget.productID),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          final item = snapshot.data;
          if (item != null) {
            // final item = snapshot.data;
            debugPrint('snapShot = ${item.toString()}');
            _idController.text = item['sku'].toString();
            _nameController.text = item['name'].toString();
            _baseUnitController.text = item['unit'].toString();
            _priceController.text = item['price'].toString();
            return Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Prtoduct 's Detail"),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(flex: 1, child: Text('SKU')),
                            Expanded(
                                flex: 3,
                                child: TextField(
                                    controller: _idController, enabled: false))
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Expanded(flex: 1, child: Text('Name')),
                            Expanded(
                                flex: 3,
                                child: TextField(
                                    controller: _nameController,
                                    enabled: _edit))
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Expanded(
                                flex: 2, child: Text('Base Counting Unit')),
                            Expanded(
                                flex: 3,
                                child: TextField(
                                    controller: _baseUnitController,
                                    enabled: _edit))
                          ]),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Divider()),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text('Packing Unit'))),
                      SizedBox(
                          width: double.infinity,
                          child: HDataTable(
                              data: const [])), //  _tempPackUnitData)),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text('Suppier List'))),
                      SizedBox(
                          width: double.infinity,
                          child: HDataTable(
                              data: const [])), // _tempSuppilerData)),
                    ]));
          } else {
            return const Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()])
                ]));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('PrtoductDetialView -> buildWidget -> id = ${widget.productID}');
    //final selectedProduct = _product.selectedProduct.value;
    // if (selectedProduct.isEmpty) {
    //   return noProductFoundWidget();
    // }
    // return ProductDetailWidget();
    // _idController.text = widget.productID;
    if (widget.productID == '') {
      return noProductFoundWidget();
    } else {
      // setState(() {
      //   _isWating = true;
      // });

      return ProductDetailWidget(context);
    }
  }
}
