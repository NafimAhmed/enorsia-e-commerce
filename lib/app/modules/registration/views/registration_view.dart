import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({Key? key}) : super(key: key);

  @override
  RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.020, right: screenWidth * 0.020),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.20,
                          ),
                          Image.asset(
                            "assets/images/enorsia_logo.png",
                            color: AppColors.colorLightBlack,
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.colorGrey),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " ENORSIA",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "We are pleased to give you better shopping",
                            style: GoogleFonts.yantramanav(
                                color: AppColors.colorGrey),
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          customInputField("First Name", controller),
                          SizedBox(
                            height: screenHeight * 0.010,
                          ),
                          customInputField("last Name", controller),
                          SizedBox(
                            height: screenHeight * 0.012,
                          ),
                          customInputField("Email", controller),
                          SizedBox(
                            height: screenHeight * 0.012,
                          ),
                          customInputField("Password", controller),
                          SizedBox(
                            height: screenHeight * 0.012,
                          ),
                          customInputField("Confirm Password", controller),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          customInputField("Refer code", controller),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.grey.shade700,
                                checkColor: Colors.grey.shade700,
                                value: controller.isChecked.value,
                                onChanged: (bool? value) {
                                  controller.isChecked.value = value!;
                                },
                              ),
                              Text(
                                "By clicking 'Sign Up' you agree to the",
                                style: GoogleFonts.gothicA1(
                                  fontSize: screenWidth * 0.020,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: " Terms and Conditions",
                                    // controller.advertisement.value.allAdvertisements![0].redirectLink.toString(),
                                    style: GoogleFonts.gothicA1(
                                      fontSize: screenWidth * 0.020,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // var url = "https://www.google.com/";
                                        // // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                                        // launchUrl(Uri.parse(url));
                                      }),
                              ),
                              Text(
                                " and ",
                                style: GoogleFonts.gothicA1(
                                  fontSize: screenWidth * 0.020,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: " Privacy and Cookie Policy",
                                    // controller.advertisement.value.allAdvertisements![0].redirectLink.toString(),
                                    style: GoogleFonts.gothicA1(
                                      fontSize: screenWidth * 0.020,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        // var url = "https://www.google.com/";
                                        // // var url = controller.advertisement.value.allAdvertisements![0].redirectLink.toString();
                                        // launchUrl(Uri.parse(url));
                                      }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          customSubmitButton("SIGN UP", 35.0, () async {
                            if (controller.firstName.value == "" &&
                                controller.lastName.value == "" &&
                                controller.email.value == "" &&
                                controller.password.value == "" &&
                                controller.confirmPassword.value == "" &&
                                controller.referCode.value == "") {
                              Get.snackbar(
                                "Waning",
                                "Please fill up all the field",
                                colorText: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else if (controller.firstName.value == "" ||
                                controller.lastName.value == "" ||
                                controller.email.value == "" ||
                                controller.password.value == "" ||
                                controller.confirmPassword.value == "" ||
                                controller.referCode.value == "") {
                              Get.snackbar(
                                "Waning",
                                "Please fill up all the field",
                                colorText: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else if (controller.password.value !=
                                controller.confirmPassword.value) {
                              Get.snackbar(
                                "Waning",
                                "Password and Confirm password should be same",
                                colorText: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else if (controller.password.value
                                    .toString()
                                    .length <
                                8) {
                              Get.snackbar(
                                "Waning",
                                "Password must be at least 8 character",
                                colorText: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else if (isPasswordValid(
                                    controller.password.value) !=
                                true) {
                              Get.snackbar(
                                "Waning",
                                "Password must contain one upper and lower character and one number",
                                colorText: Colors.white,
                                backgroundColor: Colors.orangeAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              await controller.registerUser();
                            }
                          }),
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          Visibility(
                              visible: false,
                              child: Text(controller.count.toString()))
                        ],
                      ),
                      Obx(() => controller.isLoading.value == true
                          ? SizedBox(
                              height: screenHeight,
                              width: screenWidth,
                              child: Center(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Lottie.asset(
                                      "assets/json/loading.json",
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.095,
                                      width: screenWidth * 0.095),
                                ),
                              ),
                            )
                          : Container())
                    ],
                  ),
                ),
              ))),
    );
  }

  bool isPasswordValid(String password) {
    // Check for at least one uppercase letter
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));

    // Check for at least one lowercase letter
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));

    // Check for at least one number character
    bool hasNumber = password.contains(RegExp(r'[0-9]'));

    // Return true if all conditions are met (uppercase, lowercase, and number)
    return hasUppercase && hasLowercase && hasNumber;
  }
}
