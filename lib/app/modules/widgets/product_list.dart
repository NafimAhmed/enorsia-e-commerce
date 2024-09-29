import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../home/controllers/home_controller.dart';
import '../shop/controllers/shop_controller.dart';
import '../shop/views/shop_view.dart';
import '../utill/app_size.dart';
import '../utill/constant.dart';

Widget productList(String categoryName, HomeController controller) {

  ShopController shopController = Get.put(ShopController());

  return Obx(() => controller.isCategoryProductLoading.value == true
      ? Center(
          child: Lottie.asset("assets/json/loading.json",
              fit: BoxFit.cover,
              height: screenHeight * 0.095,
              width: screenWidth * 0.095),
        )
      : Column(
        children: [
          ListView.builder(
              itemCount: categoryName == "women"
                  ? controller.categoryProduct.value.data!.womensCategory!.length
                  : categoryName == "men"
                      ? controller.categoryProduct.value.data!.mensCategory!.length
                      : categoryName == "boy"
                          ? controller
                              .categoryProduct.value.data!.boysCategory!.length
                          : controller
                              .categoryProduct.value.data!.boysCategory!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  width: screenWidth * 0.34,
                  child: Column(
                    children: [
                      categoryName == "women"
                          ? GestureDetector(
                           onTap: (){
                             shopController.subCategoryName.value =
                                 controller.categoryProduct.value.data!
                                     .womensCategory![index].slug
                                     .toString();

                             shopController.getShopProductData();
                             Get.to(() => ShopView(
                                 title:
                                 "",
                                 subTitle:
                                 ""));
                           },
                            child: FadeInImage(
                                image: NetworkImage(IMAGE_HEADER +
                                    controller.categoryProduct.value.data!
                                        .womensCategory![index].image
                                        .toString()),
                                placeholder: const AssetImage(
                                    'assets/images/placeholder_image.png'),
                                fit: BoxFit.cover,
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/placeholder_image.png",
                                    height: screenHeight * 0.26,
                                    width: screenWidth * 0.70,
                                    fit: BoxFit.cover,
                                  );
                                },
                                height: screenHeight * 0.26,
                                width: screenWidth * 0.70,
                              ),
                          )
                          : categoryName == "men"
                              ? GestureDetector(
                               onTap: (){
                                 shopController.subCategoryName.value =
                                     controller.categoryProduct.value.data!
                                         .mensCategory![index].slug
                                         .toString();

                                 shopController.getShopProductData();
                                 Get.to(() => ShopView(
                                     title:
                                     "",
                                     subTitle:
                                     ""));
                               },
                                child: FadeInImage(
                                    image: NetworkImage(IMAGE_HEADER +
                                        controller.categoryProduct.value.data!
                                            .mensCategory![index].image
                                            .toString()
                                            .toString()),
                                    placeholder: const AssetImage(
                                        'assets/images/placeholder_image.png'),
                                    fit: BoxFit.cover,
                                    imageErrorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/placeholder_image.png",
                                        height: screenHeight * 0.26,
                                        width: screenWidth * 0.70,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    height: screenHeight * 0.26,
                                    width: screenWidth * 0.70,
                                  ),
                              )
                              : categoryName == "boy"
                                  ? GestureDetector(
                                   onTap: (){
                                     shopController.subCategoryName.value =
                                         controller.categoryProduct.value.data!
                                             .boysCategory![index].slug
                                             .toString();

                                     shopController.getShopProductData();
                                     Get.to(() => ShopView(
                                         title:
                                         "",
                                         subTitle:
                                         ""));
                                   },
                                    child: FadeInImage(
                                        image: NetworkImage(IMAGE_HEADER +
                                            controller.categoryProduct.value.data!
                                                .boysCategory![index].image
                                                .toString()
                                                .toString()),
                                        placeholder: const AssetImage(
                                            'assets/images/placeholder_image.png'),
                                        fit: BoxFit.cover,
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/placeholder_image.png",
                                            height: screenHeight * 0.26,
                                            width: screenWidth * 0.70,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        height: screenHeight * 0.26,
                                        width: screenWidth * 0.70,
                                      ),
                                  )
                                  : GestureDetector(
                        onTap: (){
                          shopController.subCategoryName.value =
                              controller.categoryProduct.value.data!
                                  .girlsCategory![index].slug
                                  .toString();

                          shopController.getShopProductData();

                          Get.to(() => ShopView(
                              title:
                              "",
                              subTitle:
                              ""));
                        },
                                    child: FadeInImage(
                                        image: NetworkImage(IMAGE_HEADER +
                                            controller.categoryProduct.value.data!
                                                .girlsCategory![index].image
                                                .toString()
                                                .toString()),
                                        placeholder: const AssetImage(
                                            'assets/images/placeholder_image.png'),
                                        fit: BoxFit.cover,
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/placeholder_image.png",
                                            height: screenHeight * 0.26,
                                            width: screenWidth * 0.70,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        height: screenHeight * 0.26,
                                        width: screenWidth * 0.70,
                                      ),
                                  ),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      // Center(
                      //   child: Text(
                      //     "Spring Collection",
                      //     style: GoogleFonts.ruluko(fontSize: screenWidth * 0.015),
                      //   ),
                      // )
                    ],
                  ),
                );
              }),
        ],
      ));
}
