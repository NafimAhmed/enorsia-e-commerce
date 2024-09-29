import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';

import '../../utill/app_size.dart';
import 'loyality.dart';

class MyGiftVoucher extends StatelessWidget {
  const MyGiftVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Gift Voucher"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth*0.61069,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Points",
                            style: GoogleFonts.yantramanav(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(Loyality());
                            },
                            child: Text(
                              "9876 pts",
                              style: GoogleFonts.yantramanav(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth*0.3028,
                            child: Text(
                              "By shopping more products and share in social media you will earn more points",
                              maxLines: 2,
                              style: GoogleFonts.yantramanav(
                                  fontSize: 6, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Text(
                            "~ 9.8 Euro",
                            style: GoogleFonts.yantramanav(
                                fontSize: 6, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenWidth*0.21,
                  height: 16,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(3)),
                  alignment: Alignment.center,
                  child: Text(
                    "Redeem now",
                    style: GoogleFonts.yantramanav(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: const Color.fromARGB(255, 238, 98, 49)),
                  ),
                )
              ],
            ),
          ),

          // ListTile(
          //   title:Container(
          //     width: screenWidth*0.6106,
          //     child: InkWell(
          //       onTap: (){
          //         Get.to(Loyality());
          //       },
          //       child: Row(
          //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //
          //           Text("My Points"),
          //
          //           SizedBox(width: screenWidth*0.25,),
          //           Text("9876 pts")
          //
          //         ],
          //       ),
          //     ),
          //   ),
          //   subtitle: Row(
          //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //
          //       Text("By shopping more products and share in social media\n you will earn more points",
          //         maxLines: 5,
          //         style: GoogleFonts.yantramanav(
          //             fontSize: 6,
          //             fontWeight: FontWeight.w300
          //         ),
          //       ),
          //
          //       SizedBox(width: screenWidth*0.18,),
          //
          //       Text("~ 9.8 Euro",
          //         style: GoogleFonts.yantramanav(
          //             fontSize: 6,
          //             fontWeight: FontWeight.w300
          //         ),
          //       ),
          //
          //       SizedBox(width: screenWidth*0.05,),
          //
          //
          //       Text("Redeem now",
          //         style: GoogleFonts.yantramanav(
          //           fontSize: 10,
          //           fontWeight: FontWeight.w500,
          //           color: Color.fromARGB(255,238, 98, 49)
          //         ),
          //       )
          //
          //
          //     ],
          //   ),
          // ),

          //  Container(
          //   width: screenWidth,
          //   child: Row(
          //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //
          //       Container(
          //         width: screenWidth,
          //         child: Column(
          //
          //           children: [
          //
          //             Row(
          //               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //
          //                 Text("My Points"),
          //
          //                 Text("9876 pts")
          //
          //               ],
          //             ),
          //
          //             Row(
          //               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //
          //                 Text("By shopping more products and share in social media\n you will earn more points",
          //                 maxLines: 5,
          //                   style: GoogleFonts.yantramanav(
          //                     fontSize: 6,
          //                     fontWeight: FontWeight.w300
          //                   ),
          //                 ),
          //
          //                 Text("~ 9.8 Euro",
          //                   style: GoogleFonts.yantramanav(
          //                       fontSize: 6,
          //                       fontWeight: FontWeight.w300
          //                   ),
          //                 )
          //
          //
          //               ],
          //             )
          //
          //
          //
          //           ],
          //         ),
          //       ),
          //
          //
          //       Container(
          //         child: Text("Redeem Points"),
          //       )
          //
          //
          //
          //     ],
          //   ),
          // ),

          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.6334,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My Voucher",
                                  style: GoogleFonts.yantramanav(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                Text(
                                  "02",
                                  style: GoogleFonts.yantramanav(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.remove_red_eye,
                            size: 12,
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth * 0.1603,
                        height: 16,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(3)),
                        alignment: Alignment.center,
                        child: Text(
                          "Use now",
                          style: GoogleFonts.yantramanav(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 238, 98, 49)),
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
