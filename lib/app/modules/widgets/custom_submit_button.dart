import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../registration/controllers/registration_controller.dart';
import '../utill/app_colors.dart';

Widget customSubmitButton(
    String hintText, double borderRadius, Function onTap) {
  RegistrationController controller = Get.put(RegistrationController());
  return ElevatedButton(
      onPressed: hintText == "SIGN UP" && controller.isChecked.value == false
          ? null
          : () {
              onTap();
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorLightGrey,
        elevation: 0,
        minimumSize: const Size.fromHeight(50), // NEW
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        hintText,
        style: GoogleFonts.gothicA1(color: Colors.black),
      ));
}
