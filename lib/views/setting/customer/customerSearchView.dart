// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/components/table/searchResultTable.dart';
import 'package:hydenflutter/stores/controller/customerController.dart';

//Mock Data
// import 'package:hydenflutter/stores/mockdata.dart';

class CustomerSearchView extends StatefulWidget {
  final Function(String)? selectCustID;

  const CustomerSearchView({super.key, this.selectCustID});

  @override
  State<CustomerSearchView> createState() => _CustomerSearchViewState();
}

class _CustomerSearchViewState extends State<CustomerSearchView> {
  final customerConteller = Get.put(CustomerController());

  final ScrollController _horizontal = ScrollController();
  final ScrollController _vertical = ScrollController();

  @override
  void initState() {
    // debugPrint('PrtoductDetialView -> initState()');

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // perform post-frame initialization here
      await customerConteller.getCustomerList();
      debugPrint(
          'customer List = ${customerConteller.customerList.toString()}');
    });
  }

  void viewDetailClick(item) {
    debugPrint('click ${item.toString()}');
    // debugPrint(mock.toString());
    if (widget.selectCustID != null) {
      widget.selectCustID!(item['id']);
    }
  }

  Widget searchProductTable() {
    List customerList = customerConteller.customerList;
    List _dataList = [];

    if (customerList.isNotEmpty) {
      for (var item in customerList) {
        final i = {
          "id": item["id"],
          "name": item["name"],
          "province": item["province"]
        };
        _dataList.add(i);
      }
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
          const Text('Search Customer '),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              child: Row(children: [
                const Expanded(
                    flex: 2,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'customer name',
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
              ])),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: SizedBox(
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
          )
        ],
      );
    });
  }
}
