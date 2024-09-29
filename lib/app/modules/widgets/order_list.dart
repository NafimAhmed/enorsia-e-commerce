import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account/views/order_details.dart';
import '../utill/app_colors.dart';
import '../utill/app_size.dart';

Widget orderList(
    String orderName,
    String orderDate,
    String totalItem,
    String totalPrice,
    String OrderID,
    List<dynamic> productList,
    Map<String, dynamic> orderDetail) {
  return GestureDetector(
    onTap: () {
      Get.to(() => OrderDetails(
            OrderId: "",
            OrderDate: orderDate,
            OrderName: orderName,
            phone: orderDetail["phone"],
            shippingAddress: orderDetail["shipping_address"],
            productList: productList,
            totalPrice: totalPrice,
          ));
    },
    child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oder Name $orderName",
                      style: GoogleFonts.poppins(
                          color: AppColors.colorLightBlack,
                          fontSize: screenHeight * 0.019,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " Placed order on $orderDate",
                      style: GoogleFonts.poppins(
                        color: AppColors.colorLightBlack,
                        fontSize: screenHeight * 0.012,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.003,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: FadeInImage(
                          image: NetworkImage(
                            "https://enorsia.com/upload/ecom_products/${productList[index]["product"]["featured_image"]}",
                          ),
                          placeholder: const AssetImage(
                              'assets/images/placeholder_image.png'),
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/placeholder_image.png",
                              height: screenHeight * 0.16,
                              width: screenWidth * 0.12,
                              fit: BoxFit.cover,
                            );
                          },
                          height: screenHeight * 0.16,
                          width: screenWidth * 0.12,
                        ),
                        // Image.network(
                        //   "https://enorsia.com/upload/ecom_products/${productList[index]["product"]["featured_image"]}",
                        //   height: screenHeight * 0.10,
                        //   width: screenWidth * 0.12,
                        //   fit: BoxFit.cover,
                        // ),
                        title: Text(
                          "${productList[index]["product"]["product_name"]}",
                          style: GoogleFonts.yantramanav(
                              fontSize: screenHeight * 0.017),
                        ),
                        subtitle: Text(
                          "${productList[index]["unit_price"]} ₤",
                          style: GoogleFonts.yantramanav(
                              fontSize: screenHeight * 0.017),
                        ),
                      )

                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Image.asset(
                      //       "assets/images/banner_demo_image.png",
                      //       height: screenHeight * 0.10,
                      //       width: screenWidth * 0.12,
                      //       fit: BoxFit.cover,
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(
                      //         left: screenWidth * 0.020,
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             " Half Zip Long Sleeve Polo Shirt",
                      //             style: GoogleFonts.poppins(
                      //               color: AppColors.colorLightBlack,
                      //               fontSize: screenHeight * 0.012,
                      //             ),
                      //           ),
                      //           Text(
                      //             " £32.99 X 1",
                      //             style: GoogleFonts.poppins(
                      //               color: AppColors.colorLightBlack,
                      //               fontSize: screenHeight * 0.012,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                      );
                }),
            SizedBox(
              height: screenHeight * 0.003,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$totalItem items, Total: £ $totalPrice",
                  style: GoogleFonts.poppins(
                    color: AppColors.colorLightBlack,
                    fontSize: screenHeight * 0.012,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            SizedBox(
              height: screenHeight * 0.030,
              width: screenWidth,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: screenHeight * 0.030,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.colorWhite.withOpacity(0.3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.rate_review_outlined,
                          color: AppColors.colorLightBlack,
                          size: screenHeight * 0.019,
                        ),
                        Center(
                            child: Text(
                          "Review",
                          style: GoogleFonts.poppins(
                              color: AppColors.colorLightBlack),
                        )),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: screenWidth * 0.010,
                  // ),
                  // Container(
                  //   height: screenHeight * 0.030,
                  //   width: screenWidth * 0.25,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Icon(
                  //         Icons.share,
                  //         color: AppColors.colorLightBlack,
                  //         size: screenHeight * 0.019,
                  //       ),
                  //       Center(
                  //           child: Text(
                  //         "Share",
                  //         style: GoogleFonts.poppins(
                  //             color: AppColors.colorLightBlack),
                  //       )),
                  //     ],
                  //   ),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(30),
                  //       color: AppColors.colorWhite.withOpacity(0.3)),
                  // ),
                  SizedBox(
                    width: screenWidth * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.030,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.colorLightBlack)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Text(
                          "Deliverd",
                          style: GoogleFonts.poppins(
                              color: AppColors.colorLightBlack),
                        )),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: AppColors.colorLightBlack,
                          size: screenHeight * 0.019,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.030,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.colorLightGrey),
                    child: Center(
                        child: Text(
                      "Buy Again",
                      style:
                          GoogleFonts.poppins(color: AppColors.colorLightBlack),
                    )),
                  ),
                ],
              ),
            )
          ],
        )),
  );
}
