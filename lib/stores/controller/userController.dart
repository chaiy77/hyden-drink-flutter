import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:get/get.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class UserController extends GetxController {
  var username = 'Test'.obs;
  var id = ''.obs;
  var email = ''.obs;
  var isLoggedIn = false.obs;
  var isWaiting = false.obs;
  var verified = false.obs;

  @override
  void onInit() async {
    super.onInit();
    safePrint('UserController -> OnInit()  before getCurrentUser');
    await getCurrentUser();
    safePrint('UserController -> OnInit() after getCurrentUser');
  }

  @override
  void onReady() async {
    safePrint('UserController -> Ready()');
    await fetchCurrentUserAttributes();

    // await getCurrentUser();
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
    safePrint('======== UserController -> getCurrentUser ========');
    // https://pub.dev/documentation/amplify_auth_cognito/latest/amplify_auth_cognito/AmplifyAuthCognito/getCurrentUser.html
    try {
      // final result = await Amplify.Auth.getCurrentUser();

      final result = await Amplify.Auth.getCurrentUser();
      safePrint('user = ${result.userId}');
      id.value = result.userId;
      safePrint('id = $id');

      // username.value = result.signInDetails['username'];
      isLoggedIn.value = true;
      safePrint('getCurrentUser -> isLoggedIn = ${isLoggedIn.toString()}');

      // return true;
    } on AuthException catch (e) {
      safePrint('Could not retrieve current user: ${e.message}');
      isLoggedIn.value = false;
      safePrint('getCurrentUser -> isLoggedIn = ${isLoggedIn.toString()}');
    }
  }

  Future<void> fetchCurrentUserAttributes() async {
    safePrint('======== UserController -> fetchCurrentUserAttributes ========');
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      safePrint('after get userAttributes');
      for (final e in result) {
        switch (e.userAttributeKey.toString()) {
          case 'email':
            email.value = e.value;
        }
      }
      safePrint('getCurrentUser -> email = $email');
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }

  Future<bool> register({
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
        final signUpResult = await _handleRegisterResult(result);
        if (signUpResult) {
          return true;
        } else {
          return false;
        }
      } on AuthException catch (e) {
        safePrint('Error signing up user: ${e.message}');
        return false;
      }
    }
    return false;
  }

  Future<bool> confirmUser(
      {required String username, required String confirmationCode}) async {
    safePrint('=========== UserController -> confirmUser ====== ');
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      // Check if further confirmations are needed or if
      // the sign up is complete.

      safePrint('result = ${result.toString()}');
      safePrint('-----------------------------------');
      if (await _handleRegisterResult(result)) {
        return true;
      }
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
      safePrint('-----------------------------------');
      return false;
    }
    return false;
  }

  Future<bool> _handleRegisterResult(SignUpResult result) async {
    safePrint('signup result handle ');
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        safePrint(codeDeliveryDetails.toString());
        // _handleCodeDelivery(codeDeliveryDetails);
        return true;

      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        return true;
    }
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
      isLoggedIn(true);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
      isLoggedIn(false);
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

  Future<void> signOut() async {
    safePrint('userController -> signOut');
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
      isLoggedIn.value = false;
      Get.offAllNamed('/');
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }

  void setUserName(String name) {
    username.value = name;
  }
}
