import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utill/constant.dart';

class RegistrationProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  final GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic> doRegistration(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String refererCode) async {
    Map<String, String> userData = {};
    String accept = "true";
    userData['first_name'] = firstName;
    userData['last_name'] = lastName;
    userData['email'] = email;
    userData['password'] = password;
    userData['confirm_password'] = confirmPassword;
    userData['referer_code'] = refererCode;
    userData['accept'] = accept;

    // print("userData" + userData.toString());
    //
    final url = Uri.parse('${BASE_URL}api/customer/register');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData));

    // print("Response Code..................." + response.statusCode.toString());
    // print("Response Code..................." + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          String token = jsonResponse['token'].toString();
          await saveToken(token);
          // print("Response ..................." + jsonResponse.toString());
          return true;
        } else if (jsonResponse['status'] == 400) {
          Get.snackbar(
            "Error",
            jsonResponse['message'],
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        // print(e.toString());
      }
    } else {
      return false;
    }
  }

  Future<bool> doSignInWithApple({
    String? firstName,
    String? lastName,
    String? email,
    String? appleId,
    required Map<String, dynamic> appleObj,
  }) async {
    Map<String, dynamic> userData = {};
    userData['first_name'] = firstName;
    userData['last_name'] = lastName;
    userData['email'] = email;
    userData['apple_id'] = appleId;
    userData['apple_obj'] = appleObj;
    debugPrint("requestObj:$userData");
    final url = Uri.parse('${BASE_URL}api/login-with-social');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData));

    debugPrint(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          String token = jsonResponse["authorisation"]['token'].toString();
          await saveToken(token);
          return true;
        } else if (jsonResponse['status'] == 400) {
          Get.snackbar(
            "Error",
            jsonResponse['message'],
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
          return false;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> doSignInWithGoogle(
    String? firstName,
    String? lastName,
    String? email,
  ) async {
    Map<String, dynamic> userData = {};
    userData['first_name'] = firstName;
    userData['last_name'] = lastName;
    userData['email'] = email;

    debugPrint("requestObj:$userData");
    final url = Uri.parse('${BASE_URL}api/login-with-social');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData));

    debugPrint("response body ....${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          String token = jsonResponse["authorisation"]['token'].toString();
          await saveToken(token);
          return true;
        } else if (jsonResponse['status'] == 400) {
          Get.snackbar(
            "Error",
            jsonResponse['message'],
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
          return false;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<dynamic> doLogIn(String email, String password) async {
    Map<String, String> userData = {};
    String accept = "true";
    userData['email'] = email;
    userData['password'] = password;

    // print("userData" + userData.toString());

    final url = Uri.parse('${BASE_URL}api/customer/login');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData));

    debugPrint("Response Code...................${response.statusCode}");
    // print("Response Code..................." + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      try {
        if (jsonResponse['status'] == 200) {
          String token = jsonResponse['token'].toString();
          await saveToken(token);

          // print("Response ..................." + jsonResponse.toString());
          return true;
        } else if (jsonResponse['status'] == 400) {
          Get.snackbar(
            "Error",
            jsonResponse['message'],
            colorText: Colors.white,
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        // print(e.toString());
      }
    } else {
      return false;
    }
  }

  saveToken(
    String token,
  ) async {
    await _getStorage.write('token', token);
    debugPrint("token............." + _getStorage.read("token"));
  }
}
