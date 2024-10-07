import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hydenflutter/stores/controller/workplaceController.dart';
import 'package:hydenflutter/utils/tools.dart';

class NewProductDialog extends StatefulWidget {
  final Function onSaveProduct;
  final bool edit;
  const NewProductDialog(
      {super.key, required this.onSaveProduct, required this.edit});

  @override
  State<NewProductDialog> createState() => _NewProductDialogState();
}

class _NewProductDialogState extends State<NewProductDialog> {
//product -> name,sku,type,unit,price,subUnit

  late TextEditingController _nameController;
  late TextEditingController _skuController;
  late TextEditingController _unitController;
  late TextEditingController _priceController;
  late String _type;
  late Map<String, String> _subUnit;

  final workplace = Get.put(WorkplaceController());

  bool _nameValidate = false;
  bool _customSku = false;

  @override
  void initState() {
    debugPrint('_NewProductDialogState -> initState()');
    super.initState();

    _nameController = TextEditingController();
    _skuController = TextEditingController();
    _unitController = TextEditingController();
    _priceController = TextEditingController();

    String _lastSku = generateSKU(workplace.lastAutoSku.value);
    _skuController.text = _lastSku;
  }

  void _setCustomSKU() {
    setState(() {
      _customSku = !_customSku;
    });
  }

  void _clickSaveProduct() {
    Navigator.of(context).pop();
    widget.onSaveProduct('testProduct');

    // setState(() {
    //   _nameValidate = _nameController.text.isEmpty;
    // });

    // if (_nameController.text.isNotEmpty) {
    //   Navigator.of(context).pop();
    //   widget.onSaveNewBusonSaveProductiness({
    //     'name': _nameController.text,
    //     'address': _addressController.text,
    //     'zipcode': _zipcodeController.text,
    //     'telephone': _telController.text
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
            width: 800,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('Business Information'))),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: SvgPicture.asset(
                                  'images/home2.svg',
                                  width: 200,
                                )),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 10, 10),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('Name')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _nameController,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter the Value',
                                                        errorText: _nameValidate
                                                            ? "Value Can't Be Empty"
                                                            : null,
                                                      ),
                                                    )),
                                                const Expanded(
                                                    flex: 1, child: Text('')),
                                              ]),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Expanded(
                                                    flex: 2,
                                                    child: Text('SKU')),
                                                Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      enabled: _customSku,
                                                      textAlignVertical:
                                                          const TextAlignVertical(
                                                              y: 0),
                                                      controller:
                                                          _skuController,
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                              flex: 1,
                                                              child: Checkbox(
                                                                  value:
                                                                      _customSku,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    _setCustomSKU();
                                                                  })),
                                                          const Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                  'auto ')),
                                                        ]))
                                              ]),
                                          // Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.end,
                                          //     children: [
                                          //       const Expanded(
                                          //           flex: 2,
                                          //           child: Text('Zipcode')),
                                          //       Expanded(
                                          //           flex: 3,
                                          //           child: TextField(
                                          //             textAlignVertical:
                                          //                 const TextAlignVertical(
                                          //                     y: 0),
                                          //             controller:
                                          //                 _zipcodeController,
                                          //           )),
                                          //       const Expanded(
                                          //           flex: 1, child: Text('')),
                                          //     ]),
                                          // Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.end,
                                          //     children: [
                                          //       const Expanded(
                                          //           flex: 2,
                                          //           child: Text('Telephone')),
                                          //       Expanded(
                                          //           flex: 3,
                                          //           child: TextField(
                                          //             textAlignVertical:
                                          //                 const TextAlignVertical(
                                          //                     y: 0),
                                          //             controller:
                                          //                 _telController,
                                          //           )),
                                          //       const Expanded(
                                          //           flex: 1, child: Text('')),
                                          //     ]),
                                        ])))
                          ]),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: FilledButton(
                              onPressed: () {
                                _clickSaveProduct();
                              },
                              child: const Text('Save')))
                    ]))));
  }
}
