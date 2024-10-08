import 'dart:convert';
import 'package:get/get.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydenflutter/stores/graphQL/workplace.dart';
import 'package:hydenflutter/stores/controller/userController.dart';

class WorkplaceController extends GetxController {
  final user = Get.find<UserController>();

  var name = ''.obs;
  var id = ''.obs;
  var address = ''.obs;
  var zipcode = ''.obs;
  var telephone = ''.obs;
  var lastAutoSku = ''.obs;
  var igetGateway = ''.obs;
  var isWaitng = false;

  @override
  void onInit() async {
    super.onInit();
    safePrint('WorkplaceController -> OnInit()');
    await getWorkplaceInfo();
  }

  Future<void> saveWorkplace(
      {required String bName,
      String bAddress = '',
      String bZipcode = '',
      String bTelephone = '',
      bool edit = false}) async {
    safePrint(
        '================= workplaceController-> saveWorkplace ========= ');
    final businessData = {
      'userId': user.id.value,
      'name': bName,
      'address': bAddress,
      'zipcode': bZipcode,
      'telephone': bTelephone
    };
    safePrint(businessData);

    try {
      GraphQLOperation query = Amplify.API.mutate(
        request: GraphQLRequest<String>(
            document: edit ? updateWorkplaceGraphQL : saveWorkplaceGraphQL,
            variables: {
              'input': {
                'userId': user.id.value,
                'name': bName,
                'address': bAddress,
                'zipcode': bZipcode,
                'telephone': bTelephone
              }
            }),
      );

      // final result = await query.response;
      final result = await query.response;
      final data = result.data;
      safePrint(data);
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, Object?>();
        id.value = jsonData['saveWorkplace']['id'];
        name.value = jsonData['saveWorkplace']['name'];
        address.value = jsonData['saveWorkplace']['address'] ?? '';
        zipcode.value = jsonData['saveWorkplace']['zipcode'] ?? '';
        telephone.value = jsonData['saveWorkplace']['telephone'] ?? '';
        lastAutoSku.value = jsonData['saveWorkplace']['lastAutoSku'] ?? '';
      }
    } on ApiException catch (e) {
      safePrint('Query user failed $e');
    }
    safePrint('---------------------------------------- ');
  }

  Future<void> getWorkplaceInfo() async {
    final userId = user.id.value;
    safePrint(' ----  getWorkplaceInfo -> userId = $userId');
    try {
      final query = await Amplify.API
          .query(
            request: GraphQLRequest<String>(
                document: getWorkplaceByUserIdGraphQL,
                variables: {'userId': userId}),
          )
          .response;
      // final result = await query.response;
      final data = query.data;
      safePrint('getWorkplaceInfo data $data');
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, Object?>();
        id.value = jsonData['getWorkplaceByUserId']['id'] ?? '';
        name.value = jsonData['getWorkplaceByUserId']['name'] ?? '';
        address.value = jsonData['getWorkplaceByUserId']['address'] ?? '';
        zipcode.value = jsonData['getWorkplaceByUserId']['zipcode'] ?? '';
        telephone.value = jsonData['getWorkplaceByUserId']['telephone'] ?? '';
        lastAutoSku.value =
            jsonData['getWorkplaceByUserId']['lastAutoSku'] ?? '';
      }
    } on ApiException catch (e) {
      safePrint('Query user failed $e');
    }
  }
}
