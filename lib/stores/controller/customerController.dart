// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:get/get.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydenflutter/stores/graphQL/customerGraphQl.dart';
import 'package:hydenflutter/stores/controller/workplaceController.dart';

class CustomerController extends GetxController {
  // final user = Get.find<UserController>();
  final workplace = Get.find<WorkplaceController>();

  var selectedCustomer = {}.obs;
  var customerList = [].obs;

  @override
  void onInit() async {
    super.onInit();
    safePrint('============ CustomerController -> OnInit() =========');
    // await getCustomerList();
    safePrint('------------------------------------------------------');
  }

  Future<bool> createCustomer(
      {required String name,
      required String id,
      String address = '',
      String province = '',
      String zipcode = '',
      String contactPerson = '',
      String telephone = '',
      String remark = '',
      required bool edit}) async {
    safePrint(' =======  CustomerController -> createCustomer() ========= ');

    final workplaceId = workplace.id.value;

    final customerData = {
      'workplaceId': workplaceId,
      'id': id,
      'name': name,
      'address': address,
      'province': province,
      'zipcode': zipcode,
      'contactPerson': contactPerson,
      'telephone': telephone,
      'remark': remark
    };
    safePrint('Customer Data = ${customerData.toString()}');
    try {
      // GraphQLOperation query = Amplify.API.mutate(
      //   request: GraphQLRequest<String>(
      //       //document: edit ? updateWorkplaceGraphQL : saveWorkplaceGraphQL,
      //       document: createCustomerGraphQL,
      //       variables: {'input': customerData}),
      // );
      // final result = await query.response;
      // final data = result.data;
      // safePrint('createCustomer result = ${data.toString()}');
      await getCustomerList();
      return true;
      // if (data != null) {
      //   Map jsonData = (json.decode(data) as Map).cast<String, Object?>();
      //   selectedCustomer.value = {
      //     name: jsonData['createCustomer']['name'],
      //     address: jsonData['createCustomer']['address'] ?? '',
      //     province: jsonData['createCustomer']['province'] ?? '',
      //     zipcode: jsonData['createCustomer']['zipcode'] ?? '',
      //     telephone: jsonData['createCustomer']['telephone'] ?? '',
      //     remark: jsonData['createCustomer']['remark'] ?? '',
      //   };
      //   await getCustomerList();
      //   return true;
      // }
    } on ApiException catch (e) {
      safePrint('Create Customer failed $e');
      return false;
    }
    safePrint('---------------------------------------- ');
    return false;
  } // end of createCustomer()

  Future<void> getCustomerList() async {
    safePrint(' ----  getCustomerList  -> ');
    final workplaceId = workplace.id.value;
    try {
      final query = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
                document: getCustomerListGraphQL,
                variables: {'workplaceId': workplaceId}),
          )
          .response;
      // final result = await query.response;
      final data = query.data;
      safePrint('getCustomerList result ${data.toString()}');
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, List<Object?>>();
        final List list = jsonData['getCustomerList'];
        customerList.value = list;
      }
    } on ApiException catch (e) {
      safePrint('Query getCustomerList failed $e');
    }
  } // end of getCustomerList

  Future<Map> getCustomerInfo(customerId) async {
    safePrint(' ----  getCustomerInfo -> --// ');
    final workplaceId = workplace.id.value;
    // prodId = "A-00001";
    safePrint(' ----  workplaceId = $workplaceId , customerId = $customerId ');
    try {
      final query = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
                document: getCustomerInfoGraphQL,
                variables: {"workplaceId": workplaceId, "id": customerId}),
          )
          .response;
      // final result = await query.response;
      final data = query.data;
      safePrint('getCustomerInfo result ${data.toString()}');
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, dynamic>();
        final _customer = jsonData['getCustomerInfo'];
        safePrint('customer Info = ${_customer.toString()}');
        // await Future.delayed(Duration(seconds: 5));
        return _customer;
      }
    } on ApiException catch (e) {
      safePrint('Query getCustomerInfo failed $e');
    }
    return {};
  } // end of getCustomerInfo
}// end of class CustomerController

