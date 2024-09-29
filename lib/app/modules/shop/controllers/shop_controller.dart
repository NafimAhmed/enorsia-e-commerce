import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utill/constant.dart';

class ShopController extends GetxController {
  RxString slug = "women".obs;
  //TODO: Implement ShopController

  //final String slug1;

  var isShopProductLoading = false.obs;

  var subCategoryName = "".obs;

  RxBool isProductSizeLoading = false.obs;

  RxBool isProductColorsLoading = false.obs;

  Map<String, dynamic>? apiShopProductMap  = {
    // "data" : []
  };

  Map<String, dynamic>? apiShopProductDetailMap = {};

  Map<String, dynamic>? apiProductSizeMap, apiProductColorsMap;
  var isShopProductDetailLoading = false.obs;
  String? size;
  String? productColor;
  RxBool isShopProductDetailByColorLoading = true.obs;
  Map<String, dynamic>? apiShopProductDetailByColorMap;
  RxInt ImageIndex = 0.obs;
  var sortType = "most-relevant".obs;
  var productSearch = "".obs;
  List<String> productName = [];

  // var productDetailName = "raw-edge-short-sleeve-hoodie".obs;

  // String token =
  //     "5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz"; //String token="5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";

  final count = 0.obs;

  //ShopController(this.slug1);

  @override
  void onInit() {
    super.onInit();
    getShopProductData();
    getProductName();

    //getShopProductDetailData();
  }

  void increment() => count.value++;

  Future<void> getShopProductData() async {
    // print("sub category name from menu................." +
    //     subCategoryName.value.toString());

    try {
      isShopProductLoading.value = true;
      // print("response shop detail start point ............");
      var response = await http.post(
          Uri.parse('${BASE_URL}api/category-wise-product'),
          body: {"keyword": "${subCategoryName}"}
        // headers: {
        //   'Authorization': 'Bearer $token',
        // }
      );

      // print("response .....shop detail......." + response.body.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        apiShopProductMap = jsonDecode(response.body);
        // print(
        //     "response .....shop detai by search......." + apiShopProductMap.toString());
        isShopProductLoading.value = false;
      } else {
        isShopProductLoading.value = false;
      }
    } on HttpException {
      isShopProductLoading.value = false;
    }
    finally {
      isShopProductLoading.value = false;
    }
  }


  Future<void> getProductName() async {
    isShopProductLoading.value = true;
    // print("response shop detail start point ............");
    var response = await http.get(
      Uri.parse('${BASE_URL}api/get-product'),
      // headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      for (int i = 0; i < jsonResponse["data"].length; i++) {
        productName.add(jsonResponse["data"][i]["product_name"]);

      }
      isShopProductLoading.value = false;
    } else {
      isShopProductLoading.value = false;
    }

  }

  Future<void> getShopProductDataBySearch() async {
    // print("sub category name from menu................." +
    //     productSearch.value.toString());

    try {
      isShopProductLoading.value = true;
      // print("response shop detail start point ............");
      var response = await http.post(Uri.parse('${BASE_URL}api/search'),
          body: {"keyword": "${productSearch}"}
        // headers: {
        //   'Authorization': 'Bearer $token',
        // }
      );

      // print(
      //     "response .....shop detai by search......." + response.body.toString());

      if (response.statusCode == 200) {
        apiShopProductMap = jsonDecode(response.body);
        //
        // print("response .....shop detai by search......." +
        //     apiShopProductMap.toString());
        isShopProductLoading.value = false;
      } else {
        isShopProductLoading.value = false;
      }
    }  on HttpException {
      isShopProductLoading.value = false;
    }
    finally {
      isShopProductLoading.value = false;

    }
  }

  Future<void> getShopProductDataBySort() async {
    isShopProductLoading.value = true;
    var response = await http.post(
      Uri.parse('${BASE_URL}api/category-wise-product'),
      body: {"keyword": "${subCategoryName}", "sort_by": "${sortType.value}"},
      // headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      apiShopProductMap = jsonDecode(response.body);
      isShopProductLoading.value = false;
    } else {
      isShopProductLoading.value = false;
    }
  }


  Future<void> getDiscountShopProductData() async {
    isShopProductLoading.value = true;
    var response = await http.post(Uri.parse('${BASE_URL}api/discount-product'),
        body: {"keyword": "discount"}
        // headers: {
        //   'Authorization': 'Bearer $token',
        // }
        );

    print("response .....shop discount.......${response.body}");

    if (response.statusCode == 200) {
      apiShopProductMap = jsonDecode(response.body);
      isShopProductLoading.value = false;
    } else {
      isShopProductLoading.value = false;
    }
  }

  Future<void> getShopProductDetailData(String ProductSlug) async {
    print(
        "sub category name from menu.................${subCategoryName.value}");

    print("sub category name from menu.................$ProductSlug");

    isShopProductDetailLoading.value = true;
    print("response shop detail start point ............");
    var response = await http.get(
      Uri.parse(
          "${BASE_URL}api/product-details/$ProductSlug" //raw-edge-short-sleeve-hoodie                              //'${BASE_URL}api/category-wise-product?keyword=${subCategoryName.value}'
          ),
      // headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    apiShopProductDetailMap = jsonDecode(response.body);
    isShopProductDetailLoading.value = false;

    print("response .....shop detail....... for product${response.body}");
  }

  Future<void> addToWishList(String productID) async {
    Map<String, String> wishProductData = {};
    // String accept = "true";
    wishProductData['product_id'] = productID;

    final url = Uri.parse('${BASE_URL}api/customer/add-to-wishlist');

    var response = await http.post(url,
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
        body: json.encode(wishProductData));

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "The item is added to the wish list",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    print(
        "wishlist adding response code--------------------${response.statusCode}");
  }

  Future<void> requestForStock(String productID, String email) async {
    Map<String, String> requstProductData = {};
    // String accept = "true";

    requstProductData['notify_email'] = email;
    requstProductData['notify_product_id'] = productID;
    requstProductData['notify_product_color_id'] = "";
    requstProductData['notify_product_size_id'] = "";

    print("prodicut id.......................$requstProductData");

    final url = Uri.parse('${BASE_URL}api/notify-stock-request');

    var response = await http.post(url,
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
        body: requstProductData);

    print(
        "prodicut id response code.......................${response.statusCode}");

    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "Your request has been submitted",
        colorText: Colors.white,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getShopProductDetailByColorData(
      String styleID, String colorID) async {
    print(
        "Product ID.................$styleID\n Color ID............................$colorID");

    isShopProductDetailByColorLoading.value = true;
    print("response shop detail By Color start point ............");
    var response = await http.get(
      Uri.parse("${BASE_URL}api/product-color-wise-image/$styleID/$colorID"),
    );

    apiShopProductDetailByColorMap = jsonDecode(response.body);
    isShopProductDetailByColorLoading.value = false;

    print("response .....shop detail....... for product${response.body}");
  }

  Future<void> searchProduct(
      String keyword,
      String latestArrival,
      String categoryName,
      String brandName,
      String tagName,
      String sizeName,
      String colorName,
      String fabricName,
      String neckline__name,
      String maxPrice,
      String minPrice,
      String sortBy) async {



    isShopProductLoading.value = true;

    Map<String, String> SearchProductData = {};
    // String accept = "true";
    SearchProductData['keyword'] = keyword;
    SearchProductData['latest_arrival'] = latestArrival;
    SearchProductData['category_name'] = categoryName;
    SearchProductData['brand_name'] = brandName;
    SearchProductData['tag_name'] = tagName;
    SearchProductData['size_name'] = sizeName;
    SearchProductData['color_name'] = colorName;
    SearchProductData['fabric_name'] = fabricName;
    SearchProductData['neckline__name'] = neckline__name;
    SearchProductData['max_price'] = maxPrice;
    SearchProductData['min_price'] = minPrice;
    SearchProductData['sort_by'] = sortBy;

    print("submit data ................$SearchProductData");

    //latest_arrival

    final url = Uri.parse('${BASE_URL}api/category-wise-product');

    var response = await http.post(url,
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
        body: SearchProductData);

    if (response.statusCode == 200) {
      apiShopProductMap = jsonDecode(response.body);

      print("min price ................$apiShopProductMap");

      isShopProductLoading.value = false;
    } else {}
  }

  Future<void> getProductSize(String slug) async {
    // print("sub category name from menu................." +
    //     subCategoryName.value.toString());

    isProductSizeLoading.value = true;
    print("response shop detail start point ............");
    var response = await http.get(
      Uri.parse('${BASE_URL}api/get-color-size-by-department?keyword=$slug'),
      // headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    print("response .....shop detail.......${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      apiProductSizeMap = jsonDecode(response.body);
      size = "${apiProductSizeMap?["size"][0]["size"]}";
      // color="${apiProductSizeMap?["color"][0]["size"]}";

      isProductSizeLoading.value = false;
    } else {
      isProductSizeLoading.value = false;
    }
  }

  Future<void> getProductColors() async {
    // print("sub category name from menu................." +
    //     subCategoryName.value.toString());

    isProductColorsLoading.value = true;
    print("response shop detail start point ............");
    var response = await http.get(
      Uri.parse('${BASE_URL}api/get-color'),
      //         headers: {
      //   'Authorization': 'Bearer $token',
      // }
    );

    print("response .....shop detail.......${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      apiProductColorsMap = jsonDecode(response.body);
      productColor = "${apiProductColorsMap?["data"][2]["e_commerce_color"]}";
      //color="${apiProductColorsMap?["color"][0]["size"]}";

      isProductColorsLoading.value = false;
    } else {
      isProductSizeLoading.value = false;
    }
  }
}
