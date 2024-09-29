import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';

import '../home/controllers/home_controller.dart';
import '../utill/app_size.dart';
import '../utill/constant.dart';

Widget categoryBanner(HomeController controller, String category) {
  return Obx(() => controller.isCategoryBannerLoading.value == true
      ? Center(
          child: Lottie.asset("assets/json/loading.json",
              fit: BoxFit.cover,
              height: screenHeight * 0.095,
              width: screenWidth * 0.095),
        )
      : ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: [
                  // Image.asset(
                  //   "assets/images/banner_demo_image.png",
                  //   height: screenHeight * 0.25,
                  //   width: screenWidth * 0.28,
                  //   fit: BoxFit.cover,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: FadeInImage(
                      image: category == "women"
                          ? NetworkImage(IMAGE_HEADER +
                              controller.categoryBanner.value.data!
                                  .womensCategoryImages!.leftImage
                                  .toString())
                          : category == "men"
                              ? NetworkImage(IMAGE_HEADER +
                                  controller.categoryBanner.value.data!
                                      .mensCategoryImages!.leftImage
                                      .toString())
                              : category == "girl"
                                  ? NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .girlsCategoryImages!.leftImage
                                          .toString())
                                  : NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .boysCategoryImages!.leftImage
                                          .toString()),
                      placeholder: const AssetImage(
                          'assets/images/placeholder_image.png'),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder_image.png",
                          height: screenHeight * 0.29,
                          width: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        );
                      },
                      height: screenHeight * 0.29,
                      width: screenWidth * 0.25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: FadeInImage(
                      image: category == "women"
                          ? NetworkImage(IMAGE_HEADER +
                              controller.categoryBanner.value.data!
                                  .womensCategoryImages!.middleImage
                                  .toString())
                          : category == "men"
                              ? NetworkImage(IMAGE_HEADER +
                                  controller.categoryBanner.value.data!
                                      .mensCategoryImages!.middleImage
                                      .toString())
                              : category == "girl"
                                  ? NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .girlsCategoryImages!.middleImage
                                          .toString())
                                  : NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .boysCategoryImages!.middleImage
                                          .toString()),
                      placeholder: const AssetImage(
                          'assets/images/placeholder_image.png'),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder_image.png",
                          height: screenHeight * 0.29,
                          width: screenWidth * 0.45,
                          fit: BoxFit.cover,
                        );
                      },
                      height: screenHeight * 0.29,
                      width: screenWidth * 0.48,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                    child: FadeInImage(
                      image: category == "women"
                          ? NetworkImage(IMAGE_HEADER +
                              controller.categoryBanner.value.data!
                                  .womensCategoryImages!.rightImage
                                  .toString())
                          : category == "men"
                              ? NetworkImage(IMAGE_HEADER +
                                  controller.categoryBanner.value.data!
                                      .mensCategoryImages!.rightImage
                                      .toString())
                              : category == "girl"
                                  ? NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .girlsCategoryImages!.rightImage
                                          .toString())
                                  : NetworkImage(IMAGE_HEADER +
                                      controller.categoryBanner.value.data!
                                          .boysCategoryImages!.rightImage
                                          .toString()),
                      placeholder: const AssetImage(
                          'assets/images/placeholder_image.png'),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder_image.png",
                          height: screenHeight * 0.29,
                          width: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        );
                      },
                      height: screenHeight * 0.29,
                      width: screenWidth * 0.25,
                    ),
                  ),
                ],
              ),
            );
          }));
}
