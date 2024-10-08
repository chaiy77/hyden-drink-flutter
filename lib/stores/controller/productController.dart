import 'dart:convert';

import 'package:get/get.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydenflutter/stores/graphQL/product.dart';
import 'package:hydenflutter/stores/controller/userController.dart';
import 'package:hydenflutter/stores/controller/workplaceController.dart';
import 'package:hydenflutter/stores/graphQL/product.dart';

class ProductController extends GetxController {
  final user = Get.find<UserController>();
  final workplace = Get.find<WorkplaceController>();

  var selectedProduct = {}.obs;
  var productList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    safePrint('ProductController -> OnInit()');
  }

  Future<void> createProduct(
      {required String sku,
      required String name,
      required String type,
      required String unit,
      required double price,
      String remark = "",
      required bool edit}) async {
    safePrint('ProductController -> createProduct()');

    final userId = user.id.value;
    final workplaceId = workplace.id.value;

    final productData = {
      'userId': userId,
      'workplaceId': workplaceId,
      'id': sku,
      'name': name,
      'type': type,
      'unit': unit,
      'price': price,
      'remark': remark
    };
    safePrint(productData.toString());
    try {
      GraphQLOperation query = Amplify.API.mutate(
        request: GraphQLRequest<String>(
            //document: edit ? updateWorkplaceGraphQL : saveWorkplaceGraphQL,
            document: createProductGraphQL,
            variables: {'input': productData}),
      );
      final result = await query.response;
      final data = result.data;
      safePrint('createNewProduct result = ${data.toString()}');
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, Object?>();
        selectedProduct.value = {
          sku: jsonData['createNewProduct']['id'],
          name: jsonData['createNewProduct']['name'],
          type: jsonData['createNewProduct']['type'] ?? '',
          unit: jsonData['createNewProduct']['unit'] ?? '',
          price: jsonData['createNewProduct']['price'] ?? '',
          remark: jsonData['createNewProduct']['remark'] ?? '',
        };
      }
    } on ApiException catch (e) {
      safePrint('Query user failed $e');
    }
    safePrint('---------------------------------------- ');
  } // end of saveNewProduct()

  Future<void> getAllProductList() async {
    safePrint(' ----  getAllProductList -> ');
    final workplaceId = workplace.id.value;
    try {
      final query = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
                document: getAllProductListGraphQL,
                variables: {'workplaceId': workplaceId}),
          )
          .response;
      // final result = await query.response;
      final data = query.data;
      // safePrint('getAllProductList result ${data.toString()}');
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, List<Object?>>();
        final List list = jsonData['getProductList'];
        productList.value = list;
      }
    } on ApiException catch (e) {
      safePrint('Query user failed $e');
    }
  }
}// end of class ProductController
