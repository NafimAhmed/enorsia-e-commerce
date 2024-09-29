import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../base/views/base_view.dart';
import '../../registration/views/login_view.dart';
import '../../utill/constant.dart';
import '../../utill/sql_helper.dart';
import '../model/cart_model.dart';

class AccountController extends GetxController {
  final count = 0.obs;

  final GetStorage getStorage = GetStorage('app_storage');
  RxInt statusCode = 0.obs;
  RxBool isChecked = false.obs;
  RxBool isUserCartLoading = false.obs;
  RxBool isWishlistChecked = false.obs;
  RxBool isOrderListChecked = false.obs;

  TextEditingController passwordResetController = TextEditingController();

  // String token = "5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";

  // String firstName="";
  // String lastName="";
  // String email="example@gmail.com";
  // String Gender="Male";
  // String birthDay="02/04/1999";
  // String phoneNumber="01797609439";
  var isLoading = false.obs;
  var isCartLoading = false.obs;
  var isWishListLoading = false.obs;
  var isOrderListLoading = false.obs;
  var isOfferLoading = false.obs;

  var cartProduct = CartModel().obs;

  var isPrivacyPolicyLoading = false.obs;
  var isOrderDetailLoading = false.obs;
  var isTermsAndConditionLoading = false.obs;

  RxString shippingCost = "".obs;
  RxInt discountPercent = 0.obs;
  var loginToken = "".obs;

  RxList productCheckoutList = [].obs;

  // var token = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    // getLoginToken();
    // if (loginToken.value.length > 4) {
    //   getUserData();
    // }
    // getUserWishList();
    // getUserOrderList();
    getPrivacyPolicy();
    getReturnPolicy();
    getDeliveryPolicy();
    getContactInfo();
    getOffer();
    getShippingCost();

    //token.value = _getStorage.read("token");
  }

  Map<String, dynamic>? apiOrderDetailMap,
      apiTermsAndConditionMap,
      apiUserInfoMap,
      apiCartMap,
      apiWishListMap,
      apiReturnListMap = {"data": []},
      apiOrderListMap,
      apiUserCartMap,
      apiReturnPolicyMap,
      apiDeliveryPolicyMap,
      apiContactMap,
      apiDiscountMap,
      apiDeliveryCostMap,
      apiOfferMap,
      apiPrivacyPolicyMap;

  void getLoginToken() {
    loginToken.value = getStorage.read('token').toString();
  }

  Future<void> getUserLogout() async {
    isLoading.value = true;

    var response =
        await http.get(Uri.parse('${BASE_URL}api/customer/logout'), headers: {
      'Authorization': 'Bearer ${loginToken.value}',
    });

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"] == 200) {
      getStorage.write("token", "");
      Get.off(() => LoginView());
    }
    isLoading.value = false;
    // debugPrint("response profile.............." + apiUserInfoMap.toString());
  }

  Future<void> getUserDelete() async {
    isLoading.value = true;

    debugPrint("after function call in controller");
    var response =
        await http.get(Uri.parse('${BASE_URL}api/delete-account'), headers: {
      'Authorization': 'Bearer ${loginToken.value}',
    });

    debugPrint("user delete ..........${response.statusCode}");

    debugPrint("user delete ..........${response.body}");

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"] == 200) {
      getStorage.write("token", "");
      Get.off(() => const BaseView());
    }
    isLoading.value = false;
    // debugPrint("response profile.............." + apiUserInfoMap.toString());
  }

  Future<void> getUserData() async {
    isLoading.value = true;

    var response =
        await http.get(Uri.parse('${BASE_URL}api/customer/profile'), headers: {
      'Authorization': 'Bearer ${loginToken.value}',
    });

    apiUserInfoMap = jsonDecode(response.body);
    isLoading.value = false;
    // debugPrint("response profile.............." + apiUserInfoMap.toString());
  }

  Future<void> getPrivacyPolicy() async {
    isPrivacyPolicyLoading.value = true;
    // debugPrint("response start point ............");
    var response = await http.get(
      Uri.parse('${BASE_URL}api/privacy-policy'),
      //         headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiPrivacyPolicyMap = jsonDecode(response.body);
    isPrivacyPolicyLoading.value = false;
    // debugPrint("response ............" + response.statusCode.toString());
  }

  Future<void> getOrderDetail() async {
    isOrderDetailLoading.value = true;
    // debugPrint("response start point ............");
    var response = await http.get(
      Uri.parse('${BASE_URL}api/customer/order-details/10'),
      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiOrderDetailMap = jsonDecode(response.body);
    isOrderDetailLoading.value = false;

    // debugPrint("response ............" + response.statusCode.toString());
  }

  Future<void> getUserWishList() async {
    isWishListLoading.value = true;
    // debugPrint("response start point ............");

    var response = await http.get(
      Uri.parse('${BASE_URL}api/customer/wishlist'),
      //         headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );
    apiWishListMap = jsonDecode(response.body);
    isWishListLoading.value = false;

    // debugPrint("response  ............" + response.statusCode.toString());
  }

  Future<void> getReturnPolicy() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse('${BASE_URL}api/return-policy'),
      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiReturnPolicyMap = jsonDecode(response.body);
    isLoading.value = false;

    // debugPrint("response ............" + response.statusCode.toString());
  }

  Future<void> getDeliveryPolicy() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse('${BASE_URL}api/delivery'),
      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiDeliveryPolicyMap = jsonDecode(response.body);
    isLoading.value = false;

    // debugPrint("response delivery policy ............" +
    //     apiDeliveryPolicyMap.toString());

    // debugPrint("response delivery policy  ............" + response.body.toString());
  }

  Future<void> getContactInfo() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse('${BASE_URL}api/contact'),
      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiContactMap = jsonDecode(response.body);
    isLoading.value = false;

    // debugPrint("response contact ............" + apiContactMap.toString());
  }

  Future<void> getOffer() async {
    isOfferLoading.value = true;
    var response = await http.get(
      Uri.parse('${BASE_URL}api/get-discount-banner'),
      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    // debugPrint("response offer ............" + response.statusCode.toString());

    apiOfferMap = jsonDecode(response.body);
    isOfferLoading.value = false;

    // debugPrint("response offer ............" + apiOfferMap.toString());
  }

  Future<void> getDiscount(String code, String price) async {
    Map<String, String> userData = {};
    userData['code'] = code;
    userData['amount'] = price;
    isLoading.value = true;
    var response = await http.post(
        Uri.parse(
          '${BASE_URL}api/cupon/validate',
        ),
        body: userData
        //     headers: {
        //   'Authorization': 'Bearer $token',
        // }
        );

    apiDeliveryCostMap = jsonDecode(response.body);
    if (apiDeliveryCostMap!["status"].toString() == "error") {
      discountPercent.value = 0;
      Get.snackbar(
        "Status",
        "Invalid coupon !!!",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      discountPercent.value = apiDeliveryCostMap!["data"]["discount"];
    }
    isLoading.value = false;

    // debugPrint("response discount ............" + apiDeliveryCostMap.toString());
  }

  Future<void> getShippingCost() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        '${BASE_URL}api/get-shipping-charge',
      ),

      //     headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );
    //
    // debugPrint("response charge ............" + response.body.toString());

    apiDeliveryCostMap = jsonDecode(response.body);
    // debugPrint("response charge ............" + apiDeliveryCostMap.toString());
    shippingCost.value =
        apiDeliveryCostMap!["data"]["delivery_charge"].toString();
    isLoading.value = false;
  }

  Future<void> doProductCheckout() async {
    isCartLoading.value = true;
    var response = await http.post(
        Uri.parse(
          '${BASE_URL}api/customer/complete-order',
          // 'http://10.81.11.62:8000/api/customer/complete-order',
        ),
        body: jsonEncode(productCheckoutList.value),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${loginToken.value}',
          // 'Authorization': 'Bearer 7|nEUzg5bR0bCmv0X6aCpMIxeKre1KuwGGXYd208zc',
        });

    var jsonResponse = jsonDecode(response.body);
    isCartLoading.value = false;

    if (jsonResponse["status"].toString() == "200") {
      for (int index = 0; index < productCheckoutList.value.length; index++) {
        SQLHelper.deleteItem("${productCheckoutList[index]["product_id"]}");
      }
      Get.snackbar(
        "Success",
        "Your order has been placed",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (jsonResponse["status"].toString() == "201") {
      Get.snackbar(
        "Success",
        "Sorry, We do not have enough stock",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getUserOrderList() async {
    isOrderListLoading.value = true;
    // debugPrint("response start point ............");
    var response = await http.get(
        Uri.parse('${BASE_URL}api/customer/order-list?limit=20'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        });

    debugPrint("response order ............${loginToken.value}");
    debugPrint("response order ............${response.body}");
    if (response.statusCode == 200) {
      apiOrderListMap = jsonDecode(response.body);
      isOrderListLoading.value = false;
    }

    // debugPrint("response order ............" + response.statusCode.toString());
  }

  Future<void> resetPassword() async {
    Map<String, String> resetData = {};
    resetData['email'] = passwordResetController.text;
    // userData['password'] = password;

    // debugPrint("userData" + userData.toString());

    final url = Uri.parse('${BASE_URL}api/customer/reset/password');

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(resetData));

    // debugPrint("Response Code..................." + response.statusCode.toString());
    // debugPrint("Response Code..................." + response.body.toString());

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        getStorage.write('token', "");
        Get.snackbar(
          "Success",
          "Password reset link has been sent",
          colorText: Colors.white,
          backgroundColor: Colors.orangeAccent,
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.off(() => LoginView());
      }
    }
  }

  Future<int> shippingAddAddress(String addressOne, String addressTwo,
      String state, String city, String postCode, String country) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}api/customer/save-edit-shipping-address'),
      headers: {
        'Authorization': 'Bearer ${loginToken.value}',
      },
      body: jsonEncode(<String, String>{
        'address_line_1': addressOne,
        "address_line_2": addressTwo,
        "state": state,
        "town_city": city,
        "post_code": postCode,
        "country": country
      }),
    );

    statusCode.value = response.statusCode;

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "Your shipping address is updated",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // debugPrint("response body ......" + response.body.toString());
    return response.statusCode;
  }

  Future<int> billingAddAddress(String addressOne, String addressTwo,
      String state, String city, String postCode, String country) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}api/customer/save-edit-billing-address'),
      headers: {
        'Authorization': 'Bearer ${loginToken.value}',
      },
      body: jsonEncode(<String, String>{
        'address_line_1': addressOne,
        "address_line_2": addressTwo,
        "state": state,
        "town_city": city,
        "post_code": postCode,
        "country": country
      }),
    );

    statusCode.value = response.statusCode;

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "Your billing addresss is updated",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    debugPrint("response body ......${response.body}");

    return response.statusCode;

    // if (response.statusCode == 200) {
    //   _items.add('reservation');
    // }
    // //notifyListeners();
  }

  // Future<void> getUserCartData() async {
  //   isUserCartLoading.value = true;
  //   debugPrint("response start point ............");
  //   var response = await http
  //       .get(Uri.parse('${BASE_URL}api/customer/cart-list'), headers: {
  //     'Authorization': 'Bearer $token',
  //   });
  //
  //   apiUserCartMap = jsonDecode(response.body);
  //   isUserCartLoading.value = false;
  //
  //   debugPrint("response ..Cart List.........." + response.statusCode.toString());
  //
  //   debugPrint("Response Cart body-------------------------${response.body}");
  //
  //   // setState((){
  //   //   apiMap = jsonDecode(response.body);
  //   // });
  //   //debugPrint(list?.length);
  // }

  // Future<void> getUserCartData() async
  // {
  //
  //   debugPrint("Befor cart fetch");
  //   isCartLoading.value = true;
  //   debugPrint("response start point ............");
  //   var response= await http.get(
  //       Uri.parse('${BASE_URL}api/customer/cart-list'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         "style_color_id":"743",
  //         "product_size_id":"123",
  //         "quantity":"2",
  //         "product_id":"229",
  //       }
  //   );
  //
  //   cartProduct.value = cartModelFromJson(response.body);
  //   debugPrint("cart value from server row json"+response.body.toString());
  //   debugPrint("cart value from server"+cartProduct.value.data!.length.toString());
  //
  //
  //   // apiCartMap=jsonDecode(response.body);
  //   isCartLoading.value = false;
  //
  //
  //   debugPrint("response ............"+response.statusCode.toString());
  //
  //
  //
  //   // setState((){
  //   //   apiMap = jsonDecode(response.body);
  //   // });
  //   //debugPrint(list?.length);
  // }

////////////////////////////////////////////////////////////////////////////

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;

/////////////////////////////////////////////////////////////////////////////////////////

  // Future<String> addAddress(String adddress1,String adddress2,String state,String city,String postCode,String country) async {
  //   var addressResponse=await http.post(
  //     Uri.parse('http://172.31.120.22:8000/api/customer/save-edit-shipping-address'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     body: jsonEncode(<String, String>{
  //       'address_line_1': "${adddress1}",
  //       "address_line_2":"${adddress2}",
  //       "state":"${state}",
  //       "town_city":"${city}",
  //       "post_code":"${postCode}",
  //       "country":"${country}"
  //     }),
  //   );
  //   return addressResponse.statusCode.toString();
  // }
}
