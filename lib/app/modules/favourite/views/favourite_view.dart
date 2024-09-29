import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/sql_helper.dart';
import '../../utill/sql_wishlist_helper.dart';
import '../../widgets/general_appbar.dart';

class FavouriteView extends StatefulWidget //GetView<FavouriteController>
{
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  List<Map<String, dynamic>> wishList = [];
  bool isLoading = true;

  Future<void> refreshWishList() async {
    print("in funcion call");

    final data = await SQLWishListHelper.WishListgetItems();

    //journals=data;

    setState(() {
      wishList = data;
      isLoading = false;
    });

    // isChecked = List<bool>.filled(journals.length, false);
    //
    // for(int i = 0; i<isChecked.length ; i++){
    //   print("is value checked.............."+isChecked[i].toString());
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshWishList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Wish List")),
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.010, right: screenWidth * 0.010),
          child: wishList.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Expanded(
                      child:
                          // Obx(() => accountController.isUserCartLoading.value == true ?  Center(
                          //   child: Lottie.asset("assets/json/loading.json",
                          //       fit: BoxFit.cover,
                          //       height: screenHeight * 0.095,
                          //       width: screenWidth * 0.095),
                          // ) :
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: wishList.length,
                              // 10, //accountController.apiUserCartMap?["data"].length,//controller.cartProduct.value.data!.length,//isChecked?.length,
                              itemBuilder: (context, index) {
                                //isChecked?.add(false);

                                //String dropdownValue = 'Dog';

                                return Container(
                                    color: Colors.white,
                                    width: screenWidth,
                                    margin: EdgeInsets.only(
                                        top: screenHeight * 0.003,
                                        bottom: screenHeight * 0.003),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.010,
                                            bottom: screenHeight * 0.010,
                                            right: screenWidth *
                                                0.010 //screenWidth*0.010
                                            ),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenWidth * 0.020,
                                                    right: screenWidth * 0.020),
                                                child: Image.network(
                                                  //"assets/images/banner_demo_image.png",
                                                  "${wishList[index]["imageLink"]}",
                                                  height: screenHeight * 0.10,
                                                  width: screenWidth * 0.14,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return SizedBox(
                                                        height:
                                                            screenHeight * 0.10,
                                                        width:
                                                            screenWidth * 0.14,
                                                        child: Center(
                                                          child: Lottie.asset(
                                                              "assets/json/loading.json",
                                                              fit: BoxFit.cover,
                                                              height:
                                                                  screenHeight *
                                                                      0.045,
                                                              width:
                                                                  screenWidth *
                                                                      0.060),
                                                        ));
                                                  },
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: screenWidth*0.60,
                                                    child: Text(
                                                      "${wishList[index]["title"]}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: screenHeight *
                                                            0.016,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth*0.77,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "£ ${wishList[index]["price"]}",
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontSize:
                                                                      screenHeight *
                                                                          0.013,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 7,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 27,
                                                                    width: screenWidth*15,
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      underline:
                                                                          Container(),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .expand_more,
                                                                        size: 10,
                                                                      ),
                                                                      // Step 3.
                                                                      value: wishList[
                                                                              index]
                                                                          [
                                                                          "colorID"],
                                                                      // Step 4.
                                                                      items: <String>[
                                                                        "${wishList[index]["colorID"]}"
                                                                      ].map<
                                                                          DropdownMenuItem<
                                                                              String>>((String
                                                                          value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(fontSize: 10),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      // Step 5.
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        setState(
                                                                            () {
                                                                          wishList[index]["colorID"] =
                                                                              newValue!;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),

                                                                  SizedBox(
                                                                    height: 27,
                                                                    width: screenWidth*0.15,
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      underline:
                                                                          Container(),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .expand_more,
                                                                        size: 8
                                                                            //.sp,
                                                                      ),
                                                                      // Step 3.
                                                                      value: wishList[
                                                                              index]
                                                                          [
                                                                          "sizeID"],
                                                                      // Step 4.
                                                                      items: <String>[
                                                                        "${wishList[index]["sizeID"]}"
                                                                      ].map<
                                                                          DropdownMenuItem<
                                                                              String>>((String
                                                                          value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(fontSize: 8),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      // Step 5.
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        setState(
                                                                            () {
                                                                          wishList[index]["sizeID"] =
                                                                              newValue!;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),

                                                                  // Text(
                                                                  //   "Size: ",
                                                                  //   style: GoogleFonts
                                                                  //       .poppins(
                                                                  //     fontSize:
                                                                  //         screenHeight *
                                                                  //             0.013,
                                                                  //   ),
                                                                  // ),
                                                                  // Text(
                                                                  //   "${journals[index]["sizeID"]}",
                                                                  //   style: GoogleFonts
                                                                  //       .poppins(
                                                                  //     fontSize:
                                                                  //         screenHeight *
                                                                  //             0.013,
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   width: 26.w,
                                                        // ),
                                                        Container(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  SQLHelper.createItem(
                                                                      "${wishList[index]["title"]}", // "${shopController.apiShopProductDetailMap?["data"]["product"]["product_name"]}",
                                                                      "${wishList[index]["price"]}", // "${totalPrice.value.toStringAsFixed(2)}",
                                                                      "${wishList[index]["sizeID"]}", // "${shopController.apiShopProductDetailMap?["data"]["firstSizes"][sizeIndex.value]["product_size"]["id"]}",
                                                                      "${wishList[index]["productID"]}", // "${shopController.apiShopProductDetailMap?["data"]["product"]['id']}",
                                                                      "${wishList[index]["colorID"]}", // "${shopController.apiShopProductDetailMap?["data"]["colors"][currentColorIndex.value]['id']}",
                                                                      "${wishList[index]["quantity"]}", // "${productQuantity}",quantity
                                                                      "${wishList[index]["imageLink"]}"); // "https://enorsia.com/upload/ecom_products/${shopController.apiShopProductDetailMap?["data"]["product"]["featured_image"]}");
                                                                },
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.020,
                                                                      right: screenWidth *
                                                                          0.040),
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 100,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0),
                                                                        color: Colors
                                                                            .white,
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColors.colorLightBlack)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Move to bag",
                                                                      style: GoogleFonts.poppins(
                                                                          color: AppColors
                                                                              .colorLightBlack,
                                                                          fontSize:
                                                                              screenHeight * 0.015),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  SQLWishListHelper
                                                                      .WishListdeleteItem(
                                                                          int.parse(
                                                                              "${wishList[index]["id"]}"));

                                                                  refreshWishList();
                                                                },
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: screenHeight *
                                                                          0.020,
                                                                      right: screenWidth *
                                                                          0.040),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .delete_outlined,
                                                                    color: AppColors
                                                                        .colorLightBlack,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )

                                        // Row(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Row(
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.center,
                                        //           children: [
                                        //             Padding(
                                        //               padding: EdgeInsets.only(
                                        //                   left: screenWidth * 0.020),
                                        //               child: Image.asset(
                                        //                 "assets/images/banner_demo_image.png",
                                        //                 // "${journals[index]["imageLink"]}",
                                        //                 height: screenHeight * 0.10,
                                        //                 width: screenWidth * 0.12,
                                        //                 fit: BoxFit.cover,
                                        //                 // loadingBuilder:
                                        //                 //     (BuildContext context,
                                        //                 //         Widget child,
                                        //                 //         ImageChunkEvent?
                                        //                 //             loadingProgress) {
                                        //                 //   if (loadingProgress == null)
                                        //                 //     return child;
                                        //                 //   return Center(
                                        //                 //       child: Center(
                                        //                 //     child: Lottie.asset(
                                        //                 //         "assets/json/loading.json",
                                        //                 //         fit: BoxFit.cover,
                                        //                 //         height:
                                        //                 //             screenHeight * 0.095,
                                        //                 //         width: screenWidth * 0.095),
                                        //                 //   ));
                                        //                 // },
                                        //               ),
                                        //             ),
                                        //
                                        //
                                        //
                                        //             Container(
                                        //               width: screenWidth * 0.3,
                                        //               child: Padding(
                                        //                 padding: EdgeInsets.only(
                                        //                     left: screenWidth * 0.020),
                                        //                 child: Column(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment.start,
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment.start,
                                        //                   children: [
                                        //
                                        //                     SizedBox(
                                        //                       height:
                                        //                           screenHeight * 0.010,
                                        //                     ),
                                        //                     Row(
                                        //                       children: [
                                        //                         Text(
                                        //                           "22",
                                        //                           style: GoogleFonts
                                        //                               .poppins(
                                        //                             fontSize:
                                        //                                 screenHeight *
                                        //                                     0.013,
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                     SizedBox(
                                        //                       height:
                                        //                           screenHeight * 0.010,
                                        //                     ),
                                        //                     Row(
                                        //                       children: [
                                        //                         Text(
                                        //                           "Size : 22",
                                        //                           style: GoogleFonts
                                        //                               .poppins(
                                        //                             fontSize:
                                        //                                 screenHeight *
                                        //                                     0.013,
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ]),
                                        //      // Spacer(),
                                        //       Column(
                                        //         children: [
                                        //
                                        //           Text(
                                        //             "${journals[index]["title"]}",
                                        //             style:
                                        //             GoogleFonts.poppins(
                                        //               fontSize: screenHeight *
                                        //                   0.016,
                                        //             ),
                                        //           ),
                                        //
                                        //           Row(
                                        //             children: [
                                        //               Padding(
                                        //                 padding: EdgeInsets.only(
                                        //                     top: screenHeight * 0.050,
                                        //                     right: screenWidth * 0.040),
                                        //                 child: Container(
                                        //                   height: 30,
                                        //                   width: 100,
                                        //                   decoration: BoxDecoration(
                                        //                       borderRadius:
                                        //                           BorderRadius.circular(
                                        //                               10.0),
                                        //                       color: Colors.white,
                                        //                       border: Border.all(
                                        //                           color: AppColors
                                        //                               .colorLightOrange)),
                                        //                   child: Center(
                                        //                       child: Text("Move to bag")),
                                        //                 ),
                                        //               ),
                                        //               Padding(
                                        //                 padding: EdgeInsets.only(
                                        //                     top: screenHeight * 0.050,
                                        //                     right: screenWidth * 0.040),
                                        //                 child: Icon(
                                        //                   Icons.delete_outlined,
                                        //                   color: Colors.red,
                                        //                 ),
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ],
                                        //       )
                                        //     ])
                                        ));

                                //
                                //
                                //
                                //
                                //         Column(
                                //           children: [
                                //             SizedBox(
                                //               height: screenHeight * 0.020,
                                //             ),
                                //
                                //
                                //
                                //             Container(
                                //               height: screenHeight * 0.04,
                                //               width: screenWidth * 0.33,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.transparent
                                //                       .withOpacity(0.2),
                                //                   borderRadius:
                                //                   BorderRadius.circular(10.0)),
                                //               child: InputQty(
                                //                 maxVal: 50,
                                //                 initVal: double.parse("${journals[index]["quantity"]}"),
                                //                 showMessageLimit: false,
                                //                 minVal: 00,
                                //                 steps: 1,
                                //                 isIntrinsicWidth: false,
                                //                 borderShape: BorderShapeBtn.none,
                                //                 plusBtn: const Icon(Icons.add),
                                //                 minusBtn: const Icon(Icons.remove),
                                //                 btnColor1: Colors.grey,
                                //                 btnColor2: Colors.grey.shade100,
                                //                 onQtyChanged: (val) {
                                //                   // if (kDebugMode) {
                                //                   //   print(val);
                                //                   // }
                                //                 },
                                //               ),
                                //
                                //
                                //               // Row(
                                //               //   crossAxisAlignment:
                                //               //       CrossAxisAlignment.center,
                                //               //   mainAxisAlignment:
                                //               //       MainAxisAlignment.spaceEvenly,
                                //               //   children: [
                                //               //     Padding(
                                //               //       padding: EdgeInsets.only(
                                //               //           bottom: screenHeight * 0.010),
                                //               //       child: Icon(
                                //               //         Icons.minimize,
                                //               //         size: screenHeight * 0.020,
                                //               //       ),
                                //               //     ),
                                //               //     Text(
                                //               //       "1",
                                //               //       style: GoogleFonts.poppins(
                                //               //         fontSize: screenHeight * 0.013,
                                //               //       ),
                                //               //     ),
                                //               //     Icon(
                                //               //       Icons.add,
                                //               //       size: screenHeight * 0.020,
                                //               //     )
                                //               //   ],
                                //               // ),
                                //
                                //
                                //
                                //
                                //
                                //             )
                                //
                                //
                                //
                                //
                                //
                                //
                                //           ],
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // );

                                //////////////////////////////////////////////////////////////////////////////

                                //   ColoredBox(
                                //   color: Colors.green,
                                //   child: Material(
                                //     child: CheckboxListTile(
                                //       checkboxSemanticLabel: "Checked",
                                //       tileColor: Colors.white,
                                //       title: const Text('CheckboxListTile with red background'),
                                //       value: isChecked?[index],
                                //       onChanged:(bool? value) {
                                //
                                //         setState(() {
                                //           isChecked?[index] = value!;
                                //         });
                                //
                                //       },
                                //     ),
                                //   ),
                                // );

                                ////////////////////////////////////////////////////////////////////////////////

                                //   Container(
                                //   color: Colors.white,
                                //   width: screenWidth,
                                //   margin: EdgeInsets.only(
                                //       top: screenHeight * 0.003,
                                //       bottom: screenHeight * 0.003),
                                //   child: Padding(
                                //     padding: EdgeInsets.only(
                                //         top: screenHeight * 0.010,
                                //         bottom: screenHeight * 0.010,
                                //         right: 15//screenWidth*0.010
                                //     ),
                                //     child: Row(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Row(
                                //
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //
                                //           children: [
                                //
                                //
                                //
                                //             Checkbox(
                                //               checkColor: Colors.black,
                                //               value: isChecked[index],//journals[index]['ischecked'],//controller.isChecked.value,
                                //               onChanged: (val) {
                                //
                                //
                                //
                                //                 print("checked value in list ................${isChecked[index]}");
                                //
                                //
                                //                 print("checked value ................${val}");
                                //                 setState(
                                //                       () {
                                //                         //journals[index]['ischecked'] = val;
                                //                         isChecked[index]=val!;
                                //                         print("checked value after change ................${isChecked[index]}");
                                //
                                //
                                //
                                //
                                //                     if(val==true){
                                //                       isSelected.add(journals[index]);
                                //                       totalAmount.value=totalAmount.value+double.parse("${journals[index]['price']}");
                                //                      // isChecked?[index]=true;
                                //
                                //                     }
                                //
                                //
                                //                     else if(val==false){
                                //                       if(isSelected.isNotEmpty){
                                //
                                //                         int removeIndex=isSelected.indexOf(journals[index]);
                                //                         isSelected.removeAt(removeIndex);
                                //
                                //                         totalAmount.value=totalAmount.value-double.parse("${journals[index]['price']}");
                                //
                                //
                                //
                                //                         isSelected.removeAt(removeIndex);
                                //
                                //
                                //
                                //
                                //                       }
                                //
                                //                       //isChecked?[index]=false;
                                //                     }
                                //
                                //
                                //                   },
                                //
                                //
                                //
                                //
                                //
                                //                 );
                                //                 //controller.isChecked.value = value!;
                                //               },
                                //             ),
                                //
                                //
                                //
                                //
                                //             Image.network(
                                //               //"assets/images/banner_demo_image.png",
                                //               "${journals[index]["imageLink"]}",
                                //               height: screenHeight * 0.10,
                                //               width: screenWidth * 0.12,
                                //               fit: BoxFit.cover,
                                //               loadingBuilder: (BuildContext context, Widget child,
                                //                   ImageChunkEvent? loadingProgress) {
                                //                 if (loadingProgress == null) return child;
                                //                 return Center(
                                //                     child: Center(
                                //                       child: Lottie.asset("assets/json/loading.json",
                                //                           fit: BoxFit.cover,
                                //                           height: screenHeight * 0.095,
                                //                           width: screenWidth * 0.095),
                                //                     )
                                //                 );
                                //               },
                                //             ),
                                //
                                //
                                //
                                //
                                //
                                //
                                //             Container(
                                //               width: screenWidth*0.3,
                                //               child: Padding(
                                //                 padding:
                                //                 EdgeInsets.only(left: screenWidth * 0.010),
                                //                 child: Column(
                                //                   mainAxisAlignment: MainAxisAlignment.start,
                                //                   crossAxisAlignment: CrossAxisAlignment.start,
                                //                   children: [
                                //                     Text(
                                //                       "${journals[index]["title"]}",
                                //                       style: GoogleFonts.poppins(
                                //                         fontSize: screenHeight * 0.016,
                                //                       ),
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         Text(
                                //                           "${journals[index]["price"]}",
                                //                           style: GoogleFonts.poppins(
                                //                             fontSize: screenHeight * 0.013,
                                //                           ),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         Icon(
                                //                           Icons.delete_outlined,
                                //                           color: Colors.red,
                                //                           size: screenHeight * 0.020,
                                //                         ),
                                //                         SizedBox(
                                //                           width: screenWidth * 0.030,
                                //                         ),
                                //                         Icon(
                                //                           Icons.share,
                                //                           size: screenHeight * 0.020,
                                //                         ),
                                //                         SizedBox(
                                //                           width: screenWidth * 0.030,
                                //                         ),
                                //                         Icon(
                                //                           Icons.favorite_border,
                                //                           size: screenHeight * 0.020,
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //
                                //           ],
                                //         ),
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //         Column(
                                //           children: [
                                //             SizedBox(
                                //               height: screenHeight * 0.020,
                                //             ),
                                //
                                //
                                //
                                //             Container(
                                //               height: screenHeight * 0.04,
                                //               width: screenWidth * 0.33,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.transparent
                                //                       .withOpacity(0.2),
                                //                   borderRadius:
                                //                   BorderRadius.circular(10.0)),
                                //               child: InputQty(
                                //                 maxVal: 50,
                                //                 initVal: double.parse("${journals[index]["quantity"]}"),
                                //                 showMessageLimit: false,
                                //                 minVal: 00,
                                //                 steps: 1,
                                //                 isIntrinsicWidth: false,
                                //                 borderShape: BorderShapeBtn.none,
                                //                 plusBtn: const Icon(Icons.add),
                                //                 minusBtn: const Icon(Icons.remove),
                                //                 btnColor1: Colors.grey,
                                //                 btnColor2: Colors.grey.shade100,
                                //                 onQtyChanged: (val) {
                                //                   // if (kDebugMode) {
                                //                   //   print(val);
                                //                   // }
                                //                 },
                                //               ),
                                //
                                //
                                //               // Row(
                                //               //   crossAxisAlignment:
                                //               //       CrossAxisAlignment.center,
                                //               //   mainAxisAlignment:
                                //               //       MainAxisAlignment.spaceEvenly,
                                //               //   children: [
                                //               //     Padding(
                                //               //       padding: EdgeInsets.only(
                                //               //           bottom: screenHeight * 0.010),
                                //               //       child: Icon(
                                //               //         Icons.minimize,
                                //               //         size: screenHeight * 0.020,
                                //               //       ),
                                //               //     ),
                                //               //     Text(
                                //               //       "1",
                                //               //       style: GoogleFonts.poppins(
                                //               //         fontSize: screenHeight * 0.013,
                                //               //       ),
                                //               //     ),
                                //               //     Icon(
                                //               //       Icons.add,
                                //               //       size: screenHeight * 0.020,
                                //               //     )
                                //               //   ],
                                //               // ),
                                //
                                //
                                //
                                //
                                //
                                //             )
                                //
                                //
                                //
                                //
                                //
                                //
                                //           ],
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // );

                                //////////////////////////////////////////////////////////////////////////////////

                                // return CheckboxListTile(
                                //
                                //      title: Row(
                                //        children: [
                                //      Image.asset(
                                //                      "assets/images/banner_demo_image.png",
                                //                      height: screenHeight * 0.10,
                                //                      width: screenWidth * 0.12,
                                //                      fit: BoxFit.cover,
                                //                    ),
                                //          Text("text"),
                                //        ],
                                //      ),
                                //
                                //     value: isChecked?[index],
                                //     onChanged: (val) {
                                //        setState(
                                //              () {
                                //                isChecked?[index] = val!;
                                //                },
                                //
                                //        );
                                //      }
                                //      );
                              }),
                      // )

                      // child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 9,
                      //     itemBuilder: (context, index) {
                      //
                      //       isChecked?.add(false);
                      //
                      //       return Container(
                      //         color: Colors.white,
                      //         width: screenWidth,
                      //         margin: EdgeInsets.only(
                      //             top: screenHeight * 0.003,
                      //             bottom: screenHeight * 0.003),
                      //         child: Padding(
                      //           padding: EdgeInsets.only(
                      //               top: screenHeight * 0.010,
                      //               bottom: screenHeight * 0.010),
                      //           child: Row(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Checkbox(
                      //                 checkColor: Colors.black,
                      //                 value: isChecked![index]=false,//controller.isChecked.value,
                      //                 onChanged: (bool? value) {
                      //                   setState(() {
                      //                     isChecked![index]=value!;
                      //                   });
                      //                   //controller.isChecked.value = value!;
                      //                 },
                      //               ),
                      //               Image.asset(
                      //                 "assets/images/banner_demo_image.png",
                      //                 height: screenHeight * 0.10,
                      //                 width: screenWidth * 0.12,
                      //                 fit: BoxFit.cover,
                      //               ),
                      //               Padding(
                      //                 padding:
                      //                     EdgeInsets.only(left: screenWidth * 0.010),
                      //                 child: Column(
                      //                   mainAxisAlignment: MainAxisAlignment.start,
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       "Half Zip Long Sleeve Polo Shirt",
                      //                       style: GoogleFonts.poppins(
                      //                         fontSize: screenHeight * 0.016,
                      //                       ),
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Text(
                      //                           "332.99",
                      //                           style: GoogleFonts.poppins(
                      //                             fontSize: screenHeight * 0.013,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Icon(
                      //                           Icons.delete_outlined,
                      //                           color: Colors.red,
                      //                           size: screenHeight * 0.020,
                      //                         ),
                      //                         SizedBox(
                      //                           width: screenWidth * 0.030,
                      //                         ),
                      //                         Icon(
                      //                           Icons.share,
                      //                           size: screenHeight * 0.020,
                      //                         ),
                      //                         SizedBox(
                      //                           width: screenWidth * 0.030,
                      //                         ),
                      //                         Icon(
                      //                           Icons.favorite_border,
                      //                           size: screenHeight * 0.020,
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               Column(
                      //                 children: [
                      //                   SizedBox(
                      //                     height: screenHeight * 0.020,
                      //                   ),
                      //                   Container(
                      //                     height: screenHeight * 0.033,
                      //                     width: screenWidth * 0.20,
                      //                     decoration: BoxDecoration(
                      //                         color: AppColors.colorGrey
                      //                             .withOpacity(0.2),
                      //                         borderRadius:
                      //                             BorderRadius.circular(10.0)),
                      //                     child: Row(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.center,
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceEvenly,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsets.only(
                      //                               bottom: screenHeight * 0.010),
                      //                           child: Icon(
                      //                             Icons.minimize,
                      //                             size: screenHeight * 0.020,
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           "1",
                      //                           style: GoogleFonts.poppins(
                      //                             fontSize: screenHeight * 0.013,
                      //                           ),
                      //                         ),
                      //                         Icon(
                      //                           Icons.add,
                      //                           size: screenHeight * 0.020,
                      //                         )
                      //                       ],
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     }),
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Your wish list is empty. Please enter product in your wishlist",
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ),
    );
  }
}
