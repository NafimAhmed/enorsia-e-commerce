import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/controllers/home_controller.dart';
import '../utill/app_size.dart';

Widget shopCategoryList(HomeController controller) {
  return Obx(() => controller.isTrendingProductLoading.value == true
      ? const CircularProgressIndicator()
      : ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: screenWidth * 0.015, right: screenWidth * 0.015),
              width: screenWidth * 0.22,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/placeholder_image.png",
                    height: screenHeight * 0.18,
                    width: screenWidth * 0.25,
                    fit: BoxFit.cover,
                  ),
                  // FadeInImage(
                  //   image: NetworkImage(IMAGE_HEADER +
                  //       controller.trendingProduct.value.data![index].image
                  //           .toString()),
                  //   placeholder:
                  //       AssetImage('assets/images/banner_demo_image.png'),
                  //   fit: BoxFit.cover,
                  //   imageErrorBuilder: (context, error, stackTrace) {
                  //     return Image.asset(
                  //       "assets/images/banner_demo_image.png",
                  //     );
                  //   },
                  //   height: screenHeight * 0.18,
                  //   width: screenWidth * 0.25,
                  // ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: screenHeight * 0.050),
                  //     alignment: Alignment.bottomCenter,
                  //     child: Center(
                  //       child: Text(
                  //         "Women",
                  //         style: GoogleFonts.ruluko(
                  //             fontSize: screenWidth * 0.050,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          }));
  // ListView.builder(
  //   itemCount: 5,
  //   shrinkWrap: true,
  //   scrollDirection: Axis.horizontal,
  //   itemBuilder: (context, index) {
  //     return Container(
  //       margin: EdgeInsets.only(left: 25.0, right: 25.0),
  //       width: screenWidth * 0.25,
  //       child: Stack(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(12.0),
  //             child: Image.asset(
  //               "assets/images/placeholder_image.png",
  //               height: screenHeight * 0.18,
  //               width: screenWidth * 0.25,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Container(
  //               margin: EdgeInsets.only(top: screenHeight * 0.050),
  //               alignment: Alignment.bottomCenter,
  //               child: Center(
  //                 child: Text(
  //                   "Trending",
  //                   style: GoogleFonts.ruluko(
  //                       fontSize: screenWidth * 0.050,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  //   });
}
