// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/productController.dart';
import 'package:hydenflutter/components/table/searchResultTable.dart';

//Mock Data
// import 'package:hydenflutter/stores/mockdata.dart';

class ProductSearchView extends StatefulWidget {
  final Function(String)? selectProductID;

  const ProductSearchView({super.key, this.selectProductID});

  @override
  State<ProductSearchView> createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView> {
  final productController = Get.put(ProductController());

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  void viewDetailClick(item) {
    debugPrint('click ${item.toString()}');
    // debugPrint(mock.toString());
    String sku = item['sku'];
    if (widget.selectProductID != null) {
      widget.selectProductID!(sku);
    }
  }

  Widget searchProductTable() {
    final _data = productController.productList.value;
    List _dataList = [];

    if (_data.isNotEmpty) {
      _data.forEach((item) {
        final i = {
          "sku": item["sku"],
          "name": item["name"],
          "type": item["type"]
        };
        _dataList.add(i);
      });
    }

    debugPrint(_dataList.toString());

    return SearchResultTable(
        data: _dataList,
        callbackFunction: (item) {
          viewDetailClick(item);
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var h = screenSize.height;
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: 20, child: const Text('Search Prtoduct ')),
          SizedBox(
              height: 100,
              child: Container(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                      child: Row(children: [
                        const Expanded(
                            flex: 2,
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Prtoduct name',
                                    border: OutlineInputBorder()))),
                        SizedBox(
                            width: 160,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: FilledButton(
                                      child: Text('search'),
                                      onPressed: () {
                                        debugPrint('clicked');
                                      },
                                    ))))
                      ])))),
          SizedBox(
              height: h * 0.55,
              child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  controller: _vertical,
                  child: Scrollbar(
                      thumbVisibility: true,
                      trackVisibility: true,
                      controller: _horizontal,
                      notificationPredicate: (notif) => notif.depth == 1,
                      child: SingleChildScrollView(
                          controller: _vertical,
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                              controller: _horizontal,
                              scrollDirection: Axis.horizontal,
                              child: searchProductTable()))))),
        ],
      );
    });
  }
}
