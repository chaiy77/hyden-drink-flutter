import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:hydenflutter/views/setting/Prtoduct/addNewPrtoductView.dart';
import 'package:hydenflutter/views/setting/product/productSearchView.dart';
import 'package:hydenflutter/views/setting/product/productDetailView.dart';

class SettingProduct extends StatefulWidget {
  const SettingProduct({super.key});

  @override
  State<SettingProduct> createState() => _SettingProductState();
}

class _SettingProductState extends State<SettingProduct> {
  String selectedCustID = '';

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
                  },
                )))
      ],
    );
  }
}
