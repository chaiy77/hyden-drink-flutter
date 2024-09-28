// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hydenflutter/components/table/searchResultTable.dart';

//Mock Data
// import 'package:hydenflutter/stores/mockdata.dart';

class CustomerSearchView extends StatefulWidget {
  final Function(String)? selectCustID;

  const CustomerSearchView({super.key, this.selectCustID});

  @override
  State<CustomerSearchView> createState() => _CustomerSearchViewState();
}

class _CustomerSearchViewState extends State<CustomerSearchView> {
  void viewDetailClick(id) {
    // debugPrint('click $id');
    // debugPrint(mock.toString());
    if (widget.selectCustID != null) {
      widget.selectCustID!(id);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: Container(
                width: double.infinity,
                color: Colors.grey.withOpacity(0.2),
                child: SearchResultTable(callbackFunction: (data) {
                  viewDetailClick(data);
                })))
      ],
    );
  }
}
