import 'dart:convert';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
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
  var igetGateway = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    safePrint('WorkplaceController -> OnInit()  before getCurrentUser');
    // await getCurrentUser();

    safePrint('WorkplaceController -> OnInit() after getCurrentUser');
  }

  Future<void> saveWorkplace(
      {required String bName,
      String bAddress = '',
      String bZipcode = '',
      String bTelephone = ''}) async {
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
      final query = Amplify.API.mutate(
        request:
            GraphQLRequest<String>(document: saveWorkplaceGraphQL, variables: {
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

      safePrint('---- after saveWorkplace ------');
      final result = await query.response;
      final data = result.data;
      safePrint(data);
      if (data != null) {
        Map jsonData = (json.decode(data) as Map).cast<String, Object?>();
        id.value = jsonData['saveWorkplace']['id'];
        name.value = jsonData['saveWorkplace']['name'];
        address.value = jsonData['saveWorkplace']['address'] ?? '';
        zipcode.value = jsonData['saveWorkplace']['zipcode'] ?? '';
      }
    } on ApiException catch (e) {
      safePrint('Query user failed $e');
    }
    safePrint('---------------------------------------- ');
  }
}
