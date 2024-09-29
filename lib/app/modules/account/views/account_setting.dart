// import 'package:enorsia/app/modules/account/controllers/account_controller.dart';
// import 'package:enorsia/app/modules/account/views/payment_history.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../utill/app_colors.dart';
// import '../../utill/app_size.dart';
// import '../../widgets/general_appbar.dart';
// import '../../widgets/payment_card.dart';
//
// class AccountSetting extends StatefulWidget {
//   AccountSetting({Key? key}) : super(key: key);
//
//   @override
//   State<AccountSetting> createState() => _AccountSettingState();
// }
//
// class _AccountSettingState extends State<AccountSetting> {
//   bool isItemExpanded = true;
//   bool isItem2Expanded = true;
//   bool isItem3Expanded = true;
//
//   AccountController accountController = Get.put(AccountController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(screenHeight * 0.08),
//           child: customGeneralAPPBar("Account Setting")),
//       body: Obx(() => accountController.isLoading.value==true? Text("Loading"): SingleChildScrollView(
//         child: Column(
//           children: [
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return ExpansionPanelList(
//                   dividerColor: Colors.transparent,
//                   expandIconColor: AppColors.colorGrey,
//                   elevation: 0,
//                   expandedHeaderPadding: EdgeInsets.zero,
//                   expansionCallback: (panelIndex, isExpanded) {
//                     setState(() {
//                       isItemExpanded = !isExpanded;
//                     });
//                   },
//                   children: [
//                     ExpansionPanel(
//                       headerBuilder: (context, isExpanded) {
//                         return ListTile(
//                           title: Padding(
//                             padding: EdgeInsets.only(left: screenWidth * 0.030),
//                             child: Text(
//                               "Account Information",
//                               style: GoogleFonts.gothicA1(
//                                 color: AppColors.colorLightBlack,
//                                 fontSize: screenHeight * 0.020,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       body: Column(
//                         children: [
//                           Container(
//                             width: screenWidth,
//                             height: screenHeight * 0.050,
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   "Full Name ",
//                                   style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - screenWidth * 0.010,
//                                   child: Text(
//                                     "Michel hober cristan jackson hil",
//                                     overflow: TextOverflow.ellipsis,
//                                     style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: screenWidth,
//                             height: screenHeight * 0.050,
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   "Phone ",
//                                   style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - screenWidth * 0.010,
//                                   child: Text(
//                                     "0123920392039",
//                                     overflow: TextOverflow.ellipsis,
//                                     style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: screenWidth,
//                             height: screenHeight * 0.050,
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   "Email",
//                                   style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - screenWidth * 0.010,
//                                   child: Text(
//                                     "micheljackshon@gmail.com",
//                                     overflow: TextOverflow.ellipsis,
//                                     style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: screenWidth,
//                             height: screenHeight * 0.050,
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   "Gender ",
//                                   style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - screenWidth * 0.010,
//                                   child: Text(
//                                     "Male",
//                                     overflow: TextOverflow.ellipsis,
//                                     style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: screenWidth,
//                             height: screenHeight * 0.050,
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text(
//                                   "BirthDay ",
//                                   style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Container(
//                                   width: screenWidth / 2 - screenWidth * 0.010,
//                                   child: Text(
//                                     DateTime.now().toString(),
//                                     overflow: TextOverflow.ellipsis,
//                                     style: GoogleFonts.gothicA1(
//                                       color: AppColors.colorLightBlack,
//                                       fontSize: screenHeight * 0.018,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       isExpanded: isItemExpanded,
//                       backgroundColor: Colors.white,
//                     ),
//                   ],
//                 );
//               },
//             ),
//             SizedBox(
//               height: screenHeight * 0.020,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return ExpansionPanelList(
//                   dividerColor: Colors.transparent,
//                   expandIconColor: AppColors.colorGrey,
//                   elevation: 0,
//                   expandedHeaderPadding: EdgeInsets.zero,
//                   expansionCallback: (panelIndex, isExpanded) {
//                     setState(() {
//                       isItem2Expanded = !isExpanded;
//                     });
//                   },
//                   children: [
//                     ExpansionPanel(
//                       headerBuilder: (context, isExpanded) {
//                         return ListTile(
//                           title: Padding(
//                               padding:
//                               EdgeInsets.only(left: screenWidth * 0.030),
//                               child: Text(
//                                 "Address Book",
//                                 style: GoogleFonts.gothicA1(
//                                   color: AppColors.colorLightBlack,
//                                   fontSize: screenHeight * 0.020,
//                                 ),
//                               )),
//                         );
//                       },
//                       body: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: 1,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               color: Colors.white,
//                               margin: EdgeInsets.all(10.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ListView.builder(
//                                       shrinkWrap: true,
//                                       itemCount: 2,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height:
//                                                       screenHeight * 0.040,
//                                                       width: screenWidth * 0.25,
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceAround,
//                                                         children: [
//                                                           Center(
//                                                               child: Text(
//                                                                 index == 0
//                                                                     ? "Office"
//                                                                     : "Home",
//                                                                 style: GoogleFonts.gothicA1(
//                                                                     color: AppColors
//                                                                         .colorLightBlack,
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                               )),
//                                                         ],
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                           borderRadius:
//                                                           BorderRadius
//                                                               .circular(10),
//                                                           border: Border.all(
//                                                             color: AppColors
//                                                                 .colorLightOrange, // Set the color of the border
//                                                             width:
//                                                             1.0, // Set the width of the border
//                                                           ),
//                                                           color: Colors.white),
//                                                     ),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                         left:
//                                                         screenWidth * 0.020,
//                                                       ),
//                                                       child: Container(
//                                                         height: screenHeight *
//                                                             0.040,
//                                                         width:
//                                                         screenWidth * 0.25,
//                                                         child: Center(
//                                                             child: Text(
//                                                               "Default",
//                                                               style: GoogleFonts
//                                                                   .poppins(
//                                                                   color: Colors
//                                                                       .white),
//                                                             )),
//                                                         decoration: BoxDecoration(
//                                                             borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                 10),
//                                                             color: AppColors
//                                                                 .colorLightOrange),
//                                                       ),
//                                                     ),
//                                                     Spacer(),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                           right: screenWidth *
//                                                               0.020),
//                                                       child: Icon(
//                                                         Icons.edit,
//                                                         color:
//                                                         AppColors.colorGrey,
//                                                         size: screenHeight *
//                                                             0.020,
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding: EdgeInsets.only(
//                                                           right: screenWidth *
//                                                               0.020),
//                                                       child: Icon(
//                                                         Icons.delete,
//                                                         color:
//                                                         AppColors.colorGrey,
//                                                         size: screenHeight *
//                                                             0.020,
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: screenHeight * 0.008,
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       "your default address here ....",
//                                                       overflow:
//                                                       TextOverflow.ellipsis,
//                                                       maxLines: 1,
//                                                       style:
//                                                       GoogleFonts.gothicA1(
//                                                           color: AppColors
//                                                               .colorGrey,
//                                                           fontSize:
//                                                           screenHeight *
//                                                               0.017),
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ));
//                                       }),
//                                 ],
//                               ),
//                             );
//                           }),
//                       isExpanded: isItem2Expanded,
//                       backgroundColor: Colors.white,
//                     ),
//                   ],
//                 );
//               },
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               margin: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     8.0), // Set your desired border radius
//                 border: Border.all(
//                   color:
//                   AppColors.colorLightOrange, // Set the color of the border
//                   width: 1.0, // Set the width of the border
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   "Add new address",
//                   style: GoogleFonts.gothicA1(
//                       color: AppColors.colorLightBlack,
//                       fontSize: screenHeight * 0.018,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.020,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return ExpansionPanelList(
//                   dividerColor: Colors.transparent,
//                   expandIconColor: AppColors.colorGrey,
//                   elevation: 0,
//                   expandedHeaderPadding: EdgeInsets.zero,
//                   expansionCallback: (panelIndex, isExpanded) {
//                     setState(() {
//                       isItem3Expanded = !isExpanded;
//                     });
//                   },
//                   children: [
//                     ExpansionPanel(
//                       headerBuilder: (context, isExpanded) {
//                         return ListTile(
//                           title: Padding(
//                               padding:
//                               EdgeInsets.only(left: screenWidth * 0.030),
//                               child: Text(
//                                 "Payment Option",
//                                 style: GoogleFonts.gothicA1(
//                                   color: AppColors.colorLightBlack,
//                                   fontSize: screenHeight * 0.018,
//                                 ),
//                               )),
//                         );
//                       },
//                       body: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: 1,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               color: Colors.white,
//                               margin: EdgeInsets.all(10.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   customPaymentCard(),
//                                 ],
//                               ),
//                             );
//                           }),
//                       isExpanded: isItem3Expanded,
//                       backgroundColor: Colors.white,
//                     ),
//                   ],
//                 );
//               },
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               margin: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     8.0), // Set your desired border radius
//                 border: Border.all(
//                   color:
//                   AppColors.colorLightOrange, // Set the color of the border
//                   width: 1.0, // Set the width of the border
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   "Add new +",
//                   style: GoogleFonts.gothicA1(
//                       color: AppColors.colorLightBlack,
//                       fontSize: screenHeight * 0.018,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               decoration: BoxDecoration(
//                   color: Colors.white // Set your desired border radius
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Language",
//                       style: GoogleFonts.gothicA1(
//                         color: AppColors.colorLightBlack,
//                         fontSize: screenHeight * 0.018,
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "English",
//                       style: GoogleFonts.gothicA1(
//                         color: AppColors.colorLightBlack,
//                         fontSize: screenHeight * 0.018,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               child: const Divider(
//                 color: Colors.grey,
//                 thickness: 0.7,
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               decoration: BoxDecoration(
//                   color: Colors.white // Set your desired border radius
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "General",
//                       style: GoogleFonts.gothicA1(
//                         color: AppColors.colorLightBlack,
//                         fontSize: screenHeight * 0.018,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               child: const Divider(
//                 color: Colors.grey,
//                 thickness: 0.7,
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               decoration: BoxDecoration(
//                   color: Colors.white // Set your desired border radius
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Police",
//                       style: GoogleFonts.gothicA1(
//                         color: AppColors.colorLightBlack,
//                         fontSize: screenHeight * 0.018,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               child: const Divider(
//                 color: Colors.grey,
//                 thickness: 0.7,
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               decoration: BoxDecoration(
//                   color: Colors.white // Set your desired border radius
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.to(() => PaymentHistory());
//                 },
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Payment History",
//                         style: GoogleFonts.gothicA1(
//                           color: AppColors.colorLightBlack,
//                           fontSize: screenHeight * 0.018,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               child: const Divider(
//                 color: Colors.grey,
//                 thickness: 0.7,
//               ),
//             ),
//             Container(
//               width: screenWidth,
//               height: screenHeight * 0.060,
//               decoration: BoxDecoration(
//                   color: Colors.white // Set your desired border radius
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Help",
//                       style: GoogleFonts.gothicA1(
//                         color: AppColors.colorLightBlack,
//                         fontSize: screenHeight * 0.018,
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 200,
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 'Log Out',
//                 style: GoogleFonts.gothicA1(
//                   color: AppColors.colorLightOrange,
//                   fontSize: screenHeight * 0.018,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),)
//
//
//     );
//   }
// }

// new code from remote

import 'package:enorsia/app/modules/account/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  List<Map<String, dynamic>> Cardjournals = [];
  bool CardisLoading = true;

  bool isItemExpanded = true;
  //bool isItem2Expanded = true;
  bool isItem3Expanded = true;

  AccountController accountController = Get.put(AccountController());

  TextEditingController AddressLine1Edit = TextEditingController();
  TextEditingController AddressLine2Edit = TextEditingController();
  TextEditingController stateEdit = TextEditingController();
  TextEditingController CityEdit = TextEditingController();
  TextEditingController PostCodeEdit = TextEditingController();
  TextEditingController countryEdit = TextEditingController();
  TextEditingController AppertmentEdit = TextEditingController();

  TextEditingController CardNumbertextEditingController =
      TextEditingController();
  TextEditingController CardValiditytextEditingController =
      TextEditingController();
  TextEditingController holderNametextEditingController =
      TextEditingController();
  TextEditingController CVVtextEditingController = TextEditingController();

  String CardIssuer = "Visa";

  // Future<void> refreshCardJournal() async {
  //   print("in funcion call");
  //
  //   final data = await SQLCardHelper.getItems();
  //   //journals=data;
  //   setState(() {
  //     Cardjournals = data;
  //     CardisLoading = false;
  //   });
  //
  //   //CardisChecked = List<bool>.filled(Cardjournals.length, false);
  //
  //   // for(int i = 0; i<isChecked.length ; i++){
  //   //   print("is value checked.............."+isChecked[i].toString());
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Setting")),
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(screenHeight * 0.08),
        //     child: customGeneralAPPBar("Account Setting")),
        body: Container(
          height: screenHeight,
          color: Colors.grey.shade100,
          child: SingleChildScrollView(
              child: Obx(
            () => accountController.isLoading.value == true
                ? SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                    child: Center(
                      child: Lottie.asset("assets/json/loading.json",
                          fit: BoxFit.cover,
                          height: screenHeight * 0.095,
                          width: screenWidth * 0.095),
                    ),
                  )
                : Column(
                    children: [
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: 1,
                      //   itemBuilder: (context, index) {
                      //     return ExpansionPanelList(
                      //       dividerColor: Colors.transparent,
                      //       expandIconColor: AppColors.colorGrey,
                      //       elevation: 0,
                      //       expandedHeaderPadding: EdgeInsets.zero,
                      //       expansionCallback: (panelIndex, isExpanded) {
                      //         setState(() {
                      //           isItemExpanded = !isExpanded;
                      //         });
                      //       },
                      //       children: [
                      //
                      //
                      //         ExpansionPanel(
                      //           headerBuilder: (context, isExpanded) {
                      //             return ListTile(
                      //               title: Padding(
                      //                 padding: EdgeInsets.only(left: screenWidth * 0.030),
                      //                 child: Text(
                      //                   "Account Information",
                      //                   style: GoogleFonts.gothicA1(
                      //                     color: AppColors.colorLightBlack,
                      //                     fontSize: screenHeight * 0.020,
                      //                   ),
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //           body: Column(
                      //             children: [
                      //               Container(
                      //                 width: screenWidth,
                      //                 height: screenHeight * 0.050,
                      //                 color: Colors.white,
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "Full Name ",
                      //                       style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                     Container(
                      //                       width: screenWidth / 2 - screenWidth * 0.010,
                      //                       child: Text(
                      //                         "${accountController.apiMap?["data"]["first_name"]} ${accountController.apiMap?["data"]["last_name"]}",
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               Container(
                      //                 width: screenWidth,
                      //                 height: screenHeight * 0.050,
                      //                 color: Colors.white,
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "Phone ",
                      //                       style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                     Container(
                      //                       width: screenWidth / 2 - screenWidth * 0.010,
                      //                       child: Text(
                      //                         "${accountController.apiMap?["data"]["phone"]}",
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               Container(
                      //                 width: screenWidth,
                      //                 height: screenHeight * 0.050,
                      //                 color: Colors.white,
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "Email",
                      //                       style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                     Container(
                      //                       width: screenWidth / 2 - screenWidth * 0.010,
                      //                       child: Text(
                      //                         "${accountController.apiMap?["data"]["email"]}",
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               Container(
                      //                 width: screenWidth,
                      //                 height: screenHeight * 0.050,
                      //                 color: Colors.white,
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "Gender ",
                      //                       style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                     Container(
                      //                       width: screenWidth / 2 - screenWidth * 0.010,
                      //                       child: Text(
                      //                         "Not specified",
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               Container(
                      //                 width: screenWidth,
                      //                 height: screenHeight * 0.050,
                      //                 color: Colors.white,
                      //                 child: Row(
                      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "BirthDay ",
                      //                       style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                     Container(
                      //                       width: screenWidth / 2 - screenWidth * 0.010,
                      //                       child: Text(
                      //                         "Not specified",
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.018,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //           isExpanded: isItemExpanded,
                      //           backgroundColor: Colors.white,
                      //         ),
                      //
                      //
                      //
                      //
                      //       ],
                      //     );
                      //   },
                      // ),

                      /////////////////////////////////////////////////////////////////

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          backgroundColor: Colors.white,
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text("Deliver to",
                                style: GoogleFonts.gothicA1(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.018,
                                )),
                          ),
                          children: [
                            //Text("We are still working on it....."),

                            // ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: accountController
                            //         .apiUserInfoMap!["data"]
                            //             ["addresses"]
                            //         .length,
                            //     itemBuilder: (context, index) {
                            //       return Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Row(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               height: screenHeight * 0.040,
                            //               width: screenWidth * 0.25,
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment
                            //                         .spaceAround,
                            //                 children: [
                            //                   Center(
                            //                       child: Text(
                            //                     index == 0
                            //                         ? "Office"
                            //                         : "Home",
                            //                     style: GoogleFonts.gothicA1(
                            //                         color: AppColors
                            //                             .colorLightBlack,
                            //                         fontWeight:
                            //                             FontWeight
                            //                                 .bold),
                            //                   )),
                            //                 ],
                            //               ),
                            //               decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(
                            //                           10),
                            //                   border: Border.all(
                            //                     color: AppColors
                            //                         .colorLightOrange, // Set the color of the border
                            //                     width:
                            //                         1.0, // Set the width of the border
                            //                   ),
                            //                   color: Colors.white),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.only(
                            //                 left: screenWidth * 0.020,
                            //               ),
                            //               child: Container(
                            //                 height:
                            //                     screenHeight * 0.040,
                            //                 width: screenWidth * 0.25,
                            //                 child: Center(
                            //                     child: Text(
                            //                   "Default",
                            //                   style:
                            //                       GoogleFonts.poppins(
                            //                           color:
                            //                               Colors.white),
                            //                 )),
                            //                 decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius
                            //                             .circular(10),
                            //                     color: AppColors
                            //                         .colorLightOrange),
                            //               ),
                            //             ),
                            //             Spacer(),
                            //             Padding(
                            //               padding: EdgeInsets.only(
                            //                   right:
                            //                       screenWidth * 0.020),
                            //               child: Icon(
                            //                 Icons.edit,
                            //                 color: AppColors.colorGrey,
                            //                 size: screenHeight * 0.020,
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       );
                            //     }),

                            // ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: 1,
                            //     itemBuilder: (context, index) {
                            //       return Container(
                            //         color: Colors.white,
                            //         margin: EdgeInsets.all(10.0),
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //
                            //           ],
                            //         ),
                            //       );
                            //     }),

                            InkWell(
                              onTap: () {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: SingleChildScrollView(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide: const BorderSide(
                                                                color: AppColors
                                                                    .colorLightGrey,
                                                                width: 2.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: AppColors
                                                                  .colorLightGrey,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: AppColors
                                                                  .colorLightGrey,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: AppColors
                                                                  .colorLightGrey,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          labelStyle: const TextStyle(
                                                              color: AppColors
                                                                  .colorLightGrey),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            color: AppColors
                                                                .colorLightOrange,
                                                          ),
                                                          hintText:
                                                              'Your address',
                                                          labelText:
                                                              'Address line 1',
                                                          border: const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red)),
                                                        ),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                        controller:
                                                            AddressLine1Edit,
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .pin_drop_outlined,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Your address',
                                                                labelText:
                                                                    'Address line 2',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                        controller:
                                                            AddressLine2Edit,
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .pin_drop_outlined,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Your appertment',
                                                                labelText:
                                                                    'Appertment',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                        controller:
                                                            AppertmentEdit,
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .map_outlined,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Your state',
                                                                labelText:
                                                                    'State',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                        controller: stateEdit,
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        controller: CityEdit,
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .location_city,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Your city',
                                                                labelText:
                                                                    'City',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .local_post_office,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Post code',
                                                                labelText:
                                                                    'Post code',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return (value !=
                                                                      null &&
                                                                  value
                                                                      .contains(
                                                                          '@'))
                                                              ? 'Do not use the @ char.'
                                                              : null;
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.080,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: TextFormField(
                                                        controller: countryEdit,
                                                        decoration:
                                                            InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide: const BorderSide(
                                                                      color: AppColors
                                                                          .colorLightGrey,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .colorLightGrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .colorLightGrey),
                                                                prefixIcon: const Icon(
                                                                    Icons
                                                                        .public,
                                                                    color: AppColors
                                                                        .colorLightOrange),
                                                                hintText:
                                                                    'Your Country',
                                                                labelText:
                                                                    'Country',
                                                                border: const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red))),
                                                        onSaved:
                                                            (String? value) {
                                                          // This optional block of code can be used to run
                                                          // code when the user saves the form.
                                                        },
                                                        validator:
                                                            (String? value) {
                                                          return null;

                                                          //return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    // accountController.addAddress("${AddressLine1Edit.text}", "${AddressLine2Edit.text}", "${stateEdit.text}", "${CityEdit.text}", "${PostCodeEdit.text}", "${countryEdit.text}");
                                                    //
                                                    // print("${accountController.statusCode}");
                                                    //
                                                    //
                                                    // if(accountController.statusCode.value==200){
                                                    //   Navigator.pop(context);
                                                    // }

                                                    //   SnackBar(
                                                    //       content: const Text('Adddress is saved'),
                                                    //   action: SnackBarAction(
                                                    //   label: 'Undo',
                                                    //   onPressed: () {
                                                    //   // Some code to undo the change.
                                                    // },
                                                    //   )
                                                    //   );
                                                  },
                                                  //=>Navigator.pop(context),
                                                  child:
                                                      const Text("Add Address"))
                                            ],
                                          ));
                                });
                              },
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * 0.060,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Set your desired border radius
                                  border: Border.all(
                                    color: AppColors
                                        .colorGrey, // Set the color of the border
                                    width: 1.0, // Set the width of the border
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add new address",
                                    style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Currency",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.050,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Working on it ",
                                    style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Sizes",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.050,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Working on it ",
                                    style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Notifications",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.050,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Working on it ",
                                    style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Shop",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.050,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Working on it ",
                                    style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightGrey,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Terms & Conditions - Privacy Policy",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: accountController
                                          .isTermsAndConditionLoading.value ==
                                      true
                                  ? Center(
                                      child: Lottie.asset(
                                          "assets/json/loading.json",
                                          fit: BoxFit.cover,
                                          height: screenHeight * 0.095,
                                          width: screenWidth * 0.095),
                                    )
                                  : Html(
                                      data:
                                          "${accountController.apiPrivacyPolicyMap!["data"]["description"]}"),
                            )
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () async {
                          await accountController.getUserDelete();
                          print("after function call");
                        },
                        child: Container(
                            color: Colors.white,
                            height: screenHeight * 0.060,
                            width: screenWidth,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.035,
                                    top: screenHeight * 0.015),
                                child: Text(
                                  "Delete My Account",
                                  style: GoogleFonts.gothicA1(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.020,
                                  ),
                                ),
                              ),
                            )
                            // ExpansionTile(
                            //   iconColor: AppColors.colorLightGrey,
                            //   title: Container(
                            //     margin: const EdgeInsets.symmetric(horizontal: 18),
                            //     child: Text(
                            //       "Delete My Account",
                            //       style: GoogleFonts.gothicA1(
                            //         color: AppColors.colorLightBlack,
                            //         fontSize: screenHeight * 0.020,
                            //       ),
                            //     ),
                            //   ),
                            //   children: [
                            //     // Container(
                            //     //   width: screenWidth,
                            //     //   height: screenHeight * 0.050,
                            //     //   color: Colors.white,
                            //     //   child: Row(
                            //     //     mainAxisAlignment: MainAxisAlignment.center,
                            //     //     children: [
                            //     //       Text(
                            //     //         "We Working on it ",
                            //     //         style: GoogleFonts.gothicA1(
                            //     //             color: AppColors.colorLightBlack,
                            //     //             fontSize: screenHeight * 0.018,
                            //     //             fontWeight: FontWeight.w600),
                            //     //       ),
                            //     //     ],
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),
                            ),
                      ),

                      // ExpansionTile(
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text(
                      //       "Account Information",
                      //       style: GoogleFonts.gothicA1(
                      //         color: AppColors.colorLightBlack,
                      //         fontSize: screenHeight * 0.020,
                      //       ),
                      //     ),
                      //   ),
                      //   children: [
                      //     Container(
                      //       width: screenWidth,
                      //       height: screenHeight * 0.050,
                      //       color: Colors.white,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           Text(
                      //             "Full Name ",
                      //             style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Container(
                      //             width: screenWidth / 2 - screenWidth * 0.010,
                      //             child: Text(
                      //               "${accountController.apiUserInfoMap?["data"]["first_name"]} ${accountController.apiUserInfoMap?["data"]["last_name"]}",
                      //               overflow: TextOverflow.ellipsis,
                      //               style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Container(
                      //       width: screenWidth,
                      //       height: screenHeight * 0.050,
                      //       color: Colors.white,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           Text(
                      //             "Phone ",
                      //             style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Container(
                      //             width: screenWidth / 2 - screenWidth * 0.010,
                      //             child: Text(
                      //               "${accountController.apiUserInfoMap?["data"]["phone"]}",
                      //               overflow: TextOverflow.ellipsis,
                      //               style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Container(
                      //       width: screenWidth,
                      //       height: screenHeight * 0.050,
                      //       color: Colors.white,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           Text(
                      //             "Email",
                      //             style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Container(
                      //             width: screenWidth / 2 - screenWidth * 0.010,
                      //             child: Text(
                      //               "${accountController.apiUserInfoMap?["data"]["email"]}",
                      //               overflow: TextOverflow.ellipsis,
                      //               style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     // Container(
                      //     //   width: screenWidth,
                      //     //   height: screenHeight * 0.050,
                      //     //   color: Colors.white,
                      //     //   child: Row(
                      //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     //     children: [
                      //     //       Text(
                      //     //         "Gender ",
                      //     //         style: GoogleFonts.gothicA1(
                      //     //             color: AppColors.colorLightBlack,
                      //     //             fontSize: screenHeight * 0.018,
                      //     //             fontWeight: FontWeight.w600),
                      //     //       ),
                      //     //       Container(
                      //     //         width: screenWidth / 2 - screenWidth * 0.010,
                      //     //         child: Text(
                      //     //           "Not specified",
                      //     //           overflow: TextOverflow.ellipsis,
                      //     //           style: GoogleFonts.gothicA1(
                      //     //             color: AppColors.colorLightBlack,
                      //     //             fontSize: screenHeight * 0.018,
                      //     //           ),
                      //     //         ),
                      //     //       )
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //     // Container(
                      //     //   width: screenWidth,
                      //     //   height: screenHeight * 0.050,
                      //     //   color: Colors.white,
                      //     //   child: Row(
                      //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     //     children: [
                      //     //       Text(
                      //     //         "BirthDay ",
                      //     //         style: GoogleFonts.gothicA1(
                      //     //             color: AppColors.colorLightBlack,
                      //     //             fontSize: screenHeight * 0.018,
                      //     //             fontWeight: FontWeight.w600),
                      //     //       ),
                      //     //       Container(
                      //     //         width: screenWidth / 2 - screenWidth * 0.010,
                      //     //         child: Text(
                      //     //           "Not specified",
                      //     //           style: GoogleFonts.gothicA1(
                      //     //             color: AppColors.colorLightBlack,
                      //     //             fontSize: screenHeight * 0.018,
                      //     //           ),
                      //     //         ),
                      //     //       )
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),

                      ////////////////////////////////////////////////////////////

                      // SizedBox(
                      //   height: screenHeight * 0.020,
                      // ),
                      //
                      // // ListView.builder(
                      // //   shrinkWrap: true,
                      // //   itemCount: 1,
                      // //   itemBuilder: (context, index) {
                      // //     return ExpansionPanelList(
                      // //       dividerColor: Colors.transparent,
                      // //       expandIconColor: AppColors.colorGrey,
                      // //       elevation: 0,
                      // //       expandedHeaderPadding: EdgeInsets.zero,
                      // //       expansionCallback: (panelIndex, isExpanded) {
                      // //         setState(() {
                      // //           isItem2Expanded = !isExpanded;
                      // //         });
                      // //       },
                      // //       children: [
                      // //         ExpansionPanel(
                      // //           headerBuilder: (context, isExpanded) {
                      // //             return ListTile(
                      // //               title: Padding(
                      // //                   padding:
                      // //                   EdgeInsets.only(left: screenWidth * 0.030),
                      // //                   child: Text(
                      // //                     "Address Book",
                      // //                     style: GoogleFonts.gothicA1(
                      // //                       color: AppColors.colorLightBlack,
                      // //                       fontSize: screenHeight * 0.020,
                      // //                     ),
                      // //                   )),
                      // //             );
                      // //           },
                      // //           body: ListView.builder(
                      // //               shrinkWrap: true,
                      // //               itemCount: 1,
                      // //               itemBuilder: (context, index) {
                      // //                 return Container(
                      // //                   color: Colors.white,
                      // //                   margin: EdgeInsets.all(10.0),
                      // //                   child: Column(
                      // //                     crossAxisAlignment: CrossAxisAlignment.start,
                      // //                     children: [
                      // //                       ListView.builder(
                      // //                           shrinkWrap: true,
                      // //                           itemCount: accountController.apiMap!["data"]["addresses"].length,
                      // //                           itemBuilder: (context, index) {
                      // //                             return Padding(
                      // //                               padding: const EdgeInsets.all(8.0),
                      // //                               child: Row(
                      // //                                 crossAxisAlignment:
                      // //                                 CrossAxisAlignment.start,
                      // //                                 children: [
                      // //                                   Container(
                      // //                                     height: screenHeight * 0.040,
                      // //                                     width: screenWidth * 0.25,
                      // //                                     child: Row(
                      // //                                       mainAxisAlignment:
                      // //                                       MainAxisAlignment
                      // //                                           .spaceAround,
                      // //                                       children: [
                      // //                                         Center(
                      // //                                             child: Text(
                      // //                                               index == 0
                      // //                                                   ? "Office"
                      // //                                                   : "Home",
                      // //                                               style: GoogleFonts.gothicA1(
                      // //                                                   color: AppColors
                      // //                                                       .colorLightBlack,
                      // //                                                   fontWeight:
                      // //                                                   FontWeight.bold),
                      // //                                             )),
                      // //                                       ],
                      // //                                     ),
                      // //                                     decoration: BoxDecoration(
                      // //                                         borderRadius:
                      // //                                         BorderRadius.circular(
                      // //                                             10),
                      // //                                         border: Border.all(
                      // //                                           color: AppColors
                      // //                                               .colorLightOrange, // Set the color of the border
                      // //                                           width:
                      // //                                           1.0, // Set the width of the border
                      // //                                         ),
                      // //                                         color: Colors.white),
                      // //                                   ),
                      // //                                   Padding(
                      // //                                     padding: EdgeInsets.only(
                      // //                                       left: screenWidth * 0.020,
                      // //                                     ),
                      // //                                     child: Container(
                      // //                                       height: screenHeight * 0.040,
                      // //                                       width: screenWidth * 0.25,
                      // //                                       child: Center(
                      // //                                           child: Text(
                      // //                                             "Default",
                      // //                                             style: GoogleFonts.poppins(
                      // //                                                 color: Colors.white),
                      // //                                           )),
                      // //                                       decoration: BoxDecoration(
                      // //                                           borderRadius:
                      // //                                           BorderRadius.circular(
                      // //                                               10),
                      // //                                           color: AppColors
                      // //                                               .colorLightOrange),
                      // //                                     ),
                      // //                                   ),
                      // //                                   Spacer(),
                      // //                                   Padding(
                      // //                                     padding: EdgeInsets.only(
                      // //                                         right: screenWidth * 0.020),
                      // //                                     child: Icon(
                      // //                                       Icons.edit,
                      // //                                       color: AppColors.colorGrey,
                      // //                                       size: screenHeight * 0.020,
                      // //                                     ),
                      // //                                   )
                      // //                                 ],
                      // //                               ),
                      // //                             );
                      // //                           }),
                      // //                     ],
                      // //                   ),
                      // //                 );
                      // //               }),
                      // //           isExpanded: isItem2Expanded,
                      // //           backgroundColor: Colors.white,
                      // //         ),
                      // //       ],
                      // //     );
                      // //   },
                      // // ),
                      //
                      // ///////////////////////////////////////////////////////////
                      //
                      // ExpansionTile(
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text(
                      //       "Address Book",
                      //       style: GoogleFonts.gothicA1(
                      //         color: AppColors.colorLightBlack,
                      //         fontSize: screenHeight * 0.020,
                      //       ),
                      //     ),
                      //   ),
                      //   children: [
                      //     ListView.builder(
                      //         shrinkWrap: true,
                      //         itemCount: 1,
                      //         itemBuilder: (context, index) {
                      //           return Container(
                      //             color: Colors.white,
                      //             margin: EdgeInsets.all(10.0),
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 ListView.builder(
                      //                     shrinkWrap: true,
                      //                     itemCount: accountController
                      //                         .apiUserInfoMap!["data"]["addresses"]
                      //                         .length,
                      //                     itemBuilder: (context, index) {
                      //                       return Padding(
                      //                         padding: const EdgeInsets.all(8.0),
                      //                         child: Row(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.start,
                      //                           children: [
                      //                             Container(
                      //                               height: screenHeight * 0.040,
                      //                               width: screenWidth * 0.25,
                      //                               child: Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceAround,
                      //                                 children: [
                      //                                   Center(
                      //                                       child: Text(
                      //                                     index == 0
                      //                                         ? "Office"
                      //                                         : "Home",
                      //                                     style: GoogleFonts.gothicA1(
                      //                                         color: AppColors
                      //                                             .colorLightBlack,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   )),
                      //                                 ],
                      //                               ),
                      //                               decoration: BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           10),
                      //                                   border: Border.all(
                      //                                     color: AppColors
                      //                                         .colorLightOrange, // Set the color of the border
                      //                                     width:
                      //                                         1.0, // Set the width of the border
                      //                                   ),
                      //                                   color: Colors.white),
                      //                             ),
                      //                             Padding(
                      //                               padding: EdgeInsets.only(
                      //                                 left: screenWidth * 0.020,
                      //                               ),
                      //                               child: Container(
                      //                                 height: screenHeight * 0.040,
                      //                                 width: screenWidth * 0.25,
                      //                                 child: Center(
                      //                                     child: Text(
                      //                                   "Default",
                      //                                   style: GoogleFonts.poppins(
                      //                                       color: Colors.white),
                      //                                 )),
                      //                                 decoration: BoxDecoration(
                      //                                     borderRadius:
                      //                                         BorderRadius.circular(
                      //                                             10),
                      //                                     color: AppColors
                      //                                         .colorLightOrange),
                      //                               ),
                      //                             ),
                      //                             Spacer(),
                      //                             Padding(
                      //                               padding: EdgeInsets.only(
                      //                                   right: screenWidth * 0.020),
                      //                               child: Icon(
                      //                                 Icons.edit,
                      //                                 color: AppColors.colorGrey,
                      //                                 size: screenHeight * 0.020,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       );
                      //                     }),
                      //               ],
                      //             ),
                      //           );
                      //         }),
                      //   ],
                      // ),
                      //
                      // ////////////////////////////////////////////////////////////
                      //
                      // InkWell(
                      //   onTap: () {
                      //     WidgetsBinding.instance
                      //         ?.addPostFrameCallback((timeStamp) {
                      //       showDialog(
                      //           context: context,
                      //           builder: (context) => AlertDialog(
                      //                 content: SingleChildScrollView(
                      //                   child: Container(
                      //                     padding: EdgeInsets.all(00),
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Container(
                      //                           child: TextFormField(
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon: Icon(
                      //                                     Icons.pin_drop_outlined),
                      //                                 hintText: 'Your address',
                      //                                 labelText: 'Address line 1',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                             controller: AddressLine1Edit,
                      //                           ),
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon: Icon(
                      //                                     Icons.pin_drop_outlined),
                      //                                 hintText: 'Your address',
                      //                                 labelText: 'Address line 2',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                             controller: AddressLine2Edit,
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon: Icon(
                      //                                     Icons.pin_drop_outlined),
                      //                                 hintText: 'Your appertment',
                      //                                 labelText: 'Appertment',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                             controller: AppertmentEdit,
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon:
                      //                                     Icon(Icons.map_outlined),
                      //                                 hintText: 'Your state',
                      //                                 labelText: 'State',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                             controller: stateEdit,
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             controller: CityEdit,
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon:
                      //                                     Icon(Icons.location_city),
                      //                                 hintText: 'Your city',
                      //                                 labelText: 'City',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon: Icon(
                      //                                     Icons.local_post_office),
                      //                                 hintText: 'Post code',
                      //                                 labelText: 'Post code',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               return (value != null &&
                      //                                       value.contains('@'))
                      //                                   ? 'Do not use the @ char.'
                      //                                   : null;
                      //                             },
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               vertical: 10),
                      //                           child: TextFormField(
                      //                             controller: countryEdit,
                      //                             decoration: const InputDecoration(
                      //                                 prefixIcon:
                      //                                     Icon(Icons.public),
                      //                                 hintText: 'Your Country',
                      //                                 labelText: 'Country',
                      //                                 border: OutlineInputBorder(
                      //                                     borderSide: BorderSide(
                      //                                         color: Colors.red))),
                      //                             onSaved: (String? value) {
                      //                               // This optional block of code can be used to run
                      //                               // code when the user saves the form.
                      //                             },
                      //                             validator: (String? value) {
                      //                               //return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                      //                             },
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 actions: [
                      //                   TextButton(
                      //                       onPressed: () => Navigator.pop(context),
                      //                       child: Text("Cancel")),
                      //                   TextButton(
                      //                       onPressed: () {
                      //                         SQLAddressHelper.createItem(
                      //                             "${AddressLine1Edit.text} ${AddressLine2Edit.text}",
                      //                             "${AppertmentEdit.text}",
                      //                             "${CityEdit.text}",
                      //                             "${stateEdit}",
                      //                             "${countryEdit}",
                      //                             "${PostCodeEdit}");
                      //
                      //                         // accountController.addAddress("${AddressLine1Edit.text}", "${AddressLine2Edit.text}", "${stateEdit.text}", "${CityEdit.text}", "${PostCodeEdit.text}", "${countryEdit.text}");
                      //                         //
                      //                         // print("${accountController.statusCode}");
                      //                         //
                      //                         //
                      //                         // if(accountController.statusCode.value==200){
                      //                         //   Navigator.pop(context);
                      //                         // }
                      //
                      //                         //   SnackBar(
                      //                         //       content: const Text('Adddress is saved'),
                      //                         //   action: SnackBarAction(
                      //                         //   label: 'Undo',
                      //                         //   onPressed: () {
                      //                         //   // Some code to undo the change.
                      //                         // },
                      //                         //   )
                      //                         //   );
                      //                       },
                      //                       //=>Navigator.pop(context),
                      //                       child: Text("Add Address"))
                      //                 ],
                      //               ));
                      //     });
                      //   },
                      //   child: Container(
                      //     width: screenWidth,
                      //     height: screenHeight * 0.060,
                      //     margin: EdgeInsets.symmetric(horizontal: 25),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(
                      //           8.0), // Set your desired border radius
                      //       border: Border.all(
                      //         color: AppColors
                      //             .colorLightOrange, // Set the color of the border
                      //         width: 1.0, // Set the width of the border
                      //       ),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "Add new address",
                      //         style: GoogleFonts.gothicA1(
                      //             color: AppColors.colorLightBlack,
                      //             fontSize: screenHeight * 0.018,
                      //             fontWeight: FontWeight.w700),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //
                      // SizedBox(
                      //   height: screenHeight * 0.020,
                      // ),
                      //
                      // // ListView.builder(
                      // //   shrinkWrap: true,
                      // //   itemCount: 1,
                      // //   itemBuilder: (context, index) {
                      // //     return ExpansionPanelList(
                      // //       dividerColor: Colors.transparent,
                      // //       expandIconColor: AppColors.colorGrey,
                      // //       elevation: 0,
                      // //       expandedHeaderPadding: EdgeInsets.zero,
                      // //       expansionCallback: (panelIndex, isExpanded) {
                      // //         setState(() {
                      // //           isItem3Expanded = !isExpanded;
                      // //         });
                      // //       },
                      // //       children: [
                      // //         ExpansionPanel(
                      // //           headerBuilder: (context, isExpanded) {
                      // //             return ListTile(
                      // //               title: Padding(
                      // //                   padding:
                      // //                   EdgeInsets.only(left: screenWidth * 0.030),
                      // //                   child: Text(
                      // //                     "Payment Option",
                      // //                     style: GoogleFonts.gothicA1(
                      // //                       color: AppColors.colorLightBlack,
                      // //                       fontSize: screenHeight * 0.018,
                      // //                     ),
                      // //                   )),
                      // //             );
                      // //           },
                      // //           body: ListView.builder(
                      // //               shrinkWrap: true,
                      // //               itemCount: 1,
                      // //               itemBuilder: (context, index) {
                      // //                 return Container(
                      // //                   color: Colors.white,
                      // //                   margin: EdgeInsets.all(10.0),
                      // //                   child: Column(
                      // //                     crossAxisAlignment: CrossAxisAlignment.start,
                      // //                     children: [
                      // //                       customPaymentCard(),
                      // //                     ],
                      // //                   ),
                      // //                 );
                      // //               }),
                      // //           isExpanded: isItem3Expanded,
                      // //           backgroundColor: Colors.white,
                      // //         ),
                      // //       ],
                      // //     );
                      // //   },
                      // // ),
                      //
                      // ///////////////////////////////////////////////////
                      //
                      // ExpansionTile(
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text("Payment Option",
                      //         style: GoogleFonts.gothicA1(
                      //           color: AppColors.colorLightBlack,
                      //           fontSize: screenHeight * 0.018,
                      //         )),
                      //   ),
                      //   children: [
                      //     ListView.builder(
                      //         physics: ScrollPhysics(),
                      //         shrinkWrap: true,
                      //         itemCount: Cardjournals.length,
                      //         itemBuilder: (context, index) {
                      //           return InkWell(
                      //             onTap: () {
                      //               // SQLCardHelper.deleteItem(int.parse("${Cardjournals[index]["id"]}"));
                      //               //refreshCardJournal();
                      //             },
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Row(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Text(
                      //                         "Credit card or Debit card",
                      //                         //"${Cardjournals[index]["cardIssuer"]}",//cardIssuer
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.016,
                      //                         ),
                      //                       ),
                      //                       Text(
                      //                         "${Cardjournals[index]["cardHolderName"]}",
                      //                         style: GoogleFonts.gothicA1(
                      //                           color: AppColors.colorLightBlack,
                      //                           fontSize: screenHeight * 0.013,
                      //                         ),
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.start,
                      //                         children: [
                      //                           Text(
                      //                             "Card no : ${Cardjournals[index]["cardNumber"]}",
                      //                             style: GoogleFonts.gothicA1(
                      //                               color:
                      //                                   AppColors.colorLightBlack,
                      //                               fontSize: screenHeight * 0.013,
                      //                             ),
                      //                           ),
                      //                           // Text(
                      //                           //   " 2119 X X X X X X 998 ",
                      //                           //   style: GoogleFonts.gothicA1(
                      //                           //     color: AppColors.colorLightBlack,
                      //                           //     fontSize: screenHeight * 0.013,
                      //                           //   ),
                      //                           // ),
                      //                         ],
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.start,
                      //                         children: [
                      //                           Text(
                      //                             "Exp : ${Cardjournals[index]["validity"]}",
                      //                             style: GoogleFonts.gothicA1(
                      //                               color:
                      //                                   AppColors.colorLightBlack,
                      //                               fontSize: screenHeight * 0.013,
                      //                             ),
                      //                           ),
                      //                           // Text(
                      //                           //   "  05/25",
                      //                           //   style: GoogleFonts.gothicA1(
                      //                           //     color: AppColors.colorLightBlack,
                      //                           //     fontSize: screenHeight * 0.013,
                      //                           //   ),
                      //                           // ),
                      //                         ],
                      //                       )
                      //                     ],
                      //                   ),
                      //                   Spacer(),
                      //                   Padding(
                      //                     padding: EdgeInsets.only(
                      //                         right: screenWidth * 0.020),
                      //                     child: SvgPicture.asset(
                      //                       "assets/images/visa_card.svg",
                      //                       height: screenHeight * 0.030,
                      //                       width: screenWidth * 0.070,
                      //                       fit: BoxFit.fill,
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: EdgeInsets.only(
                      //                         right: screenWidth * 0.020),
                      //                     child: Icon(
                      //                       Icons.edit,
                      //                       color: AppColors.colorGrey,
                      //                       size: screenHeight * 0.022,
                      //                     ),
                      //                   ),
                      //                   InkWell(
                      //                     onTap: () {
                      //                       SQLCardHelper.deleteItem(int.parse(
                      //                           "${Cardjournals[index]["id"]}"));
                      //
                      //                       refreshCardJournal();
                      //                     },
                      //                     child: Padding(
                      //                       padding: EdgeInsets.only(
                      //                           right: screenWidth * 0.020),
                      //                       child: Icon(
                      //                         Icons.delete_outlined,
                      //                         color: AppColors.colorGrey,
                      //                         size: screenHeight * 0.022,
                      //                       ),
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //
                      //             // Container(
                      //             //   color: Colors.white,
                      //             //   margin: EdgeInsets.all(10.0),
                      //             //   child: Column(
                      //             //     crossAxisAlignment: CrossAxisAlignment.start,
                      //             //     children: [
                      //             //       customPaymentCard(int.parse("${Cardjournals[index]["id"]}")),
                      //             //     ],
                      //             //   ),
                      //             // ),
                      //           );
                      //         }),
                      //   ],
                      // ),
                      //
                      // //////////////////////////////////////////////////
                      //
                      // InkWell(
                      //   onTap: () {
                      //     WidgetsBinding.instance
                      //         ?.addPostFrameCallback((timeStamp) {
                      //       showDialog(
                      //           context: context,
                      //           builder: (context) => AlertDialog(
                      //                 content: SingleChildScrollView(
                      //                   child: Container(
                      //                     padding: EdgeInsets.all(5),
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         TextField(
                      //                           maxLines: 1,
                      //                           controller:
                      //                               CardNumbertextEditingController,
                      //                           decoration: InputDecoration(
                      //                               labelText: "Card Number",
                      //                               labelStyle:
                      //                                   GoogleFonts.raleway(),
                      //                               floatingLabelStyle:
                      //                                   GoogleFonts.yantramanav(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                                 color: Colors.black,
                      //                               ),
                      //                               border: OutlineInputBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30)),
                      //                               filled: true,
                      //                               fillColor: Colors.white70,
                      //                               hintText: "Enter Card Number",
                      //                               focusedBorder:
                      //                                   OutlineInputBorder(
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(10),
                      //                                       borderSide: BorderSide(
                      //                                           color: Colors.black,
                      //                                           width: 1.0))),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 10,
                      //                         ),
                      //                         TextField(
                      //                           maxLines: 1,
                      //                           controller:
                      //                               CardValiditytextEditingController,
                      //                           decoration: InputDecoration(
                      //                               labelText: "Expire Month",
                      //                               labelStyle:
                      //                                   GoogleFonts.raleway(),
                      //                               floatingLabelStyle:
                      //                                   GoogleFonts.yantramanav(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                                 color: Colors.black,
                      //                               ),
                      //                               border: OutlineInputBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30)),
                      //                               filled: true,
                      //                               fillColor: Colors.white70,
                      //                               hintText: "MM/YY",
                      //                               focusedBorder:
                      //                                   OutlineInputBorder(
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(10),
                      //                                       borderSide: BorderSide(
                      //                                           color: Colors.black,
                      //                                           width: 1.0))),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 10,
                      //                         ),
                      //                         TextField(
                      //                           maxLines: 1,
                      //                           controller:
                      //                               holderNametextEditingController,
                      //                           decoration: InputDecoration(
                      //                               labelText: "Card Holder Name",
                      //                               labelStyle:
                      //                                   GoogleFonts.raleway(),
                      //                               floatingLabelStyle:
                      //                                   GoogleFonts.yantramanav(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                                 color: Colors.black,
                      //                               ),
                      //                               border: OutlineInputBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30)),
                      //                               filled: true,
                      //                               fillColor: Colors.white70,
                      //                               hintText:
                      //                                   "Enter Card Holder Name",
                      //                               focusedBorder:
                      //                                   OutlineInputBorder(
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(10),
                      //                                       borderSide: BorderSide(
                      //                                           color: Colors.black,
                      //                                           width: 1.0))),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 10,
                      //                         ),
                      //                         TextField(
                      //                           maxLines: 1,
                      //                           controller:
                      //                               CVVtextEditingController,
                      //                           decoration: InputDecoration(
                      //                               labelText: "CVV",
                      //                               labelStyle:
                      //                                   GoogleFonts.raleway(),
                      //                               floatingLabelStyle:
                      //                                   GoogleFonts.yantramanav(
                      //                                 fontSize: 20,
                      //                                 fontWeight: FontWeight.bold,
                      //                                 color: Colors.black,
                      //                               ),
                      //                               border: OutlineInputBorder(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30)),
                      //                               filled: true,
                      //                               fillColor: Colors.white70,
                      //                               hintText: "Enter CVV",
                      //                               focusedBorder:
                      //                                   OutlineInputBorder(
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(10),
                      //                                       borderSide: BorderSide(
                      //                                           color: Colors.black,
                      //                                           width: 1.0))),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 actions: [
                      //                   ElevatedButton(
                      //                     onPressed: () async {
                      //                       //PasswordReset(passwordResetController.text,context);
                      //                       scanCard();
                      //                     },
                      //                     style: ElevatedButton.styleFrom(
                      //                       padding: EdgeInsets.symmetric(
                      //                           horizontal: 20, vertical: 2),
                      //                       backgroundColor:
                      //                           Color.fromARGB(255, 238, 98, 49),
                      //                       shape: StadiumBorder(),
                      //                     ),
                      //                     child: Text(
                      //                       "Scan Card",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontSize: 18,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                   ),
                      //                   ElevatedButton(
                      //                     onPressed: () async {
                      //                       //PasswordReset(passwordResetController.text,context);
                      //
                      //                       //SQLCardHelper.createItem(title, Price, sizeID, ProductID, colorID, quantity, ImageLink)
                      //                       SQLCardHelper.createItem(
                      //                           CardNumbertextEditingController
                      //                               .text,
                      //                           holderNametextEditingController
                      //                               .text,
                      //                           CardValiditytextEditingController
                      //                               .text,
                      //                           CVVtextEditingController.text,
                      //                           "${CardIssuer}");
                      //
                      //                       refreshCardJournal();
                      //                     },
                      //                     style: ElevatedButton.styleFrom(
                      //                       padding: EdgeInsets.symmetric(
                      //                           horizontal: 20, vertical: 2),
                      //                       backgroundColor:
                      //                           Color.fromARGB(255, 238, 98, 49),
                      //                       shape: StadiumBorder(),
                      //                     ),
                      //                     child: Text(
                      //                       "Add Card",
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontSize: 18,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ));
                      //     });
                      //   },
                      //   child: Container(
                      //     width: screenWidth,
                      //     height: screenHeight * 0.060,
                      //     margin: EdgeInsets.symmetric(horizontal: 25.0),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(
                      //           8.0), // Set your desired border radius
                      //       border: Border.all(
                      //         color: AppColors
                      //             .colorLightOrange, // Set the color of the border
                      //         width: 1.0, // Set the width of the border
                      //       ),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "Add new +",
                      //         style: GoogleFonts.gothicA1(
                      //             color: AppColors.colorLightBlack,
                      //             fontSize: screenHeight * 0.018,
                      //             fontWeight: FontWeight.w700),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //
                      // Container(
                      //   width: screenWidth,
                      //   height: screenHeight * 0.060,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white // Set your desired border radius
                      //       ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 8.0, horizontal: 44),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text(
                      //           "Language",
                      //           style: GoogleFonts.gothicA1(
                      //             color: AppColors.colorLightBlack,
                      //             fontSize: screenHeight * 0.018,
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "English",
                      //             style: GoogleFonts.gothicA1(
                      //               color: AppColors.colorLightBlack,
                      //               fontSize: screenHeight * 0.018,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   width: screenWidth,
                      //   child: const Divider(
                      //     color: Colors.grey,
                      //     thickness: 0.7,
                      //   ),
                      // ),
                      // Container(
                      //   width: screenWidth,
                      //   height: screenHeight * 0.060,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white // Set your desired border radius
                      //       ),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 44, vertical: 8.0),
                      //         child: Text(
                      //           "General",
                      //           style: GoogleFonts.gothicA1(
                      //             color: AppColors.colorLightBlack,
                      //             fontSize: screenHeight * 0.018,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: screenWidth,
                      //   child: const Divider(
                      //     color: Colors.grey,
                      //     thickness: 0.7,
                      //   ),
                      // ),
                      //
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(PrivacyPolicy());
                      //   },
                      //   child: Container(
                      //     width: screenWidth,
                      //     height: screenHeight * 0.060,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white // Set your desired border radius
                      //         ),
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               horizontal: 44, vertical: 8.0),
                      //           child: Text(
                      //             "Police",
                      //             style: GoogleFonts.gothicA1(
                      //               color: AppColors.colorLightBlack,
                      //               fontSize: screenHeight * 0.018,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //
                      // Container(
                      //   width: screenWidth,
                      //   child: const Divider(
                      //     color: Colors.grey,
                      //     thickness: 0.7,
                      //   ),
                      // ),
                      //
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(() => PaymentHistory());
                      //   },
                      //   child: Container(
                      //     width: screenWidth,
                      //     height: screenHeight * 0.060,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white // Set your desired border radius
                      //         ),
                      //     child: GestureDetector(
                      //       child: Row(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 44, vertical: 8.0),
                      //             child: Text(
                      //               "Payment History",
                      //               style: GoogleFonts.gothicA1(
                      //                 color: AppColors.colorLightBlack,
                      //                 fontSize: screenHeight * 0.018,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //
                      // Container(
                      //   width: screenWidth,
                      //   child: const Divider(
                      //     color: Colors.grey,
                      //     thickness: 0.7,
                      //   ),
                      // ),
                      // Container(
                      //   width: screenWidth,
                      //   height: screenHeight * 0.060,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white // Set your desired border radius
                      //       ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 44, vertical: 8.0),
                      //         child: Text(
                      //           "Help",
                      //           style: GoogleFonts.gothicA1(
                      //             color: AppColors.colorLightBlack,
                      //             fontSize: screenHeight * 0.018,
                      //           ),
                      //         ),
                      //       ),
                      //       Spacer(),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 200,
                      // ),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 44, vertical: 8.0),
                      //     child: Text(
                      //       'Log Out',
                      //       style: GoogleFonts.gothicA1(
                      //         color: AppColors.colorLightOrange,
                      //         fontSize: screenHeight * 0.018,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
          )),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   refreshCardJournal();
  // }
}
