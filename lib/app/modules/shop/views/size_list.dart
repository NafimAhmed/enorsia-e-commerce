import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';
import 'shop_view.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  ShopController shopController = Get.put(ShopController());

  String? size; //"${shopController.apiProductSizeMap?["size"][0]["size"]}";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Size")),
        body: Obx(
          () => shopController.isProductSizeLoading.value == true
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
                            shopController.apiProductSizeMap?["size"].length,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            activeColor: Colors.black,
                            title: Text(
                              "${shopController.apiProductSizeMap?["size"][index]["size"]}",
                              style: GoogleFonts.yantramanav(
                                  fontSize: screenHeight * 0.020),
                            ),
                            value:
                                "${shopController.apiProductSizeMap?["size"][index]["size"]}",
                            groupValue: size,
                            onChanged: (value) {
                              //size.value=value.toString();
                              setState(() {
                                size = value.toString();
                              });
                            },
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
                                        "$size",
                                        "",
                                        /*fabric_name*/ "",
                                        /*neckline__name*/ "",
                                        "",
                                        "",
                                        "" /*sort_by*/);

                                    Get.to(() => ShopView());
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
