import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);

  final GetStorage _getStorage = GetStorage('app_storage');

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      Get.offNamed(Routes.BASE);
      // checkLoginStatus();
      // Get.to(() => LoginView());
    });

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/enorsia_logo.png",
                    height: screenHeight * 0.060,
                    width: screenWidth * 0.22,
                    color: AppColors.colorLightBlack,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Lottie.asset(
                "assets/json/splash_json.json",
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // checkLoginStatus() async {
  //   var loginToken = await _getStorage.read('token');
  //   if (loginToken != "" && loginToken != null) {
  //     return Get.offNamed(Routes.BASE);
  //   } else {
  //     return Get.offNamed(Routes.BASE);
  //     // return Get.off(LoginView());
  //   }
  // }
}
