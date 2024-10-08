import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/views/setting/product/productSearchView.dart';
import 'package:hydenflutter/views/setting/product/productDetailView.dart';
import 'package:hydenflutter/views/setting/product/newProductDialog.dart';
import 'package:hydenflutter/stores/controller/productController.dart';

class SettingProduct extends StatefulWidget {
  const SettingProduct({super.key});

  @override
  State<SettingProduct> createState() => _SettingProductState();
}

class _SettingProductState extends State<SettingProduct> {
  String selectedCustID = '';
  bool _edit = false;

  final productController = Get.put(ProductController());

  @override
  void initState() {
    // debugPrint('PrtoductDetialView -> initState()');

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // perform post-frame initialization here
      await productController.getAllProductList();
      debugPrint('pProduct List = ${productController.productList.toString()}');
    });
  }

  Future<void> _clickSaveProduct(value) async {
    debugPrint('click _onSaveProductInfo = ${value.toString()}');
    await productController.createProduct(
        sku: value['sku'],
        name: value['name'],
        type: value['type'],
        unit: value['unit'],
        price: value['price'],
        remark: "",
        edit: false);
  }

  Future<void> _clickNewProduct(context) async {
    await showDialog(
        context: context,
        builder: (context) => NewProductDialog(
            onSaveProduct: (value) => _clickSaveProduct(value), edit: _edit));

    setState(() {
      _edit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: SizedBox(height: 40, child: Text('Setting Prtoduct')))),
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
                          ProductSearchView(selectCustID: (data) {
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
                          ProductDetailView(custID: selectedCustID)
                        ]))))
          ],
        )),
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomRight,
                child: FilledButton(
                  child: Text('New Prtoduct'),
                  onPressed: () {
                    debugPrint('click new Prtoduct');
                    _clickNewProduct(context);
                  },
                )))
      ],
    );
  }
}
