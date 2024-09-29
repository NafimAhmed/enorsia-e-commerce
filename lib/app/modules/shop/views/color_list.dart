import 'shop_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/color_convereter.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  ShopController shopController = Get.put(ShopController());

  String? productColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Color")),
        body: Obx(
          () => shopController.isProductColorsLoading.value == true
              ? Center(
                  child: Lottie.asset("assets/json/loading.json",
                      fit: BoxFit.cover,
                      height: screenHeight * 0.095,
                      width: screenWidth * 0.095),
                )
              : Stack(
                  children: [
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            shopController.apiProductColorsMap?["data"].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: RadioListTile(
                              activeColor: Colors.black,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color"]}",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: screenHeight * 0.020),
                                  ),
                                  // ClipOval(
                                  //   child: FadeInImage(
                                  //     image:
                                  //     NetworkImage("${IMAGE_HEADER}upload/ecom_products/${shopController.apiProductColorsMap?["data"][index]["aop_image"]}"),
                                  //     placeholder:
                                  //     const AssetImage('assets/images/placeholder_image.png'),
                                  //     fit:
                                  //     BoxFit.cover,
                                  //     imageErrorBuilder: (context,
                                  //         error,
                                  //         stackTrace) {
                                  //       return Container(
                                  //         height: screenHeight * 0.010,
                                  //         width: screenWidth * 0.30,
                                  //         decoration: BoxDecoration(
                                  //           color: AppColors.colorWhite,
                                  //           shape: BoxShape.circle
                                  //         ),
                                  //       );
                                  //     },
                                  //     height:
                                  //     screenHeight * 0.29,
                                  //     width:
                                  //     screenWidth * 0.95,
                                  //   ),
                                  // ),
                                  Icon(Icons.circle_rounded,
                                      color: Color(ColorConvert.getColorFromHex(
                                          "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color_code"]}")),
                                      size: screenHeight * 0.028)
                                ],
                              ),
                              value:
                                  "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color"]}",
                              groupValue: productColor,
                              onChanged: (value) {
                                setState(() {
                                  productColor = value.toString();
                                });
                              },
                            ),
                          ); //Text("${apiProductSizeMap?["size"][index]["size"]}");
                        }),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: screenWidth,
                              height: screenHeight * 0.060,
                              child: ElevatedButton(
                                  onPressed: () {
                                    shopController.searchProduct(
                                        shopController.subCategoryName.value,
                                        "",
                                        /*category_name*/ "",
                                        /*brand_name*/ "",
                                        /*tag_name*/ "",
                                        "",
                                        "$productColor",
                                        /*fabric_name*/ "",
                                        /*neckline__name*/ "",
                                        "",
                                        "",
                                        "" /*sort_by*/);

                                    Get.to(() => ShopView());
                                    //
                                    // // Navigator.pop(context);

                                    // Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorLightGrey,
                                    elevation: 0, // NEW
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "View Items",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: screenHeight * 0.020,
                                        color: AppColors.colorLightBlack,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ))
                  ],
                ),
        ),
      ),
    );
  }
}
