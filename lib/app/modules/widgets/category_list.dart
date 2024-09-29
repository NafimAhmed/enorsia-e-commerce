import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../home/controllers/home_controller.dart';
import '../utill/app_size.dart';
import '../utill/constant.dart';

Widget categoryList(HomeController controller) {
  return Obx(() => controller.isFeaturedProductLoading.value == true
      ? Center(
          child: Lottie.asset("assets/json/loading.json",
              fit: BoxFit.cover,
              height: screenHeight * 0.095,
              width: screenWidth * 0.095),
        )
      : ListView.builder(
          itemCount: controller.featuredProduct.value.data!.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: screenWidth * 0.25,
              child: Stack(
                children: [
                  // Image.asset(
                  //   "assets/images/banner_demo_image.png",
                  //   height: screenHeight * 0.25,
                  //   width: screenWidth * 0.28,
                  //   fit: BoxFit.cover,
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeInImage(
                      image: NetworkImage(IMAGE_HEADER +
                          controller.featuredProduct.value.data![index].image
                              .toString()),
                      placeholder: const AssetImage(
                          'assets/images/placeholder_image.png'),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder_image.png",
                          height: screenHeight * 0.29,
                          width: screenWidth * 0.95,
                          fit: BoxFit.cover,
                        );
                      },
                      height: screenHeight * 0.29,
                      width: screenWidth * 0.95,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.22),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: screenHeight * 0.027,
                        width: screenWidth * 0.20,
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            controller.featuredProduct.value.data![index].slug
                                .toString(),
                            style: GoogleFonts.ruluko(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.022),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }));
  ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 18.0, right: 18.0),
          width: screenWidth * 0.25,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  "assets/images/placeholder_image.png",
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: screenHeight * 0.025,
                  width: screenWidth * 0.20,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Spring Collection",
                      style: GoogleFonts.ruluko(fontSize: screenWidth * 0.020),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
