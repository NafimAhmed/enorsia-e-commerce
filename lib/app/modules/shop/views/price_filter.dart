import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';
import 'shop_view.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _currentRangeValues = const RangeValues(10, 40);

  ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Price")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "£8",
                      style: GoogleFonts.yantramanav(
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "£60",
                      style: GoogleFonts.yantramanav(
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RangeSlider(
              values: _currentRangeValues,
              max: 60,
              min: 8,
              inactiveColor: Colors.grey,
              activeColor: Colors.black,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Text(
              "£${_currentRangeValues.start} to £${_currentRangeValues.end}",
              style: GoogleFonts.yantramanav(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // SizedBox(height: 65.h,),

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
                                  "",
                                  /*category_name*/ "",
                                  /*brand_name*/ "",
                                  /*tag_name*/ "",
                                  "",
                                  "",
                                  /*fabric_name*/ "",
                                  /*neckline__name*/ "",
                                  "${_currentRangeValues.end}",
                                  "${_currentRangeValues.start}",
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
