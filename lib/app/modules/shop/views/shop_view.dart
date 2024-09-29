// import 'dart:convert';
//
// import 'package:enorsia/app/modules/shop/views/single_product.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../utill/app_colors.dart';
// import '../../utill/app_size.dart';
// import '../../utill/constant.dart';
// import '../../widgets/general_appbar.dart';
// import '../controllers/shop_controller.dart';
// import 'package:http/http.dart' as http;
//
// class ShopView extends GetView<ShopController> {
//   //ShopView(this.slug, {super.key, this.title, this.subTitle});
//
//   // final String title;
//   // final String subTitle;
//   // final String slug;
//
//   var sizeList = <String>['12', '45', '33', '88'];
//   var selectedSize;
//
//   // var isShopProductLoading = false.obs;
//   //
//   // Map <String, dynamic>? apiShopProductMap;
//   // String token="5|YyEX56zcLMxQFrE94iMyV19ry5SDRGphZMVigEXz";
//   //
//   //
//   // ShopView(this.title, this.subTitle, this.slug);
//
//
//
//   ShopController shopController = Get.put(ShopController());
//
//   // ShopView(this.title, this.subTitle, this.slug);
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     //getShopProductData();
//
//
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(screenHeight * 0.08),
//           child: customGeneralAPPBar("Shop")),
//       body: Obx(() => shopController.isShopProductLoading.value==true?
//       CircularProgressIndicator()
//           : SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     "Product/",
//                     style: GoogleFonts.yantramanav(
//                         color: AppColors.colorGrey,
//                         fontSize: screenHeight * 0.020),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     "${shopController.apiShopProductMap?["data"].length} product found !!",
//                     style: GoogleFonts.yantramanav(
//                         color: AppColors.colorLightOrange,
//                         fontSize: screenHeight * 0.017),
//                   ),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(right: 8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => SingleProduct());
//                     },
//                     child: Icon(
//                       Icons.filter_list,
//                       color: AppColors.colorGrey,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//                 padding: EdgeInsets.only(left: 05, right: 05, top: 15.0),
//                 child: GridView.builder(
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: shopController.apiShopProductMap?["data"].length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 20,
//                         crossAxisSpacing: 15,
//                         childAspectRatio: 0.370),
//                     itemBuilder: (context, index) {
//                       return AspectRatio(
//                         aspectRatio: 0.370,
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                             ),
//                             child: Column(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Image.asset(
//                                       "assets/images/placeholder_image.png",
//                                       height: screenHeight * 0.34,
//                                       width: screenWidth * 0.45,
//                                       fit: BoxFit.cover,
//                                     ),
//                                     Positioned(
//                                       bottom: 10,
//                                       right: 10,
//                                       child: Container(
//                                         height: screenHeight * 0.040,
//                                         width: screenWidth * 0.065,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             shape: BoxShape.circle),
//                                         child: Center(
//                                           child: Icon(
//                                             Icons.favorite,
//                                             size: screenHeight * 0.020,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Text(
//                                   "Ribbed Flared Trouser",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: GoogleFonts.yantramanav(
//                                       color: AppColors.colorGrey,
//                                       fontSize: screenHeight * 0.020,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - 30,
//                                   child: const Divider(
//                                     color: AppColors.colorGrey,
//                                     // height: screenWidth / 2 - 10,
//                                     thickness: 1.0,
//                                   ),
//                                 ),
//                                 Container(
//                                   height: screenHeight * 0.025,
//                                   child: ListView.builder(
//                                       physics: ScrollPhysics(),
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: 5,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           margin: EdgeInsets.only(
//                                               left: 2.0, right: 2.0),
//                                           height: screenHeight * 0.025,
//                                           width: screenWidth * 0.050,
//                                           color: index.isOdd
//                                               ? AppColors.colorOrange
//                                               : Colors.purple,
//                                         );
//                                       }),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - 30,
//                                   child: const Divider(
//                                     color: AppColors.colorGrey,
//                                     // height: screenWidth / 2 - 10,
//                                     thickness: 1.0,
//                                   ),
//                                 ),
//                                 Text(
//                                   "£ 20.99",
//                                   style: GoogleFonts.yantramanav(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.020),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - 30,
//                                   child: const Divider(
//                                     color: AppColors.colorGrey,
//                                     // height: screenWidth / 2 - 10,
//                                     thickness: 1.0,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: screenHeight * 0.040,
//                                       width: screenWidth * 0.350,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: Color(0xffC4C4C4), width: 1),
//                                       ),
//                                       child: DropdownButtonHideUnderline(
//                                         child: DropdownButton<String>(
//                                           // underline: SizedBox(),
//                                           isExpanded: true,
//                                           icon: Padding(
//                                             padding: EdgeInsets.only(
//                                               right: 10.0,
//                                             ),
//                                             child: Icon(
//                                               Icons
//                                                   .keyboard_arrow_down_outlined,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           onChanged: (val) {
//                                             selectedSize = val.toString();
//                                           },
//                                           value: this.selectedSize,
//                                           items: sizeList.map((selectValue) {
//                                             return DropdownMenuItem(
//                                                 value: selectValue,
//                                                 child: Padding(
//                                                   padding: EdgeInsets.only(
//                                                       left:
//                                                       screenHeight * 0.019),
//                                                   child: Text(
//                                                       selectValue.toString()),
//                                                 ));
//                                           }).toList(),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: screenWidth * 0.010,
//                                     ),
//                                     Container(
//                                       height: screenHeight * 0.050,
//                                       width: screenWidth * 0.075,
//                                       decoration: BoxDecoration(
//                                           color: AppColors.colorGrey,
//                                           shape: BoxShape.circle),
//                                       child: Center(
//                                         child: Icon(
//                                           Icons.cut,
//                                           color: Colors.white,
//                                           size: screenHeight * 0.020,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - 50,
//                                   child: ElevatedButton(
//                                       onPressed:
//                                       selectedSize.toString().isEmpty ==
//                                           true ||
//                                           selectedSize.toString() == ""
//                                           ? null
//                                           : () {},
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:
//                                         AppColors.colorLightOrange,
//                                         elevation: 0,
//                                         minimumSize:
//                                         const Size.fromHeight(30), // NEW
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(8.0),
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children: [
//                                           SvgPicture.asset(
//                                             "assets/images/cart.svg",
//                                             height: screenHeight * 0.020,
//                                             width: screenWidth * 0.050,
//                                             fit: BoxFit.fill,
//                                             color: Colors.white,
//                                           ),
//                                           Text(
//                                             "Add to Bag",
//                                             style: GoogleFonts.gothicA1(),
//                                           ),
//                                         ],
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     })),
//           ],
//         ),
//       ),
//       )
//
//
//     );
//   }
//
//   // Future<void> getShopProductData() async
//   // {
//   //
//   //   isShopProductLoading.value = true;
//   //   print("response shop detail start point ............");
//   //   var response= await http.get(
//   //       Uri.parse('${BASE_URL}api/category-wise-product?keyword=polo-shirt'),
//   //       headers: {
//   //         'Authorization': 'Bearer $token',
//   //       }
//   //   );
//   //
//   //   apiShopProductMap=jsonDecode(response.body);
//   //   isShopProductLoading.value = false;
//   //
//   //   print("response .....shop detail......."+response.statusCode.toString());
//   //
//   // }
//
//
//
// }

////// for row data

import 'package:enorsia/app/modules/shop/views/single_product.dart';
import 'package:enorsia/app/modules/utill/constant.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import '../../account/views/my_bag.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
// import '../../utill/color_convereter.dart';
import '../../utill/sql_helper.dart';
// import '../../utill/sql_wishlist_helper.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';
import 'filter_view.dart';

class ShopView extends GetView<ShopController> {
  //final String slug;

  ShopView({super.key, this.title, this.subTitle});

  ShopController shopController = Get.put(ShopController());

  final String? title;
  final String? subTitle;

  RxInt productShow = 2.obs;

  // grid_show=true== 2 columb; grid_show=false== 1 columb

  var sizeList = <String>['12', '45', '33', '88'];
  var selectedSize;

  @override
  Widget build(BuildContext context) {
    // shopController.getShopProductData();

    var selectedSize = "".obs;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Shop")),
        body: Obx(() => shopController.isShopProductLoading.value == true
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
            : RefreshIndicator(
                onRefresh: _onRefreshDataLoad,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(left: screenWidth * 0.15),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           controller.getShopProductData();
                      //         },
                      //         child: Text(
                      //           "Sort",
                      //           style: GoogleFonts.yantramanav(
                      //               color: AppColors.colorGrey,
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: screenHeight * 0.020),
                      //         ),
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Padding(
                      //       padding: EdgeInsets.only(left: screenWidth * 0.10),
                      //       child: Container(
                      //         width: 2,
                      //         height: screenHeight * 0.030,
                      //         color: AppColors.colorGrey,
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Padding(
                      //       padding: EdgeInsets.only(left: screenWidth * 0.010),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Get.to(() => FilterView());
                      //
                      //           // showDialog(
                      //           //     context: context,
                      //           //     builder: (context) {
                      //           //       return AlertDialog(
                      //           //           backgroundColor: Colors.white,
                      //           //           content: StatefulBuilder(builder:
                      //           //               (BuildContext context,
                      //           //                   StateSetter setState) {
                      //           //             return SizedBox(
                      //           //               width: double.infinity,
                      //           //               child: Column(
                      //           //                 mainAxisSize: MainAxisSize.max,
                      //           //                 crossAxisAlignment:
                      //           //                     CrossAxisAlignment.start,
                      //           //                 children: [
                      //           //                   ExpansionTile(
                      //           //                     iconColor: Color.fromARGB(
                      //           //                         255, 238, 98, 49),
                      //           //                     title: Text(
                      //           //                       "Recent",
                      //           //                       style: GoogleFonts.ruluko(
                      //           //                           color: AppColors
                      //           //                               .colorLightBlack,
                      //           //                           fontSize:
                      //           //                               screenHeight * 0.022,
                      //           //                           fontWeight:
                      //           //                               FontWeight.w600),
                      //           //                     ),
                      //           //                     children: [
                      //           //                       Container(
                      //           //                         // width: double.infinity,
                      //           //                         child: Column(
                      //           //                           children: [
                      //           //                             Text("check box 1"),
                      //           //                             Text("check box 1"),
                      //           //                           ],
                      //           //                         ),
                      //           //                       ),
                      //           //                     ],
                      //           //                   )
                      //           //                 ],
                      //           //               ),
                      //           //             );
                      //           //           }));
                      //           //     });
                      //         },
                      //         child: Text(
                      //           "Filter",
                      //           style: GoogleFonts.yantramanav(
                      //               color: AppColors.colorGrey,
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: screenHeight * 0.020),
                      //         ),
                      //       ),
                      //     ),
                      //     Spacer(),
                      //   ],
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.getShopProductData();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.colorWhite,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Sort By',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: AppColors
                                                      .colorLightBlack),
                                            ),
                                          ),
                                          const Divider(
                                            color: AppColors.colorGrey,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.015,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sortType.value = "most-popular";
                                              controller.getShopProductDataBySort();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Most Popular',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: AppColors
                                                        .colorLightBlack),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.010,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sortType.value = "most-relevant";
                                              controller.getShopProductDataBySort();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Most Relevant',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: AppColors
                                                        .colorLightBlack),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.010,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sortType.value = "low-to-high";
                                              controller.getShopProductDataBySort();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Price : Low - High',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: AppColors
                                                        .colorLightBlack),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.010,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.sortType.value = "high-to-low";
                                              controller.getShopProductDataBySort();
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Price : High - Low',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: AppColors
                                                        .colorLightBlack),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: SizedBox(
                              height: screenHeight * 0.022,
                              width: screenWidth / 2 - 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sort",
                                    style: GoogleFonts.yantramanav(
                                        color: AppColors.colorLightBlack,
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenHeight * 0.019),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.020,
                                  ),
                                  Image.asset("assets/images/sort_icon.png",
                                      height: screenHeight * 0.055,
                                      width: screenWidth * 0.045,
                                      color: AppColors.colorLightBlack)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: screenHeight * 0.020,
                            color: AppColors.colorGrey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const FilterView());
                            },
                            child: SizedBox(
                              width: screenWidth / 2 - 10,
                              height: screenHeight * 0.020,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Filter",
                                    style: GoogleFonts.yantramanav(
                                        color: AppColors.colorLightBlack,
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenHeight * 0.019),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.020,
                                  ),
                                  Image.asset("assets/images/filter_icon.png",
                                      height: screenHeight * 0.055,
                                      width: screenWidth * 0.045,
                                      color: AppColors.colorLightBlack)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: const Divider(
                          color: AppColors.colorLightBlack,
                          thickness: 1.0,
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(left: 8.0),
                      //       child: Text(
                      //         "Product/${shopController.slug.value}/${shopController.subCategoryName.value}",
                      //         style: GoogleFonts.yantramanav(
                      //             color: AppColors.colorGrey,
                      //             fontSize: screenHeight * 0.020),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${shopController.apiShopProductMap?["data"].length} products found !!",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorGrey,
                                  fontSize: screenHeight * 0.017),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      productShow.value = 3;
                                      // grid_show.value = !grid_show.value;
                                    },
                                    child: Icon(Icons.grid_on_outlined,
                                        color: productShow.value == 3
                                            ? Colors.black
                                            : Colors
                                                .grey //AppColors.colorLightBlack,
                                        )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      productShow.value = 2;
                                      //grid_show.value = !grid_show.value;
                                    },
                                    child: Icon(Icons.grid_view,
                                        color: productShow.value == 2
                                            ? Colors.black
                                            : Colors
                                                .grey //AppColors.colorLightBlack,
                                        )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      productShow.value = 1;
                                      //grid_show.value = !grid_show.value;
                                    },
                                    child: Icon(Icons.check_box_outline_blank,
                                        color: productShow.value == 1
                                            ? Colors.black
                                            : Colors
                                                .grey //AppColors.colorLightBlack,
                                        )),
                              ),
                            ],
                          )
                        ],
                      ),

                      Obx(() => productShow == 2
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.020,
                                  right: screenWidth * 0.020,
                                  top: 15.0),
                              child: shopController
                                          .apiShopProductMap?["data"].length ==
                                      0
                                  ? Container(
                                   height: screenHeight / 2,
                                   width: screenWidth,
                                    child: Center(
                                        child: Text(
                                          "No Product Found ....",
                                          style: GoogleFonts.yantramanav(
                                              fontSize: screenHeight * 0.020),
                                        ),
                                      ),
                                  )
                                  : RefreshIndicator(
                                      onRefresh: _onRefreshDataLoad,
                                      child: GridView.builder(
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: shopController
                                              .apiShopProductMap?["data"]
                                              .length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 20,
                                                  crossAxisSpacing: 15,
                                                  childAspectRatio:
                                                      screenWidth /
                                                          (screenHeight * 1.2)
                                                  // screenHeight > 900
                                                  //     ? 0.600
                                                  //     : 0.600

                                                  ),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () async {
                                                await shopController
                                                    .getShopProductDetailData(
                                                        '${shopController.apiShopProductMap?["data"][index]["slug"]}');

                                                Get.to(() => const SingleProduct(
                                                    //Product_slug: '${shopController.apiShopProductMap?["data"][index]["slug"]}',
                                                    ));

                                                //  shopController.getShopProductDetailData(widget.Product_slug);
                                                //shopController.productDetailName.value=shopController.apiShopProductMap?["data"][index]["slug"];
                                                // sizeList: shopController.apiShopProductMap?["data"][index]["sizes"],));
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        FadeInImage(
                                                          image: NetworkImage(
                                                            "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                          ),
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/placeholder_image.png'),
                                                          fit: BoxFit.cover,
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              "assets/images/placeholder_image.png",
                                                              height:
                                                                  screenHeight *
                                                                      0.28,
                                                              width:
                                                                  screenWidth *
                                                                      0.42,
                                                              fit: BoxFit.cover,
                                                            );
                                                          },
                                                          height: screenHeight *
                                                              0.28,
                                                          width: screenWidth *
                                                              0.42,
                                                        ),

                                                        // Image.network(
                                                        //   "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                        //   height:
                                                        //       screenHeight *
                                                        //           0.28,
                                                        //   width:
                                                        //       screenWidth *
                                                        //           0.42,
                                                        //   fit: BoxFit.fill,
                                                        //   loadingBuilder:
                                                        //       (BuildContext
                                                        //               context,
                                                        //           Widget
                                                        //               child,
                                                        //           ImageChunkEvent?
                                                        //               loadingProgress) {
                                                        //     if (loadingProgress ==
                                                        //         null) {
                                                        //       return child;
                                                        //     }
                                                        //     return Center(
                                                        //       child: Lottie.asset(
                                                        //           "assets/json/loading.json",
                                                        //           fit: BoxFit
                                                        //               .cover,
                                                        //           height: screenHeight *
                                                        //               0.095,
                                                        //           width: screenWidth *
                                                        //               0.095),
                                                        //     );
                                                        //   },
                                                        // ),
                                                        Positioned(
                                                          bottom: 10,
                                                          right: 10,
                                                          child: Container(
                                                            height:
                                                                screenHeight *
                                                                    0.040,
                                                            width: screenWidth *
                                                                0.065,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                size:
                                                                    screenHeight *
                                                                        0.020,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.003,
                                                    ),
                                                    Text(
                                                      "${shopController.apiShopProductMap?["data"][index]["name"]}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .yantramanav(
                                                              color: AppColors
                                                                  .colorLightBlack,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.016,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          screenWidth / 2 - 30,
                                                      child: const Divider(
                                                        color:
                                                            AppColors.colorGrey,
                                                        // height: screenWidth / 2 - 10,
                                                        thickness: 1.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.025,
                                                      child: shopController
                                                                  .apiShopProductMap?[
                                                                      "data"]
                                                                      [index]
                                                                      ["colors"]
                                                                  .length ==
                                                              0
                                                          ? Container()
                                                          : ListView.builder(
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                              itemCount: shopController
                                                                  .apiShopProductMap?[
                                                                      "data"]
                                                                      [index]
                                                                      ["colors"]
                                                                  .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      colorIndex) {
                                                                return Container(
                                                                    margin: const EdgeInsets.only(
                                                                        left:
                                                                            2.0,
                                                                        right:
                                                                            2.0),
                                                                    height:
                                                                        screenHeight *
                                                                            0.025,
                                                                    width:
                                                                        screenWidth *
                                                                            0.050,

                                                                    //color: Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["e_commerce_color_code"]}")),

                                                                    child: shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"] != null ||
                                                                            shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"] !=
                                                                                "NULL"
                                                                        ?

                                                                        //Image.network("https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}",)
                                                                        ////////////////////////////////////////////////////////////

                                                                        FadeInImage(
                                                                            image:
                                                                                NetworkImage("${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}"),
                                                                            placeholder:
                                                                                const AssetImage('assets/images/placeholder_image.png'),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            imageErrorBuilder: (context,
                                                                                error,
                                                                                stackTrace) {
                                                                              return Container(
                                                                                height: screenHeight * 0.29,
                                                                                width: screenWidth * 0.95,
                                                                                color: AppColors.colorWhite,
                                                                              );
                                                                            },
                                                                            height:
                                                                                screenHeight * 0.29,
                                                                            width:
                                                                                screenWidth * 0.95,
                                                                          )

                                                                        //////////////////////////////////////////////////////////////

                                                                        : Container(
                                                                            color:
                                                                                Colors.white,
                                                                          )
                                                                    // color: index.isOdd
                                                                    //     ? AppColors.colorOrange
                                                                    //     : Colors.purple,

                                                                    //Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][index]}")),
                                                                    );
                                                              }),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          screenWidth / 2 - 30,
                                                      child: const Divider(
                                                        color:
                                                            AppColors.colorGrey,
                                                        // height: screenWidth / 2 - 10,
                                                        thickness: 1.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "£ ${shopController.apiShopProductMap?["data"][index]["price"]}",
                                                      style: GoogleFonts
                                                          .yantramanav(
                                                              color: AppColors
                                                                  .colorLightBlack,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.020),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          screenWidth / 2 - 30,
                                                      child: const Divider(
                                                        color:
                                                            AppColors.colorGrey,
                                                        // height: screenWidth / 2 - 10,
                                                        thickness: 1.0,
                                                      ),
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Container(
                                                    //       height: screenHeight *
                                                    //           0.040,
                                                    //       width: screenWidth *
                                                    //           0.350,
                                                    //       decoration:
                                                    //           BoxDecoration(
                                                    //         border: Border.all(
                                                    //             color: const Color(
                                                    //                 0xffC4C4C4),
                                                    //             width: 1),
                                                    //       ),
                                                    //       child:
                                                    //           DropdownButtonHideUnderline(
                                                    //         child:
                                                    //             DropdownButton<
                                                    //                 String>(
                                                    //           // underline: SizedBox(),
                                                    //           isExpanded: true,
                                                    //           icon:
                                                    //               const Padding(
                                                    //             padding:
                                                    //                 EdgeInsets
                                                    //                     .only(
                                                    //               right: 10.0,
                                                    //             ),
                                                    //             child: Icon(
                                                    //               Icons
                                                    //                   .keyboard_arrow_down_outlined,
                                                    //               color: Colors
                                                    //                   .black,
                                                    //             ),
                                                    //           ),
                                                    //           onChanged: (val) {
                                                    //             selectedSize
                                                    //                     .value =
                                                    //                 val.toString();
                                                    //           },
                                                    //           value: this
                                                    //               .selectedSize,
                                                    //           items: sizeList.map(
                                                    //               (selectValue) {
                                                    //             return DropdownMenuItem(
                                                    //                 value:
                                                    //                     selectValue,
                                                    //                 child:
                                                    //                     Padding(
                                                    //                   padding: EdgeInsets.only(
                                                    //                       left: screenHeight *
                                                    //                           0.019),
                                                    //                   child: Text(
                                                    //                       selectValue
                                                    //                           .toString()),
                                                    //                 ));
                                                    //           }).toList(),
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: screenWidth *
                                                    //           0.010,
                                                    //     ),
                                                    //     Container(
                                                    //       height: screenHeight *
                                                    //           0.050,
                                                    //       width: screenWidth *
                                                    //           0.075,
                                                    //       decoration:
                                                    //           const BoxDecoration(
                                                    //               color: AppColors
                                                    //                   .colorGrey,
                                                    //               shape: BoxShape
                                                    //                   .circle),
                                                    //       // child: Center(
                                                    //       //   child: Icon(
                                                    //       //     Icons.scal,
                                                    //       //     color: Colors.white,
                                                    //       //     size: screenHeight * 0.020,
                                                    //       //   ),
                                                    //       // ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                    SizedBox(
                                                      height:
                                                          screenHeight * 0.050,
                                                      width:
                                                          screenWidth / 2 - 46,
                                                      child: ElevatedButton(
                                                          onPressed: shopController.apiShopProductMap?["data"][index]["colors"].length == 0
                                                              ? () {
                                                                  Get.snackbar(
                                                                    "Status",
                                                                    "This product is not available right now",
                                                                    colorText:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .orangeAccent,
                                                                    snackPosition:
                                                                        SnackPosition
                                                                            .BOTTOM,
                                                                  );
                                                                }
                                                              : () {



                                                                  showModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return SizedBox(
                                                                          width:
                                                                              screenWidth,
                                                                          height: screenHeight /
                                                                              2,
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child: Column(
                                                                                // crossAxisAlignment:
                                                                                //     CrossAxisAlignment
                                                                                //         .center,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      // Image.asset(
                                                                                      //   "assets/images/measure.png",
                                                                                      //   fit: BoxFit
                                                                                      //       .cover,
                                                                                      // ),
                                                                                      Text(
                                                                                        "Size Guide",
                                                                                        style: GoogleFonts.poppins(fontSize: screenHeight * 0.025),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: screenWidth,
                                                                                    child: Divider(
                                                                                      color: AppColors.colorGrey.withOpacity(0.3),
                                                                                      // height: screenWidth / 2 - 10,
                                                                                      thickness: 5.0,
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      // Image.asset(
                                                                                      //   "assets/images/measure.png",
                                                                                      //   fit: BoxFit
                                                                                      //       .cover,
                                                                                      // ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.only(left: screenWidth * 0.020),
                                                                                        child: Text(
                                                                                          "Choose a size",
                                                                                          style: GoogleFonts.poppins(fontSize: screenHeight * 0.019),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: screenWidth,
                                                                                    child: Divider(
                                                                                      color: AppColors.colorGrey.withOpacity(0.3),
                                                                                      // height: screenWidth / 2 - 10,
                                                                                      thickness: 3.0,
                                                                                    ),
                                                                                  ),
                                                                                  Center(
                                                                                    child: Container(
                                                                                      child: ListView.builder(
                                                                                          shrinkWrap: true,
                                                                                          physics: const ScrollPhysics(),
                                                                                          itemCount: shopController.apiShopProductMap?["data"][index]["sizes"].length,
                                                                                          itemBuilder: (context, indexsize) {
                                                                                            return InkWell(


                                                                                              onTap: (){



                                                                                                Navigator.of(context).pop();
                                                                                                selectedSize.value = "${shopController.apiShopProductMap!["data"][index]["sizes"][indexsize]}";

                                                                                                SQLHelper.createItem("${shopController.apiShopProductMap!["data"][index]["name"]}", "${shopController.apiShopProductMap!["data"][index]["price"]}", selectedSize.value, "${shopController.apiShopProductMap!["data"][index]['id']}", "${shopController.apiShopProductMap!["data"][index]["colors"][0]}", "1", "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap!["data"][index]["product_image"]}");
                                                                                                Get.to(() => const MyBagView());

                                                                                                // SQLHelper.createItem(
                                                                                                //     "${shopController.apiShopProductMap?["data"][index]["name"]}",
                                                                                                //     //totalPrice.value.toStringAsFixed(2),
                                                                                                //     "${shopController.apiShopProductMap?["data"][index]["price"]}",
                                                                                                //     "${shopController.apiShopProductMap?["data"][index]["sizes"][indexsize]}",
                                                                                                //     "${shopController.apiShopProductMap?["data"]["product"]['id']}",
                                                                                                //     "${shopController.apiShopProductMap?["data"]["colors"][0]['id']}",
                                                                                                //     "1",
                                                                                                //     "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][0]["aop_image"]}");




                                                                                              },



                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.only(top: screenHeight * 0.005, bottom: screenHeight * 0.005),
                                                                                                child: Center(
                                                                                                    child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    Navigator.of(context).pop();
                                                                                                    selectedSize.value = "${shopController.apiShopProductMap!["data"][index]["sizes"][indexsize]}";

                                                                                                    SQLHelper.createItem("${shopController.apiShopProductMap!["data"][index]["name"]}", "${shopController.apiShopProductMap!["data"][index]["price"]}", selectedSize.value, "${shopController.apiShopProductMap!["data"][index]['id']}", "${shopController.apiShopProductMap!["data"][index]["colors"][0]}", "1", "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap!["data"][index]["product_image"]}");
                                                                                                    Get.to(() => const MyBagView());
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    "${shopController.apiShopProductMap?["data"][index]["sizes"][indexsize]}",
                                                                                                    style: GoogleFonts.poppins(fontSize: screenHeight * 0.016),
                                                                                                  ),
                                                                                                )
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                          ));
                                                                    },
                                                                  );







                                                                },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                AppColors
                                                                    .colorWhite,
                                                            elevation: 0,
                                                            minimumSize:
                                                                const Size
                                                                    .fromHeight(
                                                                    30), // NEW
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side:
                                                                  const BorderSide(
                                                                      width:
                                                                          2, // thickness
                                                                      color: AppColors
                                                                          .colorLightBlack // color
                                                                      ),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              // SvgPicture.asset(
                                                              //   "assets/images/cart.svg",
                                                              //   height: screenHeight * 0.020,
                                                              //   width: screenWidth * 0.050,
                                                              //   fit: BoxFit.fill,
                                                              //   color: Colors.white,
                                                              // ),
                                                              const Icon(
                                                                  Icons
                                                                      .shopping_bag_outlined,
                                                                  color: AppColors
                                                                      .colorLightBlack),
                                                              Text(
                                                                "Add to Bag",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: AppColors
                                                                            .colorLightBlack),
                                                              ),
                                                            ],
                                                          )
                                                      ),





                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ))
                          : productShow == 3
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.020,
                                      right: screenWidth * 0.020,
                                      top: 15.0),
                                  child: shopController
                                              .apiShopProductMap?["data"]
                                              .length ==
                                          0
                                      ? Center(
                                          child: Text(
                                            "no product found ....",
                                            style: GoogleFonts.yantramanav(
                                                fontSize: screenHeight * 0.020),
                                          ),
                                        )
                                      : RefreshIndicator(
                                          onRefresh: _onRefreshDataLoad,
                                          child: GridView.builder(
                                              physics: const ScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: shopController
                                                  .apiShopProductMap?["data"]
                                                  .length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 20,
                                                      crossAxisSpacing: 15,
                                                      childAspectRatio: screenWidth /
                                                          (screenHeight * 1.2)
                                                          // screenHeight > 900
                                                          //     ? 0.600
                                                          //     : 0.450
                                                              ),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () async {
                                                    await shopController
                                                        .getShopProductDetailData(
                                                            '${shopController.apiShopProductMap?["data"][index]["slug"]}');

                                                    Get.to(() =>
                                                        const SingleProduct(
                                                            //Product_slug: '${shopController.apiShopProductMap?["data"][index]["slug"]}',
                                                            ));

                                                    //  shopController.getShopProductDetailData(widget.Product_slug);
                                                    //shopController.productDetailName.value=shopController.apiShopProductMap?["data"][index]["slug"];
                                                    // sizeList: shopController.apiShopProductMap?["data"][index]["sizes"],));
                                                  },
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Stack(
                                                          children: [


                                                             FadeInImage(
                                                          image: NetworkImage(
                                                            "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                          ),
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/placeholder_image.png'),
                                                          fit: BoxFit.cover,
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              "assets/images/placeholder_image.png",
                                                              height:
                                                                  screenHeight *
                                                                      0.28,
                                                              width:
                                                                  screenWidth *
                                                                      0.42,
                                                              fit: BoxFit.cover,
                                                            );
                                                          },
                                                          height: screenHeight *
                                                              0.28,
                                                          width: screenWidth *
                                                              0.42,
                                                        ),
                                                            // Image.network(
                                                            //   "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                            //   height:
                                                            //       screenHeight *
                                                            //           0.28,
                                                            //   width:
                                                            //       screenWidth *
                                                            //           0.42,
                                                            //   fit: BoxFit.cover,
                                                            //   loadingBuilder:
                                                            //       (BuildContext
                                                            //               context,
                                                            //           Widget
                                                            //               child,
                                                            //           ImageChunkEvent?
                                                            //               loadingProgress) {
                                                            //     if (loadingProgress ==
                                                            //         null) {
                                                            //       return child;
                                                            //     }
                                                            //     return Center(
                                                            //       child: Lottie.asset(
                                                            //           "assets/json/loading.json",
                                                            //           fit: BoxFit
                                                            //               .cover,
                                                            //           height: screenHeight *
                                                            //               0.095,
                                                            //           width: screenWidth *
                                                            //               0.095),
                                                            //     );
                                                            //   },
                                                            // ),
                                                            // Positioned(
                                                            //   bottom: 10,
                                                            //   right: 10,
                                                            //   child: Container(
                                                            //     height: screenHeight *
                                                            //         0.040,
                                                            //     width:
                                                            //     screenWidth * 0.065,
                                                            //     decoration:
                                                            //     BoxDecoration(
                                                            //         color: Colors
                                                            //             .white,
                                                            //         shape: BoxShape
                                                            //             .circle),
                                                            //     child: Center(
                                                            //       child: Icon(
                                                            //         Icons
                                                            //             .favorite_border,
                                                            //         size: screenHeight *
                                                            //             0.020,
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // )
                                                          ],
                                                        ),

                                                        // SizedBox(
                                                        //   height: screenHeight * 0.005,
                                                        // ),
                                                        // Text(
                                                        //   "${shopController.apiShopProductMap?["data"][index]["name"]}",
                                                        //   overflow:
                                                        //   TextOverflow.ellipsis,
                                                        //   style:
                                                        //   GoogleFonts.yantramanav(
                                                        //       color: AppColors
                                                        //           .colorLightBlack,
                                                        //       fontSize:
                                                        //       screenHeight *
                                                        //           0.020,
                                                        //       fontWeight:
                                                        //       FontWeight.w500),
                                                        // ),
                                                        // Container(
                                                        //   width: screenWidth / 2 - 30,
                                                        //   child: const Divider(
                                                        //     color: AppColors.colorGrey,
                                                        //     // height: screenWidth / 2 - 10,
                                                        //     thickness: 1.0,
                                                        //   ),
                                                        // ),
                                                        // Container(
                                                        //   height: screenHeight * 0.025,
                                                        //   child: shopController
                                                        //       .apiShopProductMap?[
                                                        //   "data"][index]
                                                        //   ["colors"]
                                                        //       .length ==
                                                        //       0
                                                        //       ? Container()
                                                        //       : ListView.builder(
                                                        //       shrinkWrap: true,
                                                        //       scrollDirection:
                                                        //       Axis.horizontal,
                                                        //       itemCount: shopController
                                                        //           .apiShopProductMap?[
                                                        //       "data"][index]
                                                        //       ["colors"]
                                                        //           .length,
                                                        //       itemBuilder: (context,
                                                        //           colorIndex) {
                                                        //         return Container(
                                                        //             margin: EdgeInsets.only(left: 2.0, right: 2.0),
                                                        //             height: screenHeight * 0.025,
                                                        //             width: screenWidth * 0.050,
                                                        //
                                                        //             //color: Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["e_commerce_color_code"]}")),
                                                        //
                                                        //             child: shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]!=null ||
                                                        //                 shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]!="NULL"?
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //             //Image.network("https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}",)
                                                        //             ////////////////////////////////////////////////////////////
                                                        //
                                                        //             FadeInImage(
                                                        //               image: NetworkImage("https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}"),
                                                        //               placeholder:
                                                        //               AssetImage('assets/images/placeholder_image.png'),
                                                        //               fit: BoxFit.cover,
                                                        //               imageErrorBuilder: (context, error, stackTrace) {
                                                        //                 return Container(
                                                        //                   height: screenHeight * 0.29,
                                                        //                   width: screenWidth * 0.95,
                                                        //                   color: AppColors.colorWhite,
                                                        //                 );
                                                        //               },
                                                        //               height: screenHeight * 0.29,
                                                        //               width: screenWidth * 0.95,
                                                        //             )
                                                        //
                                                        //             //////////////////////////////////////////////////////////////
                                                        //
                                                        //
                                                        //
                                                        //                 :
                                                        //             Container(
                                                        //               color: Colors.white,)
                                                        //           // color: index.isOdd
                                                        //           //     ? AppColors.colorOrange
                                                        //           //     : Colors.purple,
                                                        //
                                                        //           //Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][index]}")),
                                                        //         );
                                                        //       }),
                                                        // ),
                                                        // Container(
                                                        //   width: screenWidth / 2 - 30,
                                                        //   child: const Divider(
                                                        //     color: AppColors.colorGrey,
                                                        //     // height: screenWidth / 2 - 10,
                                                        //     thickness: 1.0,
                                                        //   ),
                                                        // ),
                                                        // Text(
                                                        //   "£ ${shopController.apiShopProductMap?["data"][index]["price"]}",
                                                        //   style:
                                                        //   GoogleFonts.yantramanav(
                                                        //       color: AppColors
                                                        //           .colorLightBlack,
                                                        //       fontSize:
                                                        //       screenHeight *
                                                        //           0.020),
                                                        // ),
                                                        // Container(
                                                        //   width: screenWidth / 2 - 30,
                                                        //   child: const Divider(
                                                        //     color: AppColors.colorGrey,
                                                        //     // height: screenWidth / 2 - 10,
                                                        //     thickness: 1.0,
                                                        //   ),
                                                        // ),
                                                        //
                                                        // Container(
                                                        //   height: screenHeight * 0.050,
                                                        //   width: screenWidth / 2 - 46,
                                                        //   child: ElevatedButton(
                                                        //       onPressed: shopController
                                                        //           .apiShopProductMap?[
                                                        //       "data"]
                                                        //       [index]
                                                        //       ["colors"]
                                                        //           .length ==
                                                        //           0
                                                        //           ? () {
                                                        //         Get.snackbar(
                                                        //           "Status",
                                                        //           "This product is not available right now",
                                                        //           colorText:
                                                        //           Colors
                                                        //               .white,
                                                        //           backgroundColor:
                                                        //           Colors
                                                        //               .orangeAccent,
                                                        //           snackPosition:
                                                        //           SnackPosition
                                                        //               .BOTTOM,
                                                        //         );
                                                        //       }
                                                        //           : () {
                                                        //         showModalBottomSheet(
                                                        //           context:
                                                        //           context,
                                                        //           builder:
                                                        //               (context) {
                                                        //             return Container(
                                                        //                 width:
                                                        //                 screenWidth,
                                                        //                 height:
                                                        //                 screenHeight /
                                                        //                     2,
                                                        //                 child:
                                                        //                 SingleChildScrollView(
                                                        //                   child: Column(
                                                        //                     // crossAxisAlignment:
                                                        //                     //     CrossAxisAlignment
                                                        //                     //         .center,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           mainAxisAlignment: MainAxisAlignment.center,
                                                        //                           children: [
                                                        //                             // Image.asset(
                                                        //                             //   "assets/images/measure.png",
                                                        //                             //   fit: BoxFit
                                                        //                             //       .cover,
                                                        //                             // ),
                                                        //                             Text(
                                                        //                               "Size Guide",
                                                        //                               style: GoogleFonts.poppins(fontSize: screenHeight * 0.025),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         Container(
                                                        //                           width: screenWidth,
                                                        //                           child: Divider(
                                                        //                             color: AppColors.colorGrey.withOpacity(0.3),
                                                        //                             // height: screenWidth / 2 - 10,
                                                        //                             thickness: 5.0,
                                                        //                           ),
                                                        //                         ),
                                                        //                         Row(
                                                        //                           mainAxisAlignment: MainAxisAlignment.start,
                                                        //                           children: [
                                                        //                             // Image.asset(
                                                        //                             //   "assets/images/measure.png",
                                                        //                             //   fit: BoxFit
                                                        //                             //       .cover,
                                                        //                             // ),
                                                        //                             Padding(
                                                        //                               padding: EdgeInsets.only(left: screenWidth * 0.020),
                                                        //                               child: Text(
                                                        //                                 "Choose a size",
                                                        //                                 style: GoogleFonts.poppins(fontSize: screenHeight * 0.019),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         Container(
                                                        //                           width: screenWidth,
                                                        //                           child: Divider(
                                                        //                             color: AppColors.colorGrey.withOpacity(0.3),
                                                        //                             // height: screenWidth / 2 - 10,
                                                        //                             thickness: 3.0,
                                                        //                           ),
                                                        //                         ),
                                                        //                         Center(
                                                        //                           child: Container(
                                                        //                             child: ListView.builder(
                                                        //                                 shrinkWrap: true,
                                                        //                                 physics: ScrollPhysics(),
                                                        //                                 itemCount: shopController.apiShopProductMap?["data"][index]["sizes"].length,
                                                        //                                 itemBuilder: (context, indexsize) {
                                                        //                                   return Padding(
                                                        //                                     padding: EdgeInsets.only(top: screenHeight * 0.005, bottom: screenHeight * 0.005),
                                                        //                                     child: Center(
                                                        //                                         child: GestureDetector(
                                                        //                                           onTap: () {
                                                        //                                             Navigator.of(context).pop();
                                                        //                                             selectedSize.value = "${shopController.apiShopProductMap!["data"][index]["sizes"][indexsize]}";
                                                        //
                                                        //                                             SQLHelper.createItem("${shopController.apiShopProductMap!["data"][index]["name"]}", "${shopController.apiShopProductMap!["data"][index]["price"]}", selectedSize.value, "${shopController.apiShopProductMap!["data"][index]['id']}", "${shopController.apiShopProductMap!["data"][index]["colors"][0]}", "1", "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap!["data"][index]["product_image"]}");
                                                        //                                             Get.to(() => MyBagView());
                                                        //                                           },
                                                        //                                           child: Text(
                                                        //                                             "${shopController.apiShopProductMap?["data"][index]["sizes"][indexsize]}",
                                                        //                                             style: GoogleFonts.poppins(fontSize: screenHeight * 0.016),
                                                        //                                           ),
                                                        //                                         )),
                                                        //                                   );
                                                        //                                 }),
                                                        //                           ),
                                                        //                         )
                                                        //                       ]),
                                                        //                 ));
                                                        //           },
                                                        //         );
                                                        //       },
                                                        //       style: ElevatedButton
                                                        //           .styleFrom(
                                                        //         backgroundColor:
                                                        //         AppColors
                                                        //             .colorWhite,
                                                        //         elevation: 0,
                                                        //         minimumSize: const Size
                                                        //             .fromHeight(
                                                        //             30), // NEW
                                                        //         shape:
                                                        //         RoundedRectangleBorder(
                                                        //           borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(
                                                        //               8.0),
                                                        //           side:
                                                        //           const BorderSide(
                                                        //               width:
                                                        //               2, // thickness
                                                        //               color: AppColors
                                                        //                   .colorLightBlack // color
                                                        //           ),
                                                        //         ),
                                                        //       ),
                                                        //       child: Row(
                                                        //         mainAxisAlignment:
                                                        //         MainAxisAlignment
                                                        //             .spaceBetween,
                                                        //         children: [
                                                        //           // SvgPicture.asset(
                                                        //           //   "assets/images/cart.svg",
                                                        //           //   height: screenHeight * 0.020,
                                                        //           //   width: screenWidth * 0.050,
                                                        //           //   fit: BoxFit.fill,
                                                        //           //   color: Colors.white,
                                                        //           // ),
                                                        //           Icon(
                                                        //               Icons
                                                        //                   .shopping_bag_outlined,
                                                        //               color: AppColors
                                                        //                   .colorLightBlack),
                                                        //           Text(
                                                        //             "Add to Bag",
                                                        //             style: GoogleFonts.poppins(
                                                        //                 color: AppColors
                                                        //                     .colorLightBlack),
                                                        //           ),
                                                        //         ],
                                                        //       )),
                                                        // )
                                                        //
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ))
                              : Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.020,
                                      right: screenWidth * 0.020,
                                      top: 15.0),
                                  child:
                                      shopController.apiShopProductMap?["data"]
                                                  .length ==
                                              0
                                          ? Center(
                                              child: Text(
                                                "no product found ....",
                                                style: GoogleFonts.yantramanav(
                                                    fontSize:
                                                        screenHeight * 0.020),
                                              ),
                                            )
                                          : RefreshIndicator(
                                              onRefresh: _onRefreshDataLoad,
                                              child: GridView.builder(
                                                  physics:
                                                      const ScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: shopController
                                                      .apiShopProductMap?[
                                                          "data"]
                                                      .length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 1,
                                                          mainAxisSpacing: 20,
                                                          crossAxisSpacing: 15,
                                                          childAspectRatio: screenWidth /
                                                          (screenHeight * 1.2)
                                                              // screenHeight > 900
                                                              //     ? 0.600
                                                              //     : 0.450
                                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () async {
                                                        await shopController
                                                            .getShopProductDetailData(
                                                                '${shopController.apiShopProductMap?["data"][index]["slug"]}');

                                                        Get.to(() =>
                                                            const SingleProduct(
                                                                //Product_slug: '${shopController.apiShopProductMap?["data"][index]["slug"]}',
                                                                ));

                                                        //  shopController.getShopProductDetailData(widget.Product_slug);
                                                        //shopController.productDetailName.value=shopController.apiShopProductMap?["data"][index]["slug"];
                                                        // sizeList: shopController.apiShopProductMap?["data"][index]["sizes"],));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Stack(
                                                              children: [

                                                                 FadeInImage(
                                                          image: NetworkImage(
                                                            "${IMAGE_HEADER}upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                          ),
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/placeholder_image.png'),
                                                          fit: BoxFit.cover,
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              "assets/images/placeholder_image.png",
                                                              height:
                                                                  screenHeight *
                                                                      0.28,
                                                              width:
                                                                  screenWidth *
                                                                      0.42,
                                                              fit: BoxFit.cover,
                                                            );
                                                          },
                                                          height: screenHeight *
                                                              0.28,
                                                          width: screenWidth *
                                                              0.42,
                                                        ),


                                                                // Image.network(
                                                                //   "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["product_image"]}",
                                                                //   height: 46.h,
                                                                //   // screenHeight * 0.28,
                                                                //   width: 87
                                                                //       .w, //screenWidth * 0.42,
                                                                //   fit: BoxFit
                                                                //       .fill,
                                                                //   loadingBuilder: (BuildContext
                                                                //           context,
                                                                //       Widget
                                                                //           child,
                                                                //       ImageChunkEvent?
                                                                //           loadingProgress) {
                                                                //     if (loadingProgress ==
                                                                //         null) {
                                                                //       return child;
                                                                //     }
                                                                //     return Center(
                                                                //       child: Lottie.asset(
                                                                //           "assets/json/loading.json",
                                                                //           fit: BoxFit
                                                                //               .cover,
                                                                //           height: screenHeight *
                                                                //               0.095,
                                                                //           width:
                                                                //               screenWidth * 0.095),
                                                                //     );
                                                                //   },
                                                                // ),
                                                                Positioned(
                                                                  bottom: 10,
                                                                  right: 10,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        screenHeight *
                                                                            0.040,
                                                                    width:
                                                                        screenWidth *
                                                                            0.065,
                                                                    decoration: const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        shape: BoxShape
                                                                            .circle),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border,
                                                                        size: screenHeight *
                                                                            0.020,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.005,
                                                            ),
                                                            Text(
                                                              "${shopController.apiShopProductMap?["data"][index]["name"]}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .yantramanav(
                                                                      color: AppColors
                                                                          .colorLightBlack,
                                                                      fontSize:
                                                                          25,
                                                                      // screenHeight *
                                                                      //     0.020,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth /
                                                                          2 -
                                                                      30,
                                                              child:
                                                                  const Divider(
                                                                color: AppColors
                                                                    .colorGrey,
                                                                // height: screenWidth / 2 - 10,
                                                                thickness: 1.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.025,
                                                              child: shopController
                                                                          .apiShopProductMap?[
                                                                              "data"]
                                                                              [
                                                                              index]
                                                                              [
                                                                              "colors"]
                                                                          .length ==
                                                                      0
                                                                  ? Container()
                                                                  : ListView.builder(
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.horizontal,
                                                                      itemCount: shopController.apiShopProductMap?["data"][index]["colors"].length,
                                                                      itemBuilder: (context, colorIndex) {
                                                                        return Container(
                                                                            margin:
                                                                                const EdgeInsets.only(left: 2.0, right: 2.0),
                                                                            height: screenHeight * 0.025,
                                                                            width: screenWidth * 0.050,

                                                                            //color: Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["e_commerce_color_code"]}")),

                                                                            child: shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"] != null || shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"] != "NULL"
                                                                                ?

                                                                                //Image.network("https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}",)
                                                                                ////////////////////////////////////////////////////////////

                                                                                FadeInImage(
                                                                                    image: NetworkImage("https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap?["data"][index]["colors"][colorIndex]["aop_image"]}"),
                                                                                    placeholder: const AssetImage('assets/images/placeholder_image.png'),
                                                                                    fit: BoxFit.cover,
                                                                                    imageErrorBuilder: (context, error, stackTrace) {
                                                                                      return Container(
                                                                                        height: screenHeight * 0.29,
                                                                                        width: screenWidth * 0.95,
                                                                                        color: AppColors.colorWhite,
                                                                                      );
                                                                                    },
                                                                                    height: screenHeight * 0.29,
                                                                                    width: screenWidth * 0.95,
                                                                                  )

                                                                                //////////////////////////////////////////////////////////////

                                                                                : Container(
                                                                                    color: Colors.white,
                                                                                  )
                                                                            // color: index.isOdd
                                                                            //     ? AppColors.colorOrange
                                                                            //     : Colors.purple,

                                                                            //Color(ColorConvert.getColorFromHex("${shopController.apiShopProductMap?["data"][index]["colors"][index]}")),
                                                                            );
                                                                      }),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth /
                                                                          2 -
                                                                      30,
                                                              child:
                                                                  const Divider(
                                                                color: AppColors
                                                                    .colorGrey,
                                                                // height: screenWidth / 2 - 10,
                                                                thickness: 1.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              "£ ${shopController.apiShopProductMap?["data"][index]["price"]}",
                                                              style: GoogleFonts
                                                                  .yantramanav(
                                                                      color: AppColors
                                                                          .colorLightBlack,
                                                                      fontSize:
                                                                          23
                                                                      //screenHeight * 0.020
                                                                      ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth /
                                                                          2 -
                                                                      30,
                                                              child:
                                                                  const Divider(
                                                                color: AppColors
                                                                    .colorGrey,
                                                                // height: screenWidth / 2 - 10,
                                                                thickness: 1.0,
                                                              ),
                                                            ),
                                                            // Row(
                                                            //   children: [
                                                            //     Container(
                                                            //       height:
                                                            //           screenHeight * 0.040,
                                                            //       width: screenWidth * 0.350,
                                                            //       decoration: BoxDecoration(
                                                            //         border: Border.all(
                                                            //             color:
                                                            //                 Color(0xffC4C4C4),
                                                            //             width: 1),
                                                            //       ),
                                                            //       child:
                                                            //           DropdownButtonHideUnderline(
                                                            //         child: DropdownButton<
                                                            //             String>(
                                                            //           // underline: SizedBox(),
                                                            //           isExpanded: true,
                                                            //           icon: Padding(
                                                            //             padding:
                                                            //                 EdgeInsets.only(
                                                            //               right: 10.0,
                                                            //             ),
                                                            //             child: Icon(
                                                            //               Icons
                                                            //                   .keyboard_arrow_down_outlined,
                                                            //               color: Colors.black,
                                                            //             ),
                                                            //           ),
                                                            //           onChanged: (val) {
                                                            //             selectedSize =
                                                            //                 val.toString();
                                                            //           },
                                                            //           value:
                                                            //               this.selectedSize,
                                                            //           items: sizeList
                                                            //               .map((selectValue) {
                                                            //             return DropdownMenuItem(
                                                            //                 value:
                                                            //                     selectValue,
                                                            //                 child: Padding(
                                                            //                   padding: EdgeInsets.only(
                                                            //                       left: screenHeight *
                                                            //                           0.019),
                                                            //                   child: Text(
                                                            //                       selectValue
                                                            //                           .toString()),
                                                            //                 ));
                                                            //           }).toList(),
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //     SizedBox(
                                                            //       width: screenWidth * 0.010,
                                                            //     ),
                                                            //     Container(
                                                            //       height:
                                                            //           screenHeight * 0.050,
                                                            //       width: screenWidth * 0.075,
                                                            //       decoration: BoxDecoration(
                                                            //           color:
                                                            //               AppColors.colorGrey,
                                                            //           shape: BoxShape.circle),
                                                            //       // child: Center(
                                                            //       //   child: Icon(
                                                            //       //     Icons.scal,
                                                            //       //     color: Colors.white,
                                                            //       //     size: screenHeight * 0.020,
                                                            //       //   ),
                                                            //       // ),
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                            SizedBox(
                                                              height:
                                                                  40, //screenHeight * 0.050,
                                                              width: screenWidth / 2 - 46,
                                                              child:
                                                                  ElevatedButton(
                                                                      onPressed: shopController.apiShopProductMap?["data"][index]["colors"].length ==
                                                                              0
                                                                          ? () {
                                                                              Get.snackbar(
                                                                                "Status",
                                                                                "This product is not available right now",
                                                                                colorText: Colors.white,
                                                                                backgroundColor: Colors.orangeAccent,
                                                                                snackPosition: SnackPosition.BOTTOM,
                                                                              );
                                                                            }
                                                                          : () {
                                                                              showModalBottomSheet(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return SizedBox(
                                                                                      width: screenWidth,
                                                                                      height: screenHeight / 2,
                                                                                      child: SingleChildScrollView(
                                                                                        child: Column(
                                                                                            // crossAxisAlignment:
                                                                                            //     CrossAxisAlignment
                                                                                            //         .center,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  // Image.asset(
                                                                                                  //   "assets/images/measure.png",
                                                                                                  //   fit: BoxFit
                                                                                                  //       .cover,
                                                                                                  // ),
                                                                                                  Text(
                                                                                                    "Size Guide",
                                                                                                    style: GoogleFonts.poppins(fontSize: screenHeight * 0.025),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: screenWidth,
                                                                                                child: Divider(
                                                                                                  color: AppColors.colorGrey.withOpacity(0.3),
                                                                                                  // height: screenWidth / 2 - 10,
                                                                                                  thickness: 5.0,
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  // Image.asset(
                                                                                                  //   "assets/images/measure.png",
                                                                                                  //   fit: BoxFit
                                                                                                  //       .cover,
                                                                                                  // ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsets.only(left: screenWidth * 0.020),
                                                                                                    child: Text(
                                                                                                      "Choose a size",
                                                                                                      style: GoogleFonts.poppins(fontSize: screenHeight * 0.019),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: screenWidth,
                                                                                                child: Divider(
                                                                                                  color: AppColors.colorGrey.withOpacity(0.3),
                                                                                                  // height: screenWidth / 2 - 10,
                                                                                                  thickness: 3.0,
                                                                                                ),
                                                                                              ),
                                                                                              Center(
                                                                                                child: Container(
                                                                                                  child: ListView.builder(
                                                                                                      shrinkWrap: true,
                                                                                                      physics: const ScrollPhysics(),
                                                                                                      itemCount: shopController.apiShopProductMap?["data"][index]["sizes"].length,
                                                                                                      itemBuilder: (context, indexsize) {
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsets.only(top: screenHeight * 0.005, bottom: screenHeight * 0.005),
                                                                                                          child: Center(
                                                                                                              child: GestureDetector(
                                                                                                            onTap: () {
                                                                                                              Navigator.of(context).pop();
                                                                                                              selectedSize.value = "${shopController.apiShopProductMap!["data"][index]["sizes"][indexsize]}";

                                                                                                              SQLHelper.createItem("${shopController.apiShopProductMap!["data"][index]["name"]}", "${shopController.apiShopProductMap!["data"][index]["price"]}", selectedSize.value, "${shopController.apiShopProductMap!["data"][index]['id']}", "${shopController.apiShopProductMap!["data"][index]["colors"][0]}", "1", "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductMap!["data"][index]["product_image"]}");
                                                                                                              Get.to(() => const MyBagView());
                                                                                                            },
                                                                                                            child: Text(
                                                                                                              "${shopController.apiShopProductMap?["data"][index]["sizes"][indexsize]}",
                                                                                                              style: GoogleFonts.poppins(fontSize: screenHeight * 0.016),
                                                                                                            ),
                                                                                                          )),
                                                                                                        );
                                                                                                      }),
                                                                                                ),
                                                                                              )
                                                                                            ]),
                                                                                      ));
                                                                                },
                                                                              );
                                                                            },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            AppColors.colorWhite,
                                                                        elevation:
                                                                            0,
                                                                        minimumSize: const Size
                                                                            .fromHeight(
                                                                            30), // NEW
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          side: const BorderSide(
                                                                              width: 2, // thickness
                                                                              color: AppColors.colorLightBlack // color
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          // SvgPicture.asset(
                                                                          //   "assets/images/cart.svg",
                                                                          //   height: screenHeight * 0.020,
                                                                          //   width: screenWidth * 0.050,
                                                                          //   fit: BoxFit.fill,
                                                                          //   color: Colors.white,
                                                                          // ),
                                                                          const Icon(
                                                                              Icons.shopping_bag_outlined,
                                                                              color: AppColors.colorLightBlack),
                                                                          Text(
                                                                            "Add to Bag",
                                                                            style:
                                                                                GoogleFonts.poppins(color: AppColors.colorLightBlack),
                                                                          ),
                                                                        ],
                                                                      )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ))),

                      ///// 1By1 Layout /////////////////////////////////////////////////////////////////////////

                      ///// 1By1 Layout /////////////////////////////////////////////////////////////////////////
                      /////// 2By2 Layout ////////////////////////////////////////////////////////////////////

                      ////// 2By2 Layout ////////////////////////////////////////////////////////////////////
                      ////// 4By4 Layout ////////////////////////////////////////////////////////////////////

                      ///// 4By4 Layout //////////////////////////////////////////////////////////////

                      // ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }

  Future<void> _onRefreshDataLoad() async {
    Future.delayed(const Duration(seconds: 3));
    await shopController.getShopProductData();
  }
}
