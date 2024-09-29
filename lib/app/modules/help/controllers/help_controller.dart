import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utill/constant.dart';

class HelpController extends GetxController {
  //TODO: Implement HelpController

  var isFAQListLoading=false.obs;
  Map <String, dynamic>? apiFAQListMap;
  String token="5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getFAQList();
  }






  Future<void> getFAQList() async
  {

    isFAQListLoading.value = true;
    print("response start point ............");

    var response= await http.get(
        Uri.parse('${BASE_URL}api/faq'),
        headers: {
          'Authorization': 'Bearer $token',
        }
    );
    apiFAQListMap=jsonDecode(response.body);
    isFAQListLoading.value = false;

    print("response ............"+response.statusCode.toString());

  }




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
