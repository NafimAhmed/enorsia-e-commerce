import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utill/constant.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  Future<void> OrderComplete(
      String contactNumber, List<Map<String, dynamic>> selectedItems) async {
    Map<String, dynamic> OrderDetail = {};
    String accept = "true";
    OrderDetail['contact_number'] = contactNumber;
    OrderDetail["itemList"] = selectedItems;

    // userData['password'] = password;

    // print("userData" + userData.toString());

    final url = Uri.parse('${BASE_URL}api/customer/complete-order');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(OrderDetail));

    if (response.statusCode == 200) {
      //Navigator.pop(context);
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
}
