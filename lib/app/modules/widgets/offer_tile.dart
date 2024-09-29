import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../account/controllers/account_controller.dart';
import '../shop/controllers/shop_controller.dart';
import '../shop/views/shop_view.dart';
import '../utill/app_size.dart';
import '../utill/constant.dart';

Widget getOfferTile(String view) {
  AccountController controller = Get.put(AccountController());

  ShopController shopController = Get.put(ShopController());
  controller.getOffer();
  return view == "home"
      ? Container(
          child: Obx(() => controller.isOfferLoading.value == true
              ? Center(
                  child: Lottie.asset("assets/json/loading.json",
                      fit: BoxFit.cover,
                      height: screenHeight * 0.095,
                      width: screenWidth * 0.095),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        shopController.slug.value == "";
                        shopController.subCategoryName.value = "";
                        shopController.getDiscountShopProductData();
                        Get.to(() => ShopView());
                      },
                      child: ClipRRect(
                          // borderRadius: BorderRadius.circular(12.0),
                          child: FadeInImage(
                        image: NetworkImage(IMAGE_HEADER +
                            controller.apiOfferMap!["data"]
                                    ["discount_banner_image"]
                                .toString()),
                        placeholder: const AssetImage(
                            'assets/images/placeholder_image.png'),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/placeholder_image.png",
                            height: screenHeight * 0.12,
                            width: screenWidth,
                            fit: BoxFit.cover,
                          );
                        },
                        height: screenHeight * 0.12,
                        width: screenWidth,
                      )),
                    );
                  })))
      : Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(() => controller.isOfferLoading.value == true
              ? Center(
                  child: Lottie.asset("assets/json/loading.json",
                      fit: BoxFit.cover,
                      height: screenHeight * 0.095,
                      width: screenWidth * 0.095),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        shopController.slug.value == "";
                        shopController.subCategoryName.value = "";
                        shopController.getDiscountShopProductData();
                        Get.to(() => ShopView());
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: FadeInImage(
                            image: NetworkImage(IMAGE_HEADER +
                                controller.apiOfferMap!["data"]
                                        ["discount_banner_image"]
                                    .toString()),
                            placeholder: const AssetImage(
                                'assets/images/placeholder_image.png'),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/placeholder_image.png",
                                height: screenHeight * 0.18,
                                width: screenWidth,
                                fit: BoxFit.cover,
                              );
                            },
                            height: screenHeight * 0.18,
                            width: screenWidth,
                          )),
                    );
                  })),
        );
}
