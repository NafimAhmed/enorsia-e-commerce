import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shop/controllers/shop_controller.dart';
import '../shop/views/shop_view.dart';
import '../utill/app_colors.dart';
import '../utill/app_size.dart';

Widget customHomeAPPBar() {
  ShopController shopController = Get.put(ShopController());
  shopController.getProductName();
  // List<String> productName  = [
  //   "USA",
  //   "USA",
  //   "USA",
  //   "USA",
  //   "USA"
  // ];

  return SizedBox(
    width: screenWidth,
    height: screenHeight * 0.10,
    child: Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.015),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.025,
              ),
              Image.asset(
                "assets/images/enorsia_logo.png",
                height: screenHeight * 0.060,
                width: screenWidth * 0.26,
                color: Colors.black,
                fit: BoxFit.fill,
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: screenWidth * 0.040),
              //   child: Container(
              //     height: screenHeight * 0.045,
              //     width: screenWidth / 2 + 30,
              //     decoration: BoxDecoration(
              //         color: AppColors.colorGrey.withOpacity(0.1),
              //         borderRadius: BorderRadius.circular(10.0)),
              //     child: Padding(
              //       padding: EdgeInsets.only(left: screenWidth * 0.020),
              //       child: TextFormField(
              //         cursorColor: AppColors.colorLightOrange,
              //         decoration: InputDecoration(
              //             suffixIcon: Row(
              //               mainAxisAlignment:
              //                   MainAxisAlignment.spaceAround, // added line
              //               mainAxisSize: MainAxisSize.min, // added line
              //               children: <Widget>[
              //                 SvgPicture.asset("assets/images/search_icon.svg",
              //                     height: screenHeight * 0.020,
              //                     width: screenWidth * 0.10,
              //                     color: AppColors.colorLightGrey)
              //               ],
              //             ),
              //             border: InputBorder.none,
              //             hintText: "Search",
              //             hintStyle: GoogleFonts.poppins(
              //                 fontSize: screenHeight * 0.019)),
              //       ),
              //     ),
              //   ),
              // )

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.012, right: screenWidth * 0.010),
                  child: Container(
                    // width: screenWidth /2 + (screenWidth * 0.14),
                    height: screenHeight * 0.050,
                    decoration: BoxDecoration(
                        color: AppColors.colorLightGrey,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.030,
                              top: screenHeight * 0.002),
                          child: SvgPicture.asset(
                              "assets/images/search_icon.svg",
                              height: screenHeight * 0.025,
                              width: screenWidth * 0.040,
                              color: AppColors.colorLightBlack),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.015,
                          ),
                          child: SizedBox(
                            width: screenWidth / 2 + (screenWidth * 0.010),
                            height: screenHeight * 0.050,
                            child: RawAutocomplete(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                } else {
                                  List<String> matches = <String>[];
                                  matches.addAll(shopController.productName);

                                  matches.retainWhere((searchValue) {
                                    return searchValue.toLowerCase().contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                  return matches;
                                }
                              },
                              onSelected: (String selection) {
                                shopController.productSearch.value = selection;
                                shopController.getShopProductDataBySearch();
                                Get.to(() => ShopView());
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "What are you looking today",
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: screenHeight * 0.017),
                                      border: InputBorder.none),
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onSaved: (selection) {
                                    shopController.productSearch.value =
                                        selection!;
                                    shopController.getShopProductDataBySearch();
                                    Get.to(() => ShopView());
                                  },
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  void Function(String) onSelected,
                                  Iterable<String> options) {
                                return Material(
                                    child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: options.map((opt) {
                                      return InkWell(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 60),
                                              child: Card(
                                                  child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(opt),
                                              ))));
                                    }).toList(),
                                  ),
                                ));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenWidth,
            child: const Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    ),
  );
}
