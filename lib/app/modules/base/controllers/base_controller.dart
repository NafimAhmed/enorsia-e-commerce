//import 'dart:convert';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utill/constant.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController

  // String token = "5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";

  var isMenuLoading = false.obs;
  Map<String, dynamic>? apiMenuMap;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    getMenuData();
  }

  Future<void> getMenuData() async {
    isMenuLoading.value = true;
    // print("response start point for menue"
    //     "............");
    var response = await http.get(Uri.parse('${BASE_URL}api/menu')
        // headers: {
        //   'Authorization': 'Bearer $token',
        //   'Cookie':'enorsia_session=UYe4KHLaLEgSY29W7Pn7pYJmDhOsfEPhcnjErTHu',
        // }
        );

    // print("response menu finish test code  ............${response.statusCode}");
    //
    // print("response menu finish test body............${response.body}");

    apiMenuMap = jsonDecode(response.body);
    isMenuLoading.value = false;

    // print("response menu finish ............${response.statusCode}");

    // setState((){
    //   apiMap = jsonDecode(response.body);
    // });
    //print(list?.length);
  }

  void increment() => count.value++;
}
