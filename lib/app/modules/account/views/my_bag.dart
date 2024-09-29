import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:sizer/sizer.dart';

import '../../checkout/views/checkout_view.dart';
import '../../registration/views/login_view.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/sql_helper.dart';
import '../../utill/sql_wishlist_helper.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/account_controller.dart';

class MyBagView extends StatefulWidget {
  const MyBagView({Key? key}) : super(key: key);

  @override
  State<MyBagView> createState() => _MyBagViewState();
}

class _MyBagViewState extends State<MyBagView> {
  AccountController accountController = Get.put(AccountController());

  List<bool> isChecked = [];

  List<Map<String, dynamic>> productList = [];

  List<Map<String, dynamic>> isSelected = [];

  List<Map<String, dynamic>> wishList = [];

  bool isLoading = true;

  RxDouble totalAmount = 00.00.obs;

  RxString voucherCode = "".obs;

  RxDouble discountAmount = 00.00.obs;

  RxInt selectedItemCount = 0.obs;

  final leftEdit = Container(
    margin: const EdgeInsets.all(8),
    color: AppColors.colorLightOrange,
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.045),
      child: Icon(
        Icons.share,
        size: screenHeight * 0.040,
        color: Colors.white,
      ),
    ),
  );

  final rightDelete = Container(
    margin: const EdgeInsets.all(8),
    color: AppColors.colorGrey,
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.025),
      child: const Icon(
        Icons.delete_outlined,
        color: Colors.white,
      ),
    ),
  );

  Future<void> refreshProductList() async {
    accountController.isCartLoading.value == true;

    final data = await SQLHelper.getItems();

    //journals=data;

    setState(() {
      productList = data;
      isLoading = false;
    });

    isChecked = List<bool>.filled(productList.length, false);

    for (int i = 0; i < isChecked.length; i++) {
      // print("is value checked.............." + isChecked[i].toString());
    }

    accountController.isCartLoading.value == false;
  }

  Future<void> refreshWishList() async {
    final data = await SQLWishListHelper.getItems();

    setState(() {
      wishList = data;
    });

    // print("in funcion call" + wishList.toString());
  }

  /////////////////////////////////////////////////////////////////////////

  void selectSingleProduct(int index) {
    isChecked = List<bool>.filled(productList.length, true);
    selectedItemCount.value = 0;
    selectedItemCount.value = isChecked.length;
    setState(() {
      totalAmount.value = 0.00;
      accountController.getShippingCost();

      //for (int indx = 0; indx < productList.length; indx++) {
      isSelected.add(productList[index]);
      totalAmount.value =
          totalAmount.value + double.parse("${productList[index]['price']}");

      // await accountController
      //     .doProductCheckout(
      //         journals[0]["colorID"]
      //             .toString(),
      //         journals[0]
      //                 ["sizeID"]
      //             .toString(),
      //         journals[0]
      //                 ["quantity"]
      //             .toString(),
      //         journals[0]["productID"]
      //             .toString(),
      //         accountController
      //             .shippingCost.value,
      //         totalAmount.value
      //             .toString());

      accountController.productCheckoutList.value.add({
        "style_color_id": productList[index]["colorID"].toString(),
        "product_size_id": productList[index]["sizeID"].toString(),
        "quantity": productList[index]["quantity"].toString(),
        "product_id": productList[index]["productID"].toString(),
        "shipping_cost": accountController.shippingCost.value.toString(),
        "total_price": productList[index]["price"].toString()
      });
      // }

      if (totalAmount.value >= 50.00) {
        totalAmount.value = totalAmount.value +
            double.parse(
                "${accountController.apiDeliveryCostMap!["data"]["delivery_charge"]}");
      }
    });

    // print("map value ................................" +
    //     accountController.productCheckoutList[1].toString());
  }

  //////////////////////////////////////////////////////////////////////

  void selectAllProduct() {
    isChecked = List<bool>.filled(productList.length, true);
    selectedItemCount.value = 0;
    selectedItemCount.value = isChecked.length;
    setState(() {
      totalAmount.value = 0.00;
      accountController.getShippingCost();

      for (int indx = 0; indx < productList.length; indx++) {
        isSelected.add(productList[indx]);
        totalAmount.value =
            totalAmount.value + double.parse("${productList[indx]['price']}");

        // await accountController
        //     .doProductCheckout(
        //         journals[0]["colorID"]
        //             .toString(),
        //         journals[0]
        //                 ["sizeID"]
        //             .toString(),
        //         journals[0]
        //                 ["quantity"]
        //             .toString(),
        //         journals[0]["productID"]
        //             .toString(),
        //         accountController
        //             .shippingCost.value,
        //         totalAmount.value
        //             .toString());

        accountController.productCheckoutList.value.add({
          "style_color_id": productList[indx]["colorID"].toString(),
          "product_size_id": productList[indx]["sizeID"].toString(),
          "quantity": productList[indx]["quantity"].toString(),
          "product_id": productList[indx]["productID"].toString(),
          "shipping_cost": accountController.shippingCost.value.toString(),
          "total_price": productList[indx]["price"].toString()
        });
      }

      if (totalAmount.value >= 50.00) {
        totalAmount.value = totalAmount.value +
            double.parse(
                "${accountController.apiDeliveryCostMap!["data"]["delivery_charge"]}");
      }
    });

    // print("map value ................................" +
    //     accountController.productCheckoutList[1].toString());
  }

  void unSelectAllProduct() {
    isChecked = List<bool>.filled(productList.length, false);
    selectedItemCount.value = 0;
    accountController.productCheckoutList.value.clear();
    setState(() {});

    accountController.getShippingCost();

    // for(int indx=0;indx<=journals.length;indx++){
    //   isSelected.removeAt(indx);
    //   totalAmount.value=0.00;
    // }

    int isSelectedRange = isSelected.length;
    isSelected.removeRange(0, isSelectedRange);
    totalAmount.value = 0.00;
  }

  @override
  Widget build(BuildContext context) {
    //refreshJournal();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("My Bag")),

        body: Obx(() => accountController.isCartLoading.value == true
            ? Center(
                child: Lottie.asset("assets/json/loading.json",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.095,
                    width: screenWidth * 0.095),
              )
            : productList.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "The Bag is Empty. Please add product in the bag",
                      textAlign: TextAlign.center,
                    ),
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: AppColors.colorGrey,
                                activeColor: AppColors.colorLightGrey,
                                value: accountController.isChecked.value,
                                onChanged: (bool? value) {
                                  accountController.isChecked.value = value!;

                                  if (accountController.isChecked.value ==
                                      true) {
                                    selectAllProduct();
                                  } else {
                                    unSelectAllProduct();
                                  }
                                },
                              ),
                              Text(
                                "Select all",
                                style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.020,
                                ),
                              ),
                            ],
                          ),
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
                                    itemCount: productList
                                        .length, //accountController.apiUserCartMap?["data"].length,//controller.cartProduct.value.data!.length,//isChecked?.length,
                                    itemBuilder: (context, index) {
                                      //isChecked?.add(false);

                                      return Dismissible(
                                        onDismissed: (DismissDirection
                                            dismissDirection) {
                                          // print("After dismiss");
                                          //
                                          // print(
                                          //     "Direction---------${dismissDirection}");
                                        },
                                        background: leftEdit,
                                        secondaryBackground: rightDelete,
                                        confirmDismiss: (DismissDirection
                                            dismissDirection) async {
                                          // print("Confirming");
                                          // print(
                                          //     "Direction---------${dismissDirection}");

                                          if (dismissDirection ==
                                              DismissDirection.startToEnd) {
                                            ShareLInk();
                                          } else if (dismissDirection ==
                                              DismissDirection.endToStart) {
                                            // SQLHelper.deleteItem(int.parse(
                                            //     "${productList[index]["id"]}"));

                                            // SQLHelper.deleteItem("${productList[index]["productID"]}");
                                            //
                                            // refreshProductList();
                                          }

                                          return false;
                                        },
                                        key: ObjectKey(index),
                                        child: Container(
                                            color: Colors.white,
                                            width: screenWidth,
                                            margin: EdgeInsets.only(
                                                top: screenHeight * 0.003,
                                                bottom: screenHeight * 0.003),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.010,
                                                    bottom:
                                                        screenHeight * 0.010,
                                                    right:
                                                        15 //screenWidth*0.010
                                                    ),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Checkbox(
                                                              checkColor:
                                                                  AppColors
                                                                      .colorGrey,
                                                              activeColor: AppColors
                                                                  .colorLightGrey,
                                                              value: isChecked[
                                                                  index], //journals[index]['ischecked'],//controller.isChecked.value,
                                                              onChanged: (val) {
                                                                // print("isChecked index value " +
                                                                //     isChecked![
                                                                //             index]
                                                                //         .toString());
                                                                //
                                                                // print("isChecked index value2 " +
                                                                //     val.toString());

                                                                //setState(() {
                                                                setState(() {
                                                                  isChecked[
                                                                          index] =
                                                                      val!;

                                                                  // print("select checked ....." +
                                                                  //     isChecked![
                                                                  //             index]
                                                                  //         .toString());
                                                                  //
                                                                  // print("select checked index....." +
                                                                  //     index
                                                                  //         .toString());

                                                                  if (isChecked[
                                                                          index] ==
                                                                      true) {
                                                                    setState(
                                                                        () {
                                                                      // isSelected.add(
                                                                      //     journals[
                                                                      //         index]);

                                                                      selectedItemCount
                                                                          .value++;
                                                                      totalAmount
                                                                          .value = totalAmount
                                                                              .value +
                                                                          double.parse(
                                                                              "${productList[index]['price']}");

                                                                      isSelected.add(
                                                                          productList[
                                                                              index]);

                                                                      accountController
                                                                          .productCheckoutList
                                                                          .value
                                                                          .add({
                                                                        "style_color_id":
                                                                            productList[index]["colorID"].toString(),
                                                                        "product_size_id":
                                                                            productList[index]["sizeID"].toString(),
                                                                        "quantity":
                                                                            productList[index]["quantity"].toString(),
                                                                        "product_id":
                                                                            productList[index]["productID"].toString(),
                                                                        "shipping_cost": accountController
                                                                            .shippingCost
                                                                            .value
                                                                            .toString(),
                                                                        "total_price":
                                                                            productList[index]["price"].toString()
                                                                      });

                                                                      //
                                                                      if (totalAmount
                                                                              .value >=
                                                                          50.00) {
                                                                        totalAmount
                                                                            .value = totalAmount
                                                                                .value +
                                                                            double.parse("${accountController.apiDeliveryCostMap!["data"]["delivery_charge"]}");
                                                                      }
                                                                    });
                                                                  } else if (isChecked[
                                                                          index] ==
                                                                      false) {
                                                                    // isChecked?[index] = val!;

                                                                    setState(
                                                                        () {
                                                                      // isSelected
                                                                      //     .removeAt(
                                                                      //         index);

                                                                      isSelected
                                                                          .removeAt(
                                                                              index);

                                                                      selectedItemCount
                                                                          .value--;
                                                                      totalAmount.value = double.parse(totalAmount
                                                                          .toStringAsFixed(
                                                                              2)
                                                                          .toString());

                                                                      // print("total price selected before minus......." +
                                                                      //     totalAmount
                                                                      //         .value
                                                                      //         .toString());
                                                                      //
                                                                      // print("total price selected before subtract......." +
                                                                      //     double.parse("${productList[index]['price']}")
                                                                      //         .toString());

                                                                      totalAmount
                                                                          .value = totalAmount
                                                                              .value -
                                                                          double.parse(
                                                                              "${productList[index]['price']}");

                                                                      // print("total price selected after......." +
                                                                      //     totalAmount
                                                                      //         .value
                                                                      //         .toString());

                                                                      accountController
                                                                          .productCheckoutList
                                                                          .value
                                                                          .removeWhere((element) =>
                                                                              element["product_id"].toString() ==
                                                                              productList[index]["productID"].toString());

                                                                      // print("check out length......" +
                                                                      //     accountController
                                                                      //         .productCheckoutList
                                                                      //         .length
                                                                      //         .toString());

                                                                      if (totalAmount
                                                                              .value <=
                                                                          0.0) {
                                                                        totalAmount.value =
                                                                            00.00;
                                                                      } else {
                                                                        totalAmount
                                                                            .value = totalAmount
                                                                                .value -
                                                                            double.parse("${accountController.apiDeliveryCostMap!["data"]["delivery_charge"]}");
                                                                      }

                                                                      // print("total price selected ......." +
                                                                      //     totalAmount
                                                                      //         .value
                                                                      //         .toString());
                                                                    });
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            Image.network(
                                                              //"assets/images/banner_demo_image.png",
                                                              "${productList[index]["imageLink"]}",
                                                              height:
                                                                  screenHeight *
                                                                      0.10,
                                                              width:
                                                                  screenWidth *
                                                                      0.12,
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                }
                                                                return SizedBox(
                                                                  height:
                                                                      screenHeight *
                                                                          0.10,
                                                                  width:
                                                                      screenWidth *
                                                                          0.12,
                                                                  child: Center(
                                                                      child: Lottie.asset(
                                                                          "assets/json/loading.json",
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height: screenHeight *
                                                                              0.045,
                                                                          width:
                                                                              screenWidth * 0.060)),
                                                                );
                                                              },
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth *
                                                                      0.5,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: screenWidth *
                                                                        0.030),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${productList[index]["title"]}",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize:
                                                                            screenHeight *
                                                                                0.016,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "${productList[index]["price"]}",
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            fontSize:
                                                                                screenHeight * 0.013,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: screenHeight *
                                                                          0.008,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // SQLHelper.deleteItem(int.parse("${productList[index]["id"]}"));

                                                                            SQLHelper.deleteItem("${productList[index]["productID"]}");

                                                                            refreshProductList();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.delete_outlined,
                                                                            color:
                                                                                AppColors.colorLightBlack,
                                                                            size:
                                                                                screenHeight * 0.025,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              screenWidth * 0.020,
                                                                        ),
                                                                        // Icon(
                                                                        //   Icons
                                                                        //       .share,
                                                                        //   size: screenHeight *
                                                                        //       0.020,
                                                                        // ),
                                                                        // SizedBox(
                                                                        //   width: screenWidth *
                                                                        //       0.030,
                                                                        // ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            if (wishList.any((element) => element["productID"].toString() == productList[index]["productID"].toString()) ==
                                                                                true) {
                                                                              Get.snackbar(
                                                                                "Status",
                                                                                "The product already added in wish list",
                                                                                colorText: Colors.white,
                                                                                backgroundColor: Colors.orangeAccent,
                                                                                snackPosition: SnackPosition.BOTTOM,
                                                                              );
                                                                            } else {
                                                                              SQLWishListHelper.createItem("${productList[index]["title"]}", "${productList[index]["price"]}", "${productList[index]["sizeID"]}", "${productList[index]["productID"]}", "${productList[index]["colorID"]}", "${productList[index]["quantity"]}", "${productList[index]["imageLink"]}");

                                                                              await refreshWishList();
                                                                            }
                                                                          },
                                                                          child: wishList.any((element) => element["productID"].toString() == productList[index]["productID"].toString()) == true
                                                                              ? Icon(
                                                                                  Icons.favorite,
                                                                                  color: AppColors.colorLightGrey,
                                                                                  size: screenHeight * 0.020,
                                                                                )
                                                                              : Icon(
                                                                                  Icons.favorite_border,
                                                                                  color: AppColors.colorLightBlack,
                                                                                  size: screenHeight * 0.020,
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ])
                                                    ]))),
                                      );

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
                          SizedBox(
                            height: screenHeight * 0.23,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            height: screenHeight * 0.21,
                            width: screenWidth,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${selectedItemCount.value} item(s) Selected",
                                          style: GoogleFonts.poppins(
                                            fontSize: screenHeight * 0.020,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Discount",
                                        style: GoogleFonts.poppins(
                                            fontSize: screenHeight * 0.015,
                                            color: AppColors.colorGrey),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Text(
                                          discountAmount.value
                                                      .toString()
                                                      .length >
                                                  5
                                              ? discountAmount
                                                  .toString()
                                                  .substring(0, 4)
                                              : discountAmount.value.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: screenHeight * 0.015,
                                              color: AppColors.colorLightBlack),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Item total",
                                        style: GoogleFonts.poppins(
                                            fontSize: screenHeight * 0.015,
                                            color: AppColors.colorGrey),
                                      ),
                                      const Spacer(),
                                      // Padding(
                                      //   padding: EdgeInsets.only(
                                      //       right: screenWidth * 0.040),
                                      //   child: Text(
                                      //     "0% ",
                                      //     style: GoogleFonts.poppins(
                                      //         fontSize: screenHeight * 0.015,
                                      //         color: Colors.red),
                                      //   ),
                                      // ),
                                      Obx(
                                        () => Text(
                                          totalAmount.value.toStringAsFixed(2),
                                          style: GoogleFonts.poppins(
                                              fontSize: screenHeight * 0.015,
                                              color: AppColors.colorLightBlack),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Delivery Charge",
                                        style: GoogleFonts.poppins(
                                            fontSize: screenHeight * 0.015,
                                            color: AppColors.colorGrey),
                                      ),
                                      const Spacer(),
                                      Obx(() => Text(
                                            totalAmount.value >= 50.00
                                                ? accountController
                                                    .shippingCost.value
                                                    .toString()
                                                : "00.00",
                                            style: GoogleFonts.poppins(
                                                fontSize: screenHeight * 0.015,
                                                color:
                                                    AppColors.colorLightBlack),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: GoogleFonts.poppins(
                                            fontSize: screenHeight * 0.015,
                                            color: AppColors.colorLightBlack),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Text(
                                          totalAmount.value.toStringAsFixed(2),
                                          style: GoogleFonts.poppins(
                                              fontSize: screenHeight * 0.015,
                                              color: AppColors.colorLightBlack),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screenWidth * 0.31,
                                        height: screenHeight * 0.040,
                                        margin:
                                            const EdgeInsets.only(top: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors
                                                .colorGrey, // Set the color of the border
                                            width:
                                                1.0, // Set the width of the border
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(
                                              left: screenWidth * 0.007
                                            ),
                                            child: TextFormField(
                                              cursorColor:
                                                  AppColors.colorLightOrange,
                                              decoration: InputDecoration(
                                                hintText: "Enter voucher code",
                                                hintStyle: GoogleFonts.poppins(
                                                    fontSize:
                                                        screenHeight * 0.013),
                                                border: InputBorder.none,
                                              ),
                                              onChanged: (value) {
                                                voucherCode.value =
                                                    value.toString();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.015,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (voucherCode.value.length < 3) {
                                            Get.snackbar(
                                              "warning",
                                              "Enter code ...",
                                              colorText: Colors.white,
                                              backgroundColor:
                                                  Colors.orangeAccent,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                            );
                                          } else if (totalAmount.value ==
                                              00.00) {
                                            Get.snackbar(
                                              "warning",
                                              "Select at least one item ...",
                                              colorText: Colors.white,
                                              backgroundColor:
                                                  Colors.orangeAccent,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                            );
                                          } else {
                                            await accountController.getDiscount(
                                                voucherCode.value,
                                                totalAmount.value.toString());
                                            //

                                            // print("total value ...." +
                                            //     accountController
                                            //         .discountPercent.value
                                            //         .toString());

                                            discountAmount.value =
                                                (totalAmount.value *
                                                        accountController
                                                            .discountPercent
                                                            .value) /
                                                    100;

                                            totalAmount.value =
                                                totalAmount.value -
                                                    discountAmount.value;

                                            // print("discount value ...." +
                                            //     accountController
                                            //         .apiDiscountMap!["data"]
                                            //             ["discount"]
                                            //         .toString());
                                            //
                                            // print("discount value ...." +
                                            //     discountAmount.toString());
                                            //
                                            // print("total value ...." +
                                            //     totalAmount.toString());
                                          }
                                        },
                                        child: Container(
                                          width: screenWidth * 0.18,
                                          height: screenHeight * 0.040,
                                          margin:
                                              const EdgeInsets.only(top: 10.0),
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorLightGrey),
                                          child: Center(
                                            child: Text(
                                              "Apply",
                                              style: GoogleFonts.gothicA1(
                                                  color:
                                                      AppColors.colorLightBlack,
                                                  fontSize:
                                                      screenHeight * 0.013,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.025,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          print("tak0n .............." +
                                              accountController.loginToken
                                                  .toString());
                                          if (accountController.loginToken.toString().length <= 4 ) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "To place an order you need to log in",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            screenHeight *
                                                                                0.016,
                                                                        color: AppColors
                                                                            .colorLightBlack,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  SizedBox(
                                                                    width: screenWidth /
                                                                            2 +
                                                                        30,
                                                                    child:
                                                                        const Divider(
                                                                      color: AppColors
                                                                          .colorLightBlack,
                                                                      // height: screenWidth / 2 - 10,
                                                                      thickness:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        screenHeight *
                                                                            0.020,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.offAll(() =>
                                                                              LoginView());
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              screenHeight * 0.040,
                                                                          width:
                                                                              screenWidth * 0.30,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(color: AppColors.colorLightBlack)),
                                                                          // padding: EdgeInsets.symmetric(vertical:11,horizontal: 0.07),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Continue",
                                                                              style: GoogleFonts.poppins(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: screenWidth *
                                                                            0.030,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              screenHeight * 0.040,
                                                                          width:
                                                                              screenWidth*0.30,
                                                                          //screenWidth * 0.30,
                                                                          decoration:
                                                                              BoxDecoration(border: Border.all(color: AppColors.colorLightBlack)),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Cancel",
                                                                              style: GoogleFonts.poppins(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                          } else if (totalAmount.value >
                                              00.00) {
                                            accountController.getUserData();
                                            Get.to(() => CheckoutView(
                                                isSelected, totalAmount.value));

                                            // await accountController
                                            //     .doProductCheckout();
                                            //
                                            // refreshProductList();
                                          } else {
                                            Get.snackbar(
                                              "warning",
                                              "No item is selected",
                                              colorText: Colors.white,
                                              backgroundColor:
                                                  Colors.orangeAccent,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: screenWidth * 0.42,
                                          height: screenHeight * 0.040,
                                          margin:
                                              const EdgeInsets.only(top: 10.0),
                                          decoration: BoxDecoration(
                                              color: AppColors.colorWhite,
                                              border: Border.all(
                                                  color: AppColors
                                                      .colorLightBlack)),
                                          child: Center(
                                            child: Text(
                                              "check out",
                                              style: GoogleFonts.gothicA1(
                                                  color:
                                                      AppColors.colorLightBlack,
                                                  fontSize:
                                                      screenHeight * 0.013,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => accountController.isCartLoading.value == true
                          ? const Visibility(
                              visible: false,
                              child: CircularProgressIndicator())
                          : Container())
                    ],
                  )),

        //   )
        //
        // ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // print("before function call");
    refreshProductList();
    refreshWishList();
    accountController.getLoginToken();
    // print("length----------${journals.length}");
    //isChecked.value = List<bool>.filled(journals.length, false);
  }

  Future<void> ShareLInk() async {
    await Share.share(
        "Please check the item. It is so nice to use https://enorsia.com/",
        subject: "welcome");
  }
}
