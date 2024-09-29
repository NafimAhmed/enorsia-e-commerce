import 'shop_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';

class NewInDate extends StatefulWidget {
  const NewInDate({super.key});

  @override
  State<NewInDate> createState() => _NewInDateState();
}

class _NewInDateState extends State<NewInDate> {
  String arrival = 'last_7_days';

  Map<String, bool> values = {
    'last 7 days': true,
    'last 28 days': false,
  };

  ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("New In Date")),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              //height: screenHeight * 0.14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    activeColor: Colors.black,
                    title: Text(
                      "last 7 days",
                      style: GoogleFonts.yantramanav(
                          fontSize: screenHeight * 0.020),
                    ),
                    value: "last_7_days",
                    groupValue: arrival,
                    onChanged: (value) {
                      setState(() {
                        arrival = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    activeColor: Colors.black,
                    title: Text(
                      "last 28 days",
                      style: GoogleFonts.yantramanav(
                          fontSize: screenHeight * 0.020),
                    ),
                    value: "last_28_days",
                    groupValue: arrival,
                    onChanged: (value) {
                      setState(() {
                        arrival = value.toString();
                      });
                    },
                  )

                  // Expanded(
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     children: values.keys.map((String key) {
                  //       return CheckboxListTile(
                  //         activeColor: AppColors.colorLightOrange,
                  //         title: Padding(
                  //           padding: EdgeInsets.only(left: 12.0),
                  //           child: Text(
                  //             key,
                  //             style: GoogleFonts.poppins(
                  //               color: AppColors.colorLightBlack,
                  //             ),
                  //           ),
                  //         ),
                  //         value: values[key],
                  //         onChanged: (bool? value) {
                  //           setState(() {
                  //             values[key] = value!;
                  //           });
                  //         },
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Align(
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
                                  arrival,
                                  /*category_name*/ "",
                                  /*brand_name*/ "",
                                  /*tag_name*/ "",
                                  "",
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
