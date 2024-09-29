import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';
import 'color_list.dart';
import 'new_in_date.dart';
import 'price_filter.dart';
import 'size_list.dart';

class FilterView extends StatefulWidget {
  //final String slug;

  const FilterView({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final RangeValues _currentRangeValues = const RangeValues(10, 40);

  String? size;
  String arrival = 'last_7_days';

  String? productColor;

  Map<String, bool> values = {
    'last 7 days': true,
    'last 28 days': false,
  };

  ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.12),
          child: customGeneralAPPBar("Filter")),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // height: screenHeight,
              // width: screenWidth,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          //iconColor: Color.fromARGB(255, 238, 98, 49),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New in date",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: screenHeight * 0.022,
                              )
                            ],
                          ),

                          onTap: () {
                            Get.to(const NewInDate());
                          },

                          // children: [
                          //   Container(
                          //     width: double.infinity,
                          //     //height: screenHeight * 0.14,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         RadioListTile(
                          //           activeColor: Colors.red,
                          //           title: Text(
                          //             "last 7 days",
                          //             style: GoogleFonts.yantramanav(
                          //                 fontSize: screenHeight * 0.020),
                          //           ),
                          //           value: "last_7_days",
                          //           groupValue: arrival,
                          //           onChanged: (value) {
                          //             setState(() {
                          //               arrival = value.toString();
                          //             });
                          //           },
                          //         ),
                          //
                          //         RadioListTile(
                          //           activeColor: Colors.red,
                          //           title: Text(
                          //             "last 28 days",
                          //             style: GoogleFonts.yantramanav(
                          //                 fontSize: screenHeight * 0.020),
                          //           ),
                          //           value: "last_28_days",
                          //           groupValue: arrival,
                          //           onChanged: (value) {
                          //             setState(() {
                          //               arrival = value.toString();
                          //             });
                          //           },
                          //         )
                          //
                          //         // Expanded(
                          //         //   child: ListView(
                          //         //     shrinkWrap: true,
                          //         //     children: values.keys.map((String key) {
                          //         //       return CheckboxListTile(
                          //         //         activeColor: AppColors.colorLightOrange,
                          //         //         title: Padding(
                          //         //           padding: EdgeInsets.only(left: 12.0),
                          //         //           child: Text(
                          //         //             key,
                          //         //             style: GoogleFonts.poppins(
                          //         //               color: AppColors.colorLightBlack,
                          //         //             ),
                          //         //           ),
                          //         //         ),
                          //         //         value: values[key],
                          //         //         onChanged: (bool? value) {
                          //         //           setState(() {
                          //         //             values[key] = value!;
                          //         //           });
                          //         //         },
                          //         //       );
                          //         //     }).toList(),
                          //         //   ),
                          //         // ),
                          //       ],
                          //     ),
                          //   ),
                          // ],
                        ),
                        // SizedBox(
                        //   height: screenHeight * 0.020,
                        // ),

                        ListTile(
                          //iconColor: Color.fromARGB(255, 238, 98, 49),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: screenHeight * 0.022,
                              )
                            ],
                          ),
                          onTap: () {
                            Get.to(const SizeList());
                          },
                          // children: [
                          //
                          //
                          //   // Column(
                          //   //   children: [
                          //   //
                          //   //     RadioListTile(
                          //   //       title: Text("UK 8"),
                          //   //       value: "UK 8",
                          //   //       groupValue: size,
                          //   //       onChanged: (value){
                          //   //         setState(() {
                          //   //           size = value.toString();
                          //   //         });
                          //   //       },
                          //   //     ),
                          //   //
                          //   //     RadioListTile(
                          //   //       title: Text("UK 10"),
                          //   //       value: "UK 10",
                          //   //       groupValue: size,
                          //   //       onChanged: (value){
                          //   //         setState(() {
                          //   //           size = value.toString();
                          //   //         });
                          //   //       },
                          //   //     ),
                          //   //
                          //   //     RadioListTile(
                          //   //       title: Text("UK 12"),
                          //   //       value: "UK 12",
                          //   //       groupValue: size,
                          //   //       onChanged: (value){
                          //   //         setState(() {
                          //   //           size = value.toString();
                          //   //         });
                          //   //       },
                          //   //     )
                          //   //   ],
                          //   // )
                          //
                          //   // Container(
                          //   //   width: double.infinity,
                          //   //   height: screenHeight * 0.14,
                          //   //   child: Column(
                          //   //     crossAxisAlignment: CrossAxisAlignment.start,
                          //   //     children: [
                          //   //       Expanded(
                          //   //         child: ListView(
                          //   //           shrinkWrap: true,
                          //   //           children: values.keys.map((String key) {
                          //   //             return CheckboxListTile(
                          //   //               activeColor: AppColors.colorLightOrange,
                          //   //               title: Padding(
                          //   //                 padding: EdgeInsets.only(left: 12.0),
                          //   //                 child: Text(
                          //   //                   key,
                          //   //                   style: GoogleFonts.poppins(
                          //   //                     color: AppColors.colorLightBlack,
                          //   //                   ),
                          //   //                 ),
                          //   //               ),
                          //   //               value: values[key],
                          //   //               onChanged: (bool? value) {
                          //   //                 setState(() {
                          //   //                   values[key] = value!;
                          //   //                 });
                          //   //               },
                          //   //             );
                          //   //           }).toList(),
                          //   //         ),
                          //   //       ),
                          //   //     ],
                          //   //   ),
                          //   // ),
                          // ],
                        ),

                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Style",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: screenHeight * 0.022,
                              )
                            ],
                          ),
                        ),

                        // Spacer(),
                        // SizedBox(
                        //   height: screenHeight * 0.020,
                        // ),
                        //
                        // ExpansionTile(
                        //   iconColor: Color.fromARGB(255, 238, 98, 49),
                        //   title: Text(
                        //     "Style",
                        //     style: GoogleFonts.ruluko(
                        //         color: AppColors.colorLightBlack,
                        //         fontSize: screenHeight * 0.022,
                        //         fontWeight: FontWeight.w600),
                        //   ),
                        //   children: [Text("We are still working on it")],
                        // ),

                        ListTile(
                          onTap: () {
                            Get.to(const ColorList());
                          },
                          //iconColor: Color.fromARGB(255, 238, 98, 49),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Colour",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: screenHeight * 0.022,
                              )
                            ],
                          ),
                          // children: [
                          //   Obx(
                          //     () => shopController
                          //                 .isProductColorsLoading.value ==
                          //             true
                          //         ? Center(
                          //             child: Lottie.asset(
                          //                 "assets/json/loading.json",
                          //                 fit: BoxFit.cover,
                          //                 height: screenHeight * 0.095,
                          //                 width: screenWidth * 0.095),
                          //           )
                          //         : ListView.builder(
                          //             physics: ScrollPhysics(),
                          //             shrinkWrap: true,
                          //             itemCount: shopController
                          //                 .apiProductColorsMap?["data"].length,
                          //             itemBuilder: (context, index) {
                          //               return Padding(
                          //                 padding: const EdgeInsets.only(
                          //                     left: 8.0, right: 8.0),
                          //                 child: RadioListTile(
                          //                   activeColor: Colors.red,
                          //                   title: Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     children: [
                          //                       Text(
                          //                         "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color"]}",
                          //                         style:
                          //                             GoogleFonts.yantramanav(
                          //                                 fontSize:
                          //                                     screenHeight *
                          //                                         0.020),
                          //                       ),
                          //                       Icon(Icons.circle_rounded,
                          //                           color: Color(ColorConvert
                          //                               .getColorFromHex(
                          //                                   "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color_code"]}")),
                          //                           size: screenHeight * 0.028)
                          //                     ],
                          //                   ),
                          //                   value:
                          //                       "${shopController.apiProductColorsMap?["data"][index]["e_commerce_color"]}",
                          //                   groupValue: productColor,
                          //                   onChanged: (value) {
                          //                     setState(() {
                          //                       productColor = value.toString();
                          //                     });
                          //                   },
                          //                 ),
                          //               ); //Text("${apiProductSizeMap?["size"][index]["size"]}");
                          //             }),
                          //   ),
                          // ],
                        ),

                        // SizedBox(
                        //   height: screenHeight * 0.020,
                        // ),

                        ListTile(
                          onTap: () {
                            Get.to(const PriceFilter());
                          },
                          //iconColor: Color.fromARGB(255, 238, 98, 49),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: GoogleFonts.yantramanav(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: screenHeight * 0.022,
                              )
                            ],
                          ),
                          // children: [
                          //   Container(
                          //     width: 100.w,
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Container(
                          //           child: Text(
                          //             "£8",
                          //             style: GoogleFonts.yantramanav(
                          //                 fontSize: 10.sp,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           margin:
                          //               EdgeInsets.symmetric(horizontal: 20),
                          //         ),
                          //         Container(
                          //           child: Text(
                          //             "£60",
                          //             style: GoogleFonts.yantramanav(
                          //                 fontSize: 10.sp,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //           margin:
                          //               EdgeInsets.symmetric(horizontal: 20),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   RangeSlider(
                          //     values: _currentRangeValues,
                          //     max: 60,
                          //     min: 8,
                          //     inactiveColor: Colors.grey,
                          //     activeColor: AppColors.colorLightOrange,
                          //     divisions: 10,
                          //     labels: RangeLabels(
                          //       _currentRangeValues.start.round().toString(),
                          //       _currentRangeValues.end.round().toString(),
                          //     ),
                          //     onChanged: (RangeValues values) {
                          //       setState(() {
                          //         _currentRangeValues = values;
                          //       });
                          //     },
                          //   ),
                          //   Text(
                          //     "£${_currentRangeValues.start} to £${_currentRangeValues.end}",
                          //     style: GoogleFonts.yantramanav(
                          //         fontSize: 14.sp, fontWeight: FontWeight.bold),
                          //   )
                          // ],
                        ),

                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.060,
                    child: ElevatedButton(
                        onPressed: () {
                          shopController.searchProduct(
                              shopController.slug.value,
                              arrival,
                              /*category_name*/ shopController
                                  .subCategoryName.value,
                              /*brand_name*/ "",
                              /*tag_name*/ "",
                              "$size",
                              "$productColor",
                              /*fabric_name*/ "",
                              /*neckline__name*/ "",
                              "${_currentRangeValues.end}",
                              "${_currentRangeValues.start}",
                              "" /*sort_by*/);

                          // Navigator.pop(context);
                          //Get.to(() => ShopView());
                          Get.back();
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
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shopController.getProductColors();
    shopController.getProductSize(shopController.slug.value.toString());
  }
}
