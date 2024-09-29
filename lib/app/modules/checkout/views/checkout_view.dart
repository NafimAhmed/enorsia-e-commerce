import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import '../../account/controllers/account_controller.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/checkout_controller.dart';
import 'checkout_card.dart';

class CheckoutView extends GetView<CheckoutController> {
  final List<Map<String, dynamic>> selectedItems;
  final double totalPrice;

  TextEditingController phoneNumberController = TextEditingController();

  AccountController accountController = Get.put(AccountController());

  CheckoutView(this.selectedItems, this.totalPrice, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Checkout")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.015, right: screenWidth * 0.015),
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Address",
                                      style: GoogleFonts.yantramanav(
                                        color: AppColors.colorGrey,
                                        fontSize: screenHeight * 0.013,
                                      ),
                                    ),
                                    Text(
                                      "Delivery ",
                                      style: GoogleFonts.yantramanav(
                                        color: AppColors.colorGrey,
                                        fontSize: screenHeight * 0.013,
                                      ),
                                    ),
                                    Text(
                                      "Payment",
                                      style: GoogleFonts.yantramanav(
                                        color: AppColors.colorLightGrey,
                                        fontSize: screenHeight * 0.013,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.035),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.10,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.018,
                                        width: screenWidth * 0.030,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index == 0
                                                ? Colors.black
                                                : AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.15,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.15,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.018,
                                        width: screenWidth * 0.030,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index == 0
                                                ? Colors.black
                                                : AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.13,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.15,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.018,
                                        width: screenWidth * 0.030,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index == 0
                                                ? AppColors.colorLightGrey
                                                : AppColors.colorGrey),
                                      ),
                                      Container(
                                        height: screenHeight * 0.001,
                                        width: screenWidth * 0.10,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorGrey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: screenHeight * 0.020),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.020),
                          child: Text(
                            "£$totalPrice (${selectedItems.length} item) ",
                            style: GoogleFonts.yantramanav(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.20,
                      margin: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectedItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                "${selectedItems[index]["imageLink"]}",
                                height: screenHeight * 0.20,
                                width: screenWidth * 0.20,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                      child: Center(
                                    child: Lottie.asset(
                                        "assets/json/loading.json",
                                        fit: BoxFit.cover,
                                        height: screenHeight * 0.095,
                                        width: screenWidth * 0.095),
                                  ));
                                },
                              ),
                            );
                          }),
                    ),

                    Obx(
                      () => accountController.isLoading.value == true
                          ? Center(
                              child: Lottie.asset("assets/json/loading.json",
                                  fit: BoxFit.cover,
                                  height: screenHeight * 0.095,
                                  width: screenWidth * 0.095),
                            )
                          : Column(
                              children: [
                                SizedBox(height: screenHeight * 0.020),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.020),
                                      child: Text(
                                        "Delivery ",
                                        style: GoogleFonts.yantramanav(
                                            color: AppColors.colorLightBlack,
                                            fontSize: screenHeight * 0.020,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.050),
                                      child: accountController.apiUserInfoMap?[
                                                          "data"]
                                                      ["shipping_address"]
                                                  ["name"] ==
                                              null
                                          ? Text(
                                              "Name :  ",
                                              style: GoogleFonts.yantramanav(
                                                  color:
                                                      AppColors.colorLightBlack,
                                                  fontSize:
                                                      screenHeight * 0.022,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              "Name :  ${accountController.apiUserInfoMap?["data"]["shipping_address"]["name"]} ",
                                              style: GoogleFonts.yantramanav(
                                                  color:
                                                      AppColors.colorLightBlack,
                                                  fontSize:
                                                      screenHeight * 0.022,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * 0.030),
                                      child: Container(
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.095,
                                        decoration: const BoxDecoration(
                                            color: AppColors.colorLightGrey,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color: AppColors.colorLightBlack,
                                            size: screenWidth * 0.050,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.050),
                                      child: Container(
                                        height: screenHeight * 0.035,
                                        width: screenWidth * 0.55,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AppColors.colorLightGrey)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Your default Delivery addrress ",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      AppColors.colorLightBlack,
                                                  fontSize: screenWidth * 0.028,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.030),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Address : ",
                                      style: GoogleFonts.yantramanav(
                                          color: AppColors.colorLightBlack,
                                          fontSize: screenHeight * 0.022,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.050),
                                      child: SizedBox(
                                        width: screenWidth * 0.90,
                                        child: Text(
                                            "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_line_1"]}, "
                                            "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_line_2"]}, "
                                            "${accountController.apiUserInfoMap?["data"]["shipping_address"]["town_city"]}, "
                                            "${accountController.apiUserInfoMap?["data"]["shipping_address"]["state"]}, "
                                            "${accountController.apiUserInfoMap?["data"]["shipping_address"]["country"]},"
                                            //     "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_holder_firstname"]}"
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.050),
                                      child: SizedBox(
                                        width: screenWidth * 0.90,
                                        child: accountController.apiUserInfoMap?[
                                                            "data"]
                                                        ["shipping_address"]
                                                    ["address_holder_phone"] ==
                                                null
                                            ? Text(
                                                "No phone Number is found",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: AppColors.colorGrey,
                                                  fontSize: screenWidth * 0.030,
                                                ),
                                              )
                                            : Text(
                                                "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_holder_phone"]}",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: AppColors.colorGrey,
                                                  fontSize: screenWidth * 0.030,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.050),
                              ],
                            ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: screenWidth * 0.050),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Collect your product from the nearest storefront ",
                    //             overflow: TextOverflow.ellipsis,
                    //             style: GoogleFonts.poppins(
                    //               color: AppColors.colorGrey,
                    //               fontSize: screenWidth * 0.030,
                    //             ),
                    //           ),
                    //           Text(
                    //             "Discover collection point nearby",
                    //             overflow: TextOverflow.ellipsis,
                    //             style: GoogleFonts.poppins(
                    //               color: AppColors.colorGrey,
                    //               fontSize: screenWidth * 0.030,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Spacer(),
                    //     Padding(
                    //       padding: EdgeInsets.only(right: 8.0),
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         size: screenHeight * 0.030,
                    //         color: AppColors.colorGrey,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    //

                    // SizedBox(height: screenHeight * 0.030),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //       child: Text(
                    //         "Add your nearest store",
                    //         style: GoogleFonts.yantramanav(
                    //             color: AppColors.colorLightBlack,
                    //             fontSize: screenHeight * 0.020,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: screenHeight * 0.010),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: screenWidth * 0.040),
                    //       child: Icon(
                    //         Icons.add,
                    //         color: AppColors.colorLightBlack,
                    //         size: screenHeight * 0.030,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: screenWidth * 0.010,
                    //     ),
                    //     SvgPicture.asset(
                    //       "assets/images/enorsia_store.svg",
                    //       height: screenHeight * 0.030,
                    //       width: screenWidth * 0.070,
                    //       fit: BoxFit.fill,
                    //     ),
                    //     SizedBox(
                    //       width: screenWidth * 0.030,
                    //     ),
                    //     InkWell(
                    //       onTap: (){
                    //         Get.to(() => StoreFront());
                    //       },
                    //       child: RichText(
                    //         text: const TextSpan(
                    //           text: 'Add a ',
                    //           style: TextStyle(fontSize: 15, color: AppColors.colorGrey),
                    //           children: <TextSpan>[
                    //             TextSpan(
                    //               text: " ENORSIA",
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: AppColors.colorOrange,
                    //               ),
                    //             ),
                    //             TextSpan(
                    //               text: " store",
                    //               style:
                    //                   TextStyle(fontSize: 15, color: AppColors.colorGrey),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: screenHeight*0.038//3.8.h,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.020),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.020),
                            child: Text(
                              "Add your contact number * ",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.020,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Why do we need your number? ",
                            style: GoogleFonts.yantramanav(
                              color: AppColors.colorGrey,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.010),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: screenWidth,
                        height: screenHeight * 0.060,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            color: Colors.white.withOpacity(0.6)),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.deepOrangeAccent,
                          decoration: InputDecoration(
                            labelText: "Enter Phone number",
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                  color: Colors.black26, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Colors.black54,
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
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      SizedBox(height: screenHeight * 0.010),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child:
                            customSubmitButton("CONTINUE TO PAYMENT", 10, () {
                          if (phoneNumberController.text.isEmpty) {
                            Get.snackbar(
                              "Warning",
                              "Please Enter your phone number",
                              colorText: Colors.white,
                              backgroundColor: Colors.orangeAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            Get.to(() => CheckOutCardView(
                                  selectedItems: selectedItems,
                                  totalPrice: totalPrice,
                                ));
                          }
                        }),
                      ),
                      SizedBox(height: screenHeight * 0.030),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
