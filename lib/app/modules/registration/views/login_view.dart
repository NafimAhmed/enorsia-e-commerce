import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/registration_controller.dart';
import 'registration_view.dart';

class LoginView extends StatelessWidget {
  TextEditingController passwordResetController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.loginBackground,
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 96,
                  ),
                  Image.asset(
                    "assets/images/enorsia_logo.png",
                    color: AppColors.colorLightBlack,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        "Existing Customers",
                        style: GoogleFonts.yantramanav(
                            color: AppColors.colorGrey, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      RichText(
                        text: const TextSpan(
                          text: 'Sign Into ',
                          style: TextStyle(
                              fontSize: 14, color: AppColors.colorGrey),
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
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  customInputField("Email", controller),
                  SizedBox(
                    height: screenHeight * 0.012,
                  ),
                  customInputField("Password", controller),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Don’t have account? ",
                            style: GoogleFonts.yantramanav(
                                color: AppColors.colorGrey, fontSize: 10),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => RegistrationView());
                            },
                            child: Text(
                              " SIGNUP NOW",
                              style: GoogleFonts.yantramanav(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "Forget password?",
                            style: GoogleFonts.yantramanav(
                                color: AppColors.colorGrey, fontSize: 10),
                          ),
                          InkWell(
                            onTap: () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Forgotten your password ? ",
                                                    style:
                                                        GoogleFonts.yantramanav(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    "Please enter your email Address below and Click 'Reset' to reset your passwor ",
                                                    style:
                                                        GoogleFonts.yantramanav(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    controller:
                                                        passwordResetController,
                                                    decoration: InputDecoration(
                                                        labelText: "Email",
                                                        labelStyle: GoogleFonts
                                                            .raleway(),
                                                        floatingLabelStyle:
                                                            GoogleFonts
                                                                .yantramanav(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        hintText: "Enter email",
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width:
                                                                        1.0))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            Text(
                                              "A link will be sent via email",
                                              style: GoogleFonts.yantramanav(
                                                  fontSize:
                                                      screenHeight * 0.017),
                                            ),
                                            const Spacer(),
                                            ElevatedButton(
                                              onPressed: () async {
                                                controller.resetPassword(
                                                    passwordResetController
                                                        .text,
                                                    context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 2),
                                                backgroundColor: Colors.black,
                                                shape: const StadiumBorder(),
                                              ),
                                              child: const Text(
                                                "Reset",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ));
                              });
                            },
                            child: Text(
                              " RESET NOW",
                              style: GoogleFonts.yantramanav(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  customSubmitButton("SIGN IN", 35.0, () async {
                    if (controller.email.value == "" &&
                        controller.password.value == "") {
                      Get.snackbar(
                        "Waning",
                        "Please fill up all the field",
                        colorText: Colors.white,
                        backgroundColor: Colors.orangeAccent,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (controller.email.value == "" ||
                        controller.password.value == "") {
                      Get.snackbar(
                        "Waning",
                        "Please fill up all the field",
                        colorText: Colors.white,
                        backgroundColor: Colors.orangeAccent,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      await controller.signInUser();
                    }
                  }),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 38,
                        child: const Divider(
                          color: AppColors.colorGrey,
                          // height: screenWidth / 2 - 10,
                          thickness: 1.0,
                        ),
                      ),
                      Text(
                        " or ",
                        style: GoogleFonts.yantramanav(
                            color: Colors.black,
                            fontSize: screenHeight * 0.018),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 38,
                        child: const Divider(
                          color: AppColors.colorGrey,
                          // height: screenWidth / 2 - 10,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: AppColors.colorGrey.withOpacity(0.1),
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 1,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: AppColors.colorGrey.withOpacity(0.1),
                              offset: const Offset(-2.0, -2.0),
                              blurRadius: 1,
                              spreadRadius: 2,
                            ),
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/icons_google.png"),
                              Text(
                                " Sign in using Google ",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: AppColors.colorGrey.withOpacity(0.1),
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 1,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: AppColors.colorGrey.withOpacity(0.1),
                            offset: const Offset(-2.0, -2.0),
                            blurRadius: 1,
                            spreadRadius: 2,
                          ),
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logos_facebook.png"),
                            const SizedBox(width: 10),
                            Text(
                              " Sign in using Facebook ",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 320,
                    child: SignInWithAppleButton(
                      borderRadius: BorderRadius.circular(10),
                      onPressed: controller.signInWithApple,
                      style: SignInWithAppleButtonStyle.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
