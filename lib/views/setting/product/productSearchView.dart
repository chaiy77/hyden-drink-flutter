// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/searchResultTable.dart';

//Mock Data
// import 'package:hydenflutter/stores/mockdata.dart';

class ProductSearchView extends StatefulWidget {
  final Function(String)? selectCustID;

  const ProductSearchView({super.key, this.selectCustID});

  @override
  State<ProductSearchView> createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView> {
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  void viewDetailClick(id) {
    // debugPrint('click $id');
    // debugPrint(mock.toString());
    if (widget.selectCustID != null) {
      widget.selectCustID!(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var h = screenSize.height;
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
                            child: SearchResultTable(callbackFunction: (data) {
                              viewDetailClick(data);
                            })))))),
      ],
    );
  }
}
