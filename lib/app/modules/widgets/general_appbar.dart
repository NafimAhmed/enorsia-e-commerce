import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account/views/account_setting.dart';
import '../base/views/base_view.dart';
import '../utill/app_colors.dart';
import '../utill/app_size.dart';

Widget customGeneralAPPBar(String screenName) {
  return Padding(
    padding: EdgeInsets.only(top: screenHeight * 0.017),
    child: Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.07,
          color: AppColors.colorLightGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.020,
              ),
              GestureDetector(
                onTap: () {
                  if (screenName == "Search") {
                    Get.to(() => const BaseView());
                  } else if (screenName == "Wish List") {
                    Get.to(() => const BaseView());
                  } else if (screenName == "Account") {
                    Get.to(() => const BaseView());
                  } else if (screenName == "Shopping Bag") {
                    Get.to(() => const BaseView());
                  } else if (screenName == "My Bag") {
                    Get.to(() => const BaseView());
                  } else {
                    Get.back();
                  }
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.colorLightBlack,
                ),
              ),
              const Spacer(),
              Text(
                screenName,
                style: GoogleFonts.poppins(color: AppColors.colorLightBlack),
              ),
              const Spacer(),
              // Visibility(
              //   visible: screenName == "Account" ? true : false,
              //   child: const Icon(
              //     Icons.search_outlined,
              //     color: Colors.white,
              //     size: 20,
              //   ),
              // ),
              // SizedBox(
              //   width: screenWidth * 0.010,
              // ),
              Visibility(
                visible: screenName == "Account" ? true : false,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const AccountSetting());
                  },
                  child: const Icon(
                    Icons.settings,
                    color: AppColors.colorLightBlack,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.030,
              ),
              // Visibility(
              //   visible: screenName == "Account" ? true : false,
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.to(() => MyBagView());
              //     },
              //     child: const Icon(
              //       Icons.shopping_bag_outlined,
              //       color: Colors.white,
              //       size: 20,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: screenWidth * 0.030,
              // ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth,
          child: const Divider(
            color: AppColors.colorLightGrey,
            thickness: 3.0,
          ),
        ),
      ],
    ),
  );
}
