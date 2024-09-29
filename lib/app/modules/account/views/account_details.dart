import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/account_controller.dart';

class AccountDetail extends StatelessWidget {
  AccountDetail({Key? key}) : super(key: key);

  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.12),
          child: customGeneralAPPBar("Personal Information")),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.050,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Full Name ",
                  style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: screenWidth / 2 - screenWidth * 0.010,
                  child: Text(
                    "${accountController.apiUserInfoMap?["data"]["first_name"]} ${accountController.apiUserInfoMap?["data"]["last_name"]}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.050,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Phone ",
                  style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: screenWidth / 2 - screenWidth * 0.010,
                  child: Text(
                    "${accountController.apiUserInfoMap?["data"]["phone"]}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.050,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Email",
                  style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: screenWidth / 2 - screenWidth * 0.010,
                  child: Text(
                    "${accountController.apiUserInfoMap?["data"]["email"]}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.gothicA1(
                      color: AppColors.colorLightBlack,
                      fontSize: screenHeight * 0.018,
                    ),
                  ),
                )
              ],
            ),
          ),
          //     // Container(
          //     //   width: screenWidth,
          //     //   height: screenHeight * 0.050,
          //     //   color: Colors.white,
          //     //   child: Row(
          //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     //     children: [
          //     //       Text(
          //     //         "Gender ",
          //     //         style: GoogleFonts.gothicA1(
          //     //             color: AppColors.colorLightBlack,
          //     //             fontSize: screenHeight * 0.018,
          //     //             fontWeight: FontWeight.w600),
          //     //       ),
          //     //       Container(
          //     //         width: screenWidth / 2 - screenWidth * 0.010,
          //     //         child: Text(
          //     //           "Not specified",
          //     //           overflow: TextOverflow.ellipsis,
          //     //           style: GoogleFonts.gothicA1(
          //     //             color: AppColors.colorLightBlack,
          //     //             fontSize: screenHeight * 0.018,
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ],
          //     //   ),
          //     // ),
          //     // Container(
          //     //   width: screenWidth,
          //     //   height: screenHeight * 0.050,
          //     //   color: Colors.white,
          //     //   child: Row(
          //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     //     children: [
          //     //       Text(
          //     //         "BirthDay ",
          //     //         style: GoogleFonts.gothicA1(
          //     //             color: AppColors.colorLightBlack,
          //     //             fontSize: screenHeight * 0.018,
          //     //             fontWeight: FontWeight.w600),
          //     //       ),
          //     //       Container(
          //     //         width: screenWidth / 2 - screenWidth * 0.010,
          //     //         child: Text(
          //     //           "Not specified",
          //     //           style: GoogleFonts.gothicA1(
          //     //             color: AppColors.colorLightBlack,
          //     //             fontSize: screenHeight * 0.018,
          //     //           ),
          //     //         ),
          //     //       )
          //     //     ],
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    ));
  }
}
