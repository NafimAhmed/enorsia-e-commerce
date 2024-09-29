import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../../widgets/order_list.dart';
import '../controllers/account_controller.dart';

class MyReturn extends StatelessWidget {
  MyReturn({Key? key}) : super(key: key);

  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.12),
              child: customGeneralAPPBar("My Return")),
          body: Obx(
            () => accountController.isOrderListLoading.value
                ? Container(
              height: screenHeight,
                  width: screenWidth,
                  child: Center(
                      child: Lottie.asset("assets/json/loading.json",
                          fit: BoxFit.cover,
                          height: screenHeight * 0.095,
                          width: screenWidth * 0.095),
                    ),
                )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "My Returns",
                          style: GoogleFonts.ruluko(
                            color: AppColors.colorLightBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: screenHeight * 0.019,
                          ),
                        ),
                      ),
                      Expanded(
                        child:
                         accountController.apiReturnListMap?["data"].length == 0 ?
                         Container(
                             alignment: Alignment.center,
                             child: Text(
                               "No Product has been shipped yet !!!",
                               style: GoogleFonts.poppins(),
                               textAlign: TextAlign.center,
                             ) ) :
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: accountController
                                .apiOrderListMap?["data"]["data"].length,
                            itemBuilder: (context, index) {
                              return orderList(
                                  "#${accountController.apiOrderListMap?["data"]["data"][index]["order_number"]}",
                                  "${accountController.apiOrderListMap?["data"]["data"][index]["created_at"]}",
                                  "${accountController.apiOrderListMap?["data"]["data"][index]["order_products"].length}",
                                  "${accountController.apiOrderListMap?["data"]["data"][index]["total_price"]}",
                                  "${accountController.apiOrderListMap?["data"]["data"][index]["id"]}",
                                  accountController.apiOrderListMap?["data"]
                                      ["data"][index]["order_products"],
                                  accountController.apiOrderListMap?["data"]
                                      ["data"][index]);
                            }),
                      ),
                    ],
                  ),
          )),
    );
  }
}
