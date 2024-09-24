import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class Usercontroller extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var isLoggedIn = false.obs;
  var isWaiting = false.obs;

  @override
  void onInit() {
    super.onInit();
    safePrint('UserController -> OnInit()');
    ever(isLoggedIn, _handleAuthStatus);
  }

  @override
  void onReady() async {
    safePrint('UserController -> Ready()');
    await getCurrentUser();
  }

  void _handleAuthStatus(bool isLoggedIn) {
    if (isLoggedIn) {
      safePrint(
          'UserController -> handleAuthStatus :: isLoggedIn = ${isLoggedIn.toString()}');
    } else {
      safePrint(
          'UserController -> handleAuthStatus :: isLoggedIn = ${isLoggedIn.toString()}');
    }
  }

  Future<void> getCurrentUser() async {
    // https://pub.dev/documentation/amplify_auth_cognito/latest/amplify_auth_cognito/AmplifyAuthCognito/getCurrentUser.html
    try {
      final result = await Amplify.Auth.getCurrentUser();
      safePrint('user = ${result.username}');
      isLoggedIn(true);

      // return true;
    } on AuthException catch (e) {
      safePrint('Could not retrieve current user: ${e.message}');
      isLoggedIn(false);

      // return false;
    }
  }

  Future<void> login() async {
    isWaiting(true);
    // await Future.delayed(const Duration(seconds: 3));
    try {
      safePrint('UserController -> Logging In');
      await Future.delayed(const Duration(seconds: 3));
      setUserName('Test');
      //await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn(true);
    } catch (e) {
      //Get.snackbar('Error', e.toString());
    } finally {
      isWaiting(false);
    }
  }

  void setUserName(String name) {
    username.value = name;
  }
}
