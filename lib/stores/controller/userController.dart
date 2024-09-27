import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class UserController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var isLoggedIn = false.obs;
  var isWaiting = false.obs;

  @override
  void onInit() {
    super.onInit();
    safePrint('UserController -> OnInit()');
  }

  @override
  void onReady() async {
    safePrint('UserController -> Ready()');
    await getCurrentUser();
    ever(isLoggedIn, _handleAuthStatus);
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

  // Future<void> register() async {
  //   isWaiting(true);
  //   try {
  //     safePrint('UserController -> Register');
  //     await Future.delayed(const Duration(seconds: 3));
  //     setUserName('Test');
  //     //await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     isLoggedIn(true);
  //   } catch (e) {
  //     //Get.snackbar('Error', e.toString());
  //   } finally {
  //     isWaiting(false);
  //   }
  // }

  /// Signs a user up with a username, password, and email. The required
  /// attributes may be different depending on your app's configuration.
  Future<void> register({
    required String email,
    required String password,
  }) async {
    safePrint('======= userController -> Register =============');
    safePrint('email = $email');
    safePrint('password = $password');
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userAttributes = {
          AuthUserAttributeKey.email: email,

          // additional attributes as needed
        };
        final result = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: SignUpOptions(
            userAttributes: userAttributes,
          ),
        );
        await _handleRegisterResult(result);
      } on AuthException catch (e) {
        safePrint('Error signing up user: ${e.message}');
      }
    }
    safePrint(' ========================== ');
  }

  Future<void> login({required String email, required String password}) async {
    isWaiting(true);
    // await Future.delayed(const Duration(seconds: 3));

    try {
      safePrint('UserController -> Logging In');
      safePrint('UserController -> email = $email');
      await Future.delayed(const Duration(seconds: 3));
      // setUserName('Test');
      final result =
          await Amplify.Auth.signIn(username: email, password: password);
      // await _auth.signInWithEmailAndPassword(email: email, password: password);
      safePrint(result.toString());
      await _handleSignInResult(result);
      // isLoggedIn(true);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    } finally {
      isWaiting(false);
    }
  }

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.resetPassword:
        safePrint('AuthSignInStep.resetPassword');
        break;
      case AuthSignInStep.confirmSignInWithTotpMfaCode:
        safePrint('AuthSignInStep.confirmSignInWithTotpMfaCode');
        break;
      case AuthSignInStep.continueSignInWithTotpSetup:
        safePrint('AuthSignInStep.continueSignInWithTotpSetup');
        break;
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
        safePrint('AuthSignInStep.confirmSignInWithSmsMfaCode');
        //final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        //_handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignInStep.confirmSignInWithNewPassword:
        safePrint('Enter a new password to continue signing in');
        break;
      case AuthSignInStep.confirmSignInWithCustomChallenge:
        final parameters = result.nextStep.additionalInfo;
        final prompt = parameters['prompt']!;
        safePrint(prompt);
        break;

      case AuthSignInStep.confirmSignUp:
        safePrint(' AuthSignInStep.confirmSignUp');
        Get.toNamed('/verify');
        // Resend the sign up code to the registered device.
        // final resendResult = await Amplify.Auth.resendSignUpCode(
        //   username: username,
        // );
        // _handleCodeDelivery(resendResult.codeDeliveryDetails);
        break;

      case AuthSignInStep.continueSignInWithMfaSelection:
        safePrint('AuthSignInStep.continueSignInWithMfaSelection');
        break;
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        break;
    }
  }

  Future<void> _handleRegisterResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        safePrint(codeDeliveryDetails.toString());
        // _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        break;
    }
  }

  void setUserName(String name) {
    username.value = name;
  }
}
