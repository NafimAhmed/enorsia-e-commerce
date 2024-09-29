import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';

class OrderDetails extends StatelessWidget {
  final String OrderName;
  final String phone;
  final String shippingAddress;
  final String totalPrice;
  final String OrderDate;
  final String OrderId;
  final List<dynamic> productList;

  const OrderDetails(
      {Key? key,
      required this.OrderName,
      required this.phone,
      required this.shippingAddress,
      required this.productList,
      required this.totalPrice,
      required this.OrderDate,
      required this.OrderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("My order details")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.12,
                width: screenWidth,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ship & Bill to",
                        style: GoogleFonts.gothicA1(
                            color: AppColors.colorLightBlack,
                            fontSize: screenHeight * 0.018,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      Text(
                        "Tanvir Ahmed",
                        style: GoogleFonts.gothicA1(
                          color: AppColors.colorLightBlack,
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                      Text(
                        phone,
                        style: GoogleFonts.gothicA1(
                          color: AppColors.colorLightBlack,
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                      Text(
                        shippingAddress,
                        style: GoogleFonts.gothicA1(
                          color: AppColors.colorLightBlack,
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth,
                child: const Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
              ),
              Container(
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
                              "Oder Name $OrderName",
                              style: GoogleFonts.poppins(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " Placed order on $OrderDate",
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  "https://enorsia.com/upload/ecom_products/${productList[index]["product"]["featured_image"]}",
                                  height: screenHeight * 0.10,
                                  width: screenWidth * 0.12,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.020,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${productList[index]["product"]["product_name"]}",
                                        style: GoogleFonts.poppins(
                                          color: AppColors.colorLightBlack,
                                          fontSize: screenHeight * 0.012,
                                        ),
                                      ),
                                      Text(
                                        " ${productList[index]["unit_price"]} ₤",
                                        style: GoogleFonts.poppins(
                                          color: AppColors.colorLightBlack,
                                          fontSize: screenHeight * 0.012,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: screenHeight * 0.003,
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${productList.length} items, Total: £ $totalPrice",
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
                                color: AppColors.colorGrey.withOpacity(0.3)),
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
                          SizedBox(
                            width: screenWidth * 0.010,
                          ),
                          Container(
                            height: screenHeight * 0.030,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.colorGrey.withOpacity(0.3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.share,
                                  color: AppColors.colorLightBlack,
                                  size: screenHeight * 0.019,
                                ),
                                Center(
                                    child: Text(
                                  "Share",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.colorLightBlack),
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.010,
                          ),
                          Container(
                            height: screenHeight * 0.030,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.colorGrey.withOpacity(0.3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.colorLightBlack,
                                  size: screenHeight * 0.019,
                                ),
                                Center(
                                    child: Text(
                                  "Trace",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.colorLightBlack),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth,
                child: const Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery partner :",
                            style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " DPD Global",
                            style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tracking Number :",
                            style: GoogleFonts.ruluko(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " DPD_EG 923823829",
                            style: GoogleFonts.ruluko(
                                color: AppColors.colorLightOrange,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: screenWidth,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "May 24",
                              maxLines: 3,
                              style: GoogleFonts.ruluko(
                                color: AppColors.colorGrey,
                                fontSize: screenHeight * 0.018,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.010,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.018,
                                  width: screenWidth * 0.035,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == 0
                                          ? AppColors.colorGrey
                                          : AppColors.colorGrey),
                                ),
                                Container(
                                  height: screenHeight * 0.048,
                                  width: screenWidth * 0.005,
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? AppColors.colorGrey
                                          : AppColors.colorGrey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.010),
                                  child: Text(
                                    "Processed and ready to ship",
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.colorGrey,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.010),
                                  child: SizedBox(
                                    width: screenWidth / 2,
                                    child: Text(
                                      "Your items are ready and will be our delivery partner soon",
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        color: AppColors.colorGrey,
                                        fontSize: screenHeight * 0.015,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.12,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.colorGrey,
                      AppColors.colorLightGrey
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.030,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Estimate Delivery by",
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenHeight * 0.018,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.030,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              DateTime.now().toString().substring(0, 11),
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: screenHeight * 0.022,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
