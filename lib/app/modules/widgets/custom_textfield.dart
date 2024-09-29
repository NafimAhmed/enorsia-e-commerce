import 'package:flutter/material.dart';

import '../registration/controllers/registration_controller.dart';
import '../utill/app_colors.dart';

Widget customInputField(String labelName, RegistrationController controller) {
  // RegistrationController controller = Get.put(RegistrationController());

  return TextFormField(
    obscureText: labelName == "Password"
        ? controller.passwordVisible == true
            ? false
            : true
        : labelName == "Confirm Password"
            ? controller.confirmPasswordVisible2 == true
                ? false
                : true
            : false,
    cursorColor: AppColors.colorLightBlack,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: () {
          if (labelName == "Password") {
            controller.passwordVisible.value == true
                ? controller.passwordVisible.value = false
                : controller.passwordVisible.value = true;
          }
          if (labelName == "Confirm Password") {
            controller.confirmPasswordVisible2.value == true
                ? controller.confirmPasswordVisible2.value = false
                : controller.confirmPasswordVisible2.value = true;
          }
        },
        icon: labelName == "Password"
            ? controller.passwordVisible == true
                ? const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
            : labelName == "Confirm Password"
                ? controller.confirmPasswordVisible2 == true
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                : const Visibility(
                    visible: false,
                    child: Icon(Icons.label),
                  ),
      ),
      labelText: labelName,
      labelStyle: const TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:
            const BorderSide(color: AppColors.colorLightBlack, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: AppColors.colorLightBlack,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: AppColors.colorLightGrey,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: AppColors.colorLightGrey,
          width: 1.0,
        ),
      ),
    ),
    onChanged: (value) {
      labelName == "First Name"
          ? controller.firstName.value = value.toString()
          : labelName == "last Name"
              ? controller.lastName.value = value.toString()
              : labelName == "Email"
                  ? controller.email.value = value.toString()
                  : labelName == "Refer code"
                      ? controller.referCode.value = value.toString()
                      : labelName == "Password"
                          ? controller.password.value = value.toString()
                          : controller.confirmPassword.value = value.toString();
    },
  );
}
