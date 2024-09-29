import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../routes/app_pages.dart';
import '../../base/views/base_view.dart';
import '../../utill/constant.dart';
import '../../utill/loading.dart';
import '../providers/registration_provider.dart';
import '../views/login_view.dart';

class RegistrationController extends GetxController {
  final count = 0.obs;

  RxBool isChecked = false.obs;

  var passwordVisible = false.obs;

  var confirmPasswordVisible2 = false.obs;

  var firstName = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var referCode = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;

    var status = await RegistrationProvider().doRegistration(
        firstName.value.toString(),
        lastName.value.toString(),
        email.value.toString(),
        password.value.toString(),
        confirmPassword.value.toString(),
        referCode.value.toString());

    // print("reg status ..........." + status.toString());

    if (status == true) {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Registration Successful",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.off(() => LoginView());
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not Register",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInUser() async {
    showLoader();
    var logInStatus =
        await RegistrationProvider().doLogIn(email.value, password.value);
    if (logInStatus == true) {
      dismissLoader();
      Get.offNamed(Routes.BASE);
    } else {
      dismissLoader();
      Get.snackbar(
        "Error",
        "Could not log in",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;

    print("start google signin");

    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      // Trigger the Google Authentication flow.
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // Obtain the Google Authentication credential.
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      // Create a Firebase credential using the Google Authentication credential.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in to Firebase with the Firebase credential.
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Print the user's display name and email address.
      final User user = userCredential.user!;

      print("user-------------------------------------${user.email}");

      if (user.email != null) {
        showLoader();

        var status = await RegistrationProvider().doSignInWithGoogle(
          user.displayName.toString(),
          lastName.value.toString(),
          user.email.toString(),
        );

        debugPrint("response body ....$status");

        if (status == true) {
          dismissLoader();

          Get.off(() => const BaseView());
        } else {
          dismissLoader();
          Get.snackbar(
            "Error",
            "Could not log in",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }

      print('User signed in: ${user.phoneNumber} (${user.email})');
    } catch (e) {
      isLoading.value = false;
      print('Error signing in with Google: $e');
    }
  }

  Future<void> signInWithApple() async {
    showLoader();
    //Sign In with apple Start
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    //Sign In with apple End
    //Sign In with db.
    final regProfiver = RegistrationProvider();

    Map<String, dynamic> appleObj = {
      'authorizationCode': credential.authorizationCode,
      'email': credential.email,
      'familyName': credential.familyName,
      'givenName': credential.givenName,
      'identityToken': credential.identityToken,
      'state': credential.state,
      'userIdentifier': credential.userIdentifier,
    };
    final bool response = await regProfiver.doSignInWithApple(
      firstName: credential.givenName,
      lastName: credential.familyName,
      email: credential.email,
      appleId: credential.userIdentifier,
      appleObj: appleObj,
    );
    if (response) {
      dismissLoader();

      Get.offNamed(Routes.BASE);
    } else {
      dismissLoader();
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    Map<String, String> resetData = {};
    String accept = "true";
    resetData['email'] = email;
    // userData['password'] = password;

    // print("userData" + userData.toString());

    final url = Uri.parse('${BASE_URL}api/customer/reset/password');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(resetData));

    // print("Response Code..................." + response.statusCode.toString());
    // print("Response Code..................." + response.body.toString());

    if (response.statusCode == 200) {
      Navigator.pop(context);
      Get.snackbar(
        "Success",
        "A link has been sent to your email",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    print(
        "Password reset response code--------------------${response.statusCode}");
    //var jsonResponse = jsonDecode(response.body);

    // try {
    //   if (jsonResponse['status'] == 200) {
    //     String token = jsonResponse['token'].toString();
    //     await saveToken(token);
    //     // print("Response ..................." + jsonResponse.toString());
    //     return true;
    //   } else if (jsonResponse['status'] == 400) {
    //     Get.snackbar(
    //       "Error",
    //       jsonResponse['message'],
    //       colorText: Colors.white,
    //       backgroundColor: Colors.red,
    //       snackPosition: SnackPosition.BOTTOM,
    //     );
    //   }
    // } catch (e) {
    //   // print(e.toString());
    // }

    // } else {
    //   // return false;
    // }
  }

  void increment() => count.value++;
}
