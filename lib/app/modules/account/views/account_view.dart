import 'payment_history.dart';
import 'return_list.dart';
import '../../registration/views/login_view.dart';
import '../../utill/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/account_controller.dart';
import 'account_details.dart';
import 'offer.dart';
import 'order_list.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List<Map<String, dynamic>> Cardjournals = [];
  bool CardisLoading = true;

  TextEditingController BillingAddressLine1Edit = TextEditingController();
  TextEditingController BillingAddressLine2Edit = TextEditingController();
  TextEditingController BillingstateEdit = TextEditingController();
  TextEditingController BillingCityEdit = TextEditingController();
  TextEditingController BillingPostCodeEdit = TextEditingController();
  TextEditingController BillingcountryEdit = TextEditingController();
  TextEditingController BillingAppertmentEdit = TextEditingController();

  TextEditingController ShippingAddressLine1Edit = TextEditingController();
  TextEditingController ShippingAddressLine2Edit = TextEditingController();
  TextEditingController ShippingstateEdit = TextEditingController();
  TextEditingController ShippingCityEdit = TextEditingController();
  TextEditingController ShippingPostCodeEdit = TextEditingController();
  TextEditingController ShippingcountryEdit = TextEditingController();
  TextEditingController ShippingAppertmentEdit = TextEditingController();

  TextEditingController CardNumbertextEditingController =
      TextEditingController();
  TextEditingController CardValiditytextEditingController =
      TextEditingController();
  TextEditingController holderNametextEditingController =
      TextEditingController();
  TextEditingController CVVtextEditingController = TextEditingController();

  // Future<void> refreshCardJournal() async {
  //
  //   print("in funcion call");
  //
  //   final data=await SQLCardHelper.getItems();
  //   //journals=data;
  //   setState(() {
  //     Cardjournals=data;
  //     CardisLoading=false;
  //   });
  //
  //   //CardisChecked = List<bool>.filled(Cardjournals.length, false);
  //
  //   // for(int i = 0; i<isChecked.length ; i++){
  //   //   print("is value checked.............."+isChecked[i].toString());
  //   // }
  //
  //
  // }

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

  //HelpController helpController = Get.put(HelpController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      accountController.getLoginToken();

      if (accountController.loginToken.value.length > 4) {
        await accountController.getUserData();
      }
    });

    super.initState();
    // refreshJournal();
    // refreshCardJournal();
    // if (mounted) {
    //
    // }
  }

  var currentBannerPosition = 0.obs;

  AccountController accountController = Get.put(AccountController());

  ///////////////////////////////////////////////////////////////////////////////

  List<Map<String, dynamic>> journals = [];
  RxBool isLoading = true.obs;

  // Future<void> refreshJournal() async {
  //   print("in funcion call");
  //
  //   final data = await SQLWishListHelper.WishListgetItems();
  //
  //   //journals=data;
  //
  //   setState(() {
  //     journals = data;
  //     isLoading.value = false;
  //   });
  //
  //   // isChecked = List<bool>.filled(journals.length, false);
  //   //
  //   // for(int i = 0; i<isChecked.length ; i++){
  //   //   print("is value checked.............."+isChecked[i].toString());
  //   // }
  // }

  ////////////////////////////////////////////////////////////////////////////

  String CardIssuer = "Visa";

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().toString().substring(11, 16);
    time = time.replaceAll(":", ".");
    var currentTime = double.parse(time);

    // accountController.getLoginToken();

    // if (accountController.loginToken.value.length > 4) {
    //   accountController.getUserData();
    // }

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.12),
              child: customGeneralAPPBar("Account")),
          body: Obx(
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
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: SizedBox(
                          height: screenHeight * 0.090,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.075),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello",
                                      style: GoogleFonts.ruluko(
                                          fontSize: screenHeight * 0.022,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      // accountController.apiUserInfoMap?["data"]
                                      //                     ["first_name"]
                                      //                 .toString() ==
                                      //             "null" &&
                                      //         accountController
                                      //                 .apiUserInfoMap?["data"]
                                      //                     ["last_name"]
                                      //                 .toString() ==
                                      //             "null"
                                      accountController.loginToken.value
                                                  .toString()
                                                  .length <
                                              5
                                          ? "Guest user"
                                          : "${accountController.apiUserInfoMap?["data"]["first_name"]} ${accountController.apiUserInfoMap!["data"]["last_name"]}",
                                      style: GoogleFonts.ruluko(
                                          fontSize: screenHeight * 0.016,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: accountController.loginToken.value
                                            .toString()
                                            .length <=
                                        4
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.to(() => LoginView());
                                        },
                                        child: Container(
                                          height: screenHeight * 0.040,
                                          width: screenWidth * 0.25,
                                          decoration: BoxDecoration(
                                              color: AppColors.colorLightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Center(
                                            child: Text(
                                              "Sign in",
                                              style: GoogleFonts.ruluko(
                                                  fontSize:
                                                      screenHeight * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          await accountController
                                              .getUserLogout();
                                        },
                                        child: Container(
                                          height: screenHeight * 0.040,
                                          width: screenWidth * 0.25,
                                          decoration: BoxDecoration(
                                              color: AppColors.colorLightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Center(
                                            child: Text(
                                              "Sign out",
                                              style: GoogleFonts.ruluko(
                                                  fontSize:
                                                      screenHeight * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),

                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(left: 18),
                          child: Text(
                            "My Orders",
                            style: GoogleFonts.yantramanav(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      // ExpansionTile(
                      //   iconColor: AppColors.colorLightOrange,
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text("My Orders",
                      //         style: GoogleFonts.yantramanav(
                      //           color: AppColors.colorLightBlack,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: screenHeight * 0.018,
                      //         )),
                      //   ),
                      //   children: [
                      //     Obx(
                      //       () => accountController.isOrderListLoading.value ==
                      //               true
                      //           ? Center(
                      //               child: Lottie.asset(
                      //                   "assets/json/loading.json",
                      //                   fit: BoxFit.cover,
                      //                   height: screenHeight * 0.095,
                      //                   width: screenWidth * 0.095),
                      //             )
                      //           : Container(
                      //               child: ListView.builder(
                      //                   shrinkWrap: true,
                      //                   physics: ScrollPhysics(),
                      //                   itemCount: accountController
                      //                       .apiOrderListMap?["data"] //["data"]
                      //                       .length,
                      //                   itemBuilder: (context, index) {
                      //                     return orderList(
                      //                         "#${accountController.apiOrderListMap?["data"]["data"][index]["order_number"]}",
                      //                         "${accountController.apiOrderListMap?["data"]["data"][index]["created_at"]}",
                      //                         "${accountController.apiOrderListMap?["data"]["data"][index]["order_products"].length}",
                      //                         "${accountController.apiOrderListMap?["data"]["data"][index]["total_price"]}",
                      //                         "${accountController.apiOrderListMap?["data"]["data"][index]["id"]}",
                      //                         accountController
                      //                                     .apiOrderListMap?[
                      //                                 "data"]["data"][index]
                      //                             ["order_products"],
                      //                         accountController
                      //                                 .apiOrderListMap?["data"]
                      //                             ["data"][index]);
                      //                   }),
                      //             ),
                      //     )
                      //   ],
                      // ),

                      GestureDetector(
                        onTap: () async {
                          if (accountController.loginToken.value.length > 4) {
                            await accountController.getUserOrderList();
                            Get.to(() => MyOrder());
                          } else {
                            Get.snackbar(
                              "Warning",
                              "Please sign in ...",
                              colorText: Colors.white,
                              backgroundColor: Colors.orangeAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: Container(
                          height: screenHeight * 0.060,
                          color: AppColors.colorWhite,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.085),
                                child: Text("My Orders",
                                    style: GoogleFonts.yantramanav(
                                      color: AppColors.colorLightBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.019,
                                    )),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.050),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: screenHeight * 0.019,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (accountController.loginToken.value.length > 4) {
                            await accountController.getUserOrderList();
                            Get.to(() => MyReturn());
                          } else {
                            Get.snackbar(
                              "Warning",
                              "Please sign in ...",
                              colorText: Colors.white,
                              backgroundColor: Colors.orangeAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: Container(
                          height: screenHeight * 0.060,
                          color: AppColors.colorWhite,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.085),
                                child: Text("Returns",
                                    style: GoogleFonts.yantramanav(
                                      color: AppColors.colorLightBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.019,
                                    )),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.050),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: screenHeight * 0.019,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // ExpansionTile(
                      //   iconColor: AppColors.colorLightOrange,
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text("Returns",
                      //         style: GoogleFonts.gothicA1(
                      //           color: AppColors.colorLightBlack,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: screenHeight * 0.018,
                      //         )),
                      //   ),
                      //   children: [
                      //     Text("We are still working on it.....")
                      //
                      //     // Obx(() => accountController.isOrderListLoading.value==true?
                      //     // CircularProgressIndicator():
                      //     // Container(
                      //     //
                      //     //   child: ListView.builder(
                      //     //       shrinkWrap: true,
                      //     //       physics: ScrollPhysics(),
                      //     //       itemCount: accountController.apiOrderListMap?["data"]["data"].length,
                      //     //       itemBuilder: (context,index ){
                      //     //
                      //     //         return orderList("#${accountController.apiOrderListMap?["data"]["data"][index]["order_number"]}",
                      //     //             "${accountController.apiOrderListMap?["data"]["data"][index]["created_at"]}",
                      //     //             "${accountController.apiOrderListMap?["data"]["data"][index]["order_products"].length}",
                      //     //             "${accountController.apiOrderListMap?["data"]["data"][index]["total_price"]}",
                      //     //             "${accountController.apiOrderListMap?["data"]["data"][index]["id"]}",
                      //     //             accountController.apiOrderListMap?["data"]["data"][index]["order_products"],
                      //     //             accountController.apiOrderListMap?["data"]["data"][index]
                      //     //         );
                      //     //       }),
                      //     // ),)
                      //   ],
                      // ),

                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(left: 18),
                          child: Text(
                            "Personal Information",
                            style: GoogleFonts.yantramanav(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      // ExpansionTile(
                      //   iconColor: AppColors.colorLightOrange,
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text("My Details",
                      //         style: GoogleFonts.gothicA1(
                      //           color: AppColors.colorLightBlack,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: screenHeight * 0.018,
                      //         )),
                      //   ),
                      //   children: [
                      //     //Text("We are still working on it....."),
                      //
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

                      GestureDetector(
                        onTap: () {
                          Get.to(() => AccountDetail());
                        },
                        child: Container(
                          height: screenHeight * 0.060,
                          color: AppColors.colorWhite,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.085),
                                child: Text("My Details",
                                    style: GoogleFonts.yantramanav(
                                      color: AppColors.colorLightBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.019,
                                    )),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.050),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: screenHeight * 0.019,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible:
                            accountController.loginToken.value.toString() ==
                                        "null" ||
                                    accountController.loginToken.value == ""
                                ? true
                                : false,
                        child: ExpansionTile(
                          iconColor: AppColors.colorLightOrange,
                          title: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text("Change Password",
                                style: GoogleFonts.gothicA1(
                                  color: AppColors.colorLightBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.018,
                                )),
                          ),
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  // Text("We are still working on it....."),

                                  Text(
                                    "Please enter your email Address below and Click 'Reset' to change your passwor ",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextField(
                                    maxLines: 1,
                                    controller: accountController
                                        .passwordResetController,
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: GoogleFonts.raleway(),
                                        floatingLabelStyle:
                                            GoogleFonts.yantramanav(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor: Colors.white70,
                                        hintText: "Enter email",
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ElevatedButton(
                                    onPressed: () async {
                                      accountController.resetPassword();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 2),
                                      backgroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Container(
                                      width: screenWidth*0.60,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Reset",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Address Book",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping Address :",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: screenHeight * 0.017,
                                        color: AppColors.colorGrey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        //////////////////////////////////////////////////////////////

                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .colorGrey,
                                                                        width:
                                                                            2.0),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  labelStyle:
                                                                      const TextStyle(
                                                                          color:
                                                                              AppColors.colorGrey),
                                                                  prefixIcon:
                                                                      const Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    color: AppColors
                                                                        .colorLightBlack,
                                                                  ),
                                                                  hintText:
                                                                      'Your address',
                                                                  labelText:
                                                                      'Address line 1',
                                                                  border: const OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.red)),
                                                                ),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAddressLine1Edit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorLightGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .pin_drop_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your address',
                                                                        labelText:
                                                                            'Address line 2',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAddressLine2Edit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .pin_drop_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your appertment',
                                                                        labelText:
                                                                            'Appertment',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAppertmentEdit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .map_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your state',
                                                                        labelText:
                                                                            'State',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingstateEdit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    ShippingCityEdit,
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .location_city,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your city',
                                                                        labelText:
                                                                            'City',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .local_post_office,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Post code',
                                                                        labelText:
                                                                            'Post code',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    ShippingcountryEdit,
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .public,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your Country',
                                                                        labelText:
                                                                            'Country',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
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
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text(
                                                            "Cancel",
                                                            style: GoogleFonts
                                                                .yantramanav(
                                                                    color: Colors
                                                                        .red
                                                                        .shade700),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            accountController.shippingAddAddress(
                                                                ShippingAddressLine1Edit
                                                                    .text,
                                                                ShippingAddressLine2Edit
                                                                    .text,
                                                                ShippingstateEdit
                                                                    .text,
                                                                ShippingCityEdit
                                                                    .text,
                                                                ShippingPostCodeEdit
                                                                    .text,
                                                                ShippingcountryEdit
                                                                    .text);

                                                            accountController
                                                                .getUserData();

                                                            Navigator.pop(
                                                                context);
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
                                                          child: Text(
                                                            "Add Shipping Address",
                                                            style: GoogleFonts
                                                                .yantramanav(
                                                                    color: AppColors
                                                                        .colorLightBlack),
                                                          ))
                                                    ],
                                                  ));
                                        });

                                        ////////////////////////////////////////////////////////////////
                                      },
                                      child: const Icon(Icons.edit))
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("${accountController.apiUserInfoMap?["data"]["shipping_address"]["name"]} ",
                                  //   style: GoogleFonts.yantramanav(
                                  //     fontSize: 10.sp,
                                  //     fontWeight: FontWeight.w600,
                                  //     color: Colors.black
                                  //   ),
                                  // ),
                                  "${accountController.apiUserInfoMap?["data"]["shipping_address"]}" !=
                                          "null"
                                      ? "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_line_1"]}" ==
                                              "null"
                                          ? const Text("")
                                          : Text(
                                              "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_line_1"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_line_2"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["shipping_address"]["town_city"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["shipping_address"]["state"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["shipping_address"]["country"]},",
                                              //     "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_holder_firstname"]}",
                                              style: GoogleFonts.yantramanav(
                                                  fontSize:
                                                      screenHeight * 0.015,
                                                  color: AppColors.colorGrey),
                                            )
                                      : const Text(""),
                                ],
                              ),
                            ),
                          ),

                          // SizedBox(height: 20,),

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Billing Address :",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: screenHeight * 0.017,
                                        color: AppColors.colorGrey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .colorGrey,
                                                                        width:
                                                                            2.0),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: AppColors
                                                                          .colorGrey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  labelStyle:
                                                                      const TextStyle(
                                                                          color:
                                                                              AppColors.colorGrey),
                                                                  prefixIcon:
                                                                      const Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    color: AppColors
                                                                        .colorLightBlack,
                                                                  ),
                                                                  hintText:
                                                                      'Your address',
                                                                  labelText:
                                                                      'Address line 1',
                                                                  border: const OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.red)),
                                                                ),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAddressLine1Edit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorLightGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .pin_drop_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your address',
                                                                        labelText:
                                                                            'Address line 2',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAddressLine2Edit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .pin_drop_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your appertment',
                                                                        labelText:
                                                                            'Appertment',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingAppertmentEdit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .map_outlined,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your state',
                                                                        labelText:
                                                                            'State',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                                controller:
                                                                    ShippingstateEdit,
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    ShippingCityEdit,
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .location_city,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your city',
                                                                        labelText:
                                                                            'City',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .local_post_office,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Post code',
                                                                        labelText:
                                                                            'Post code',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
                                                                  return (value !=
                                                                              null &&
                                                                          value.contains(
                                                                              '@'))
                                                                      ? 'Do not use the @ char.'
                                                                      : null;
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  screenHeight *
                                                                      0.080,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    ShippingcountryEdit,
                                                                decoration:
                                                                    InputDecoration(
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide: const BorderSide(
                                                                              color: AppColors.colorGrey,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                AppColors.colorGrey,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        labelStyle: const TextStyle(
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        prefixIcon: const Icon(
                                                                            Icons
                                                                                .public,
                                                                            color: AppColors
                                                                                .colorGrey),
                                                                        hintText:
                                                                            'Your Country',
                                                                        labelText:
                                                                            'Country',
                                                                        border: const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.red))),
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  // This optional block of code can be used to run
                                                                  // code when the user saves the form.
                                                                },
                                                                validator:
                                                                    (String?
                                                                        value) {
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
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text(
                                                            "Cancel",
                                                            style: GoogleFonts
                                                                .yantramanav(
                                                                    color: Colors
                                                                        .red
                                                                        .shade700),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            accountController.billingAddAddress(
                                                                BillingAddressLine1Edit
                                                                    .text,
                                                                BillingAddressLine2Edit
                                                                    .text,
                                                                BillingstateEdit
                                                                    .text,
                                                                BillingCityEdit
                                                                    .text,
                                                                BillingPostCodeEdit
                                                                    .text,
                                                                BillingcountryEdit
                                                                    .text);

                                                            accountController
                                                                .getUserData();

                                                            Navigator.pop(
                                                                context);

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
                                                          child: Text(
                                                            "Add Billing Address",
                                                            style: GoogleFonts
                                                                .yantramanav(
                                                                    color: AppColors
                                                                        .colorLightBlack),
                                                          ))
                                                    ],
                                                  ));
                                        });
                                      },
                                      child: const Icon(Icons.edit))
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("${accountController.apiUserInfoMap?["data"]["billing_address"]["name"]} ",
                                  //   style: GoogleFonts.yantramanav(
                                  //       fontSize: 10.sp,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Colors.black
                                  //   ),
                                  // ),
                                  "${accountController.apiUserInfoMap?["data"]["billing_address"]}" !=
                                          "null"
                                      ? "${accountController.apiUserInfoMap?["data"]["billing_address"]["address_line_1"]}" ==
                                              "null"
                                          ? const Text("")
                                          : Text(
                                              "${accountController.apiUserInfoMap?["data"]["billing_address"]["address_line_1"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["billing_address"]["address_line_2"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["billing_address"]["town_city"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["billing_address"]["state"]}, "
                                              "${accountController.apiUserInfoMap?["data"]["billing_address"]["country"]},",
                                              //     "${accountController.apiUserInfoMap?["data"]["shipping_address"]["address_holder_firstname"]}"
                                              style: GoogleFonts.yantramanav(
                                                  fontSize:
                                                      screenHeight * 0.016,
                                                  color: AppColors.colorGrey),
                                            )
                                      : const Text(""),
                                ],
                              ),
                            ),
                          )

                          //
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
                          //             ListView.builder(
                          //                 shrinkWrap: true,
                          //                 itemCount: accountController
                          //                     .apiUserInfoMap!["data"]
                          //                         ["addresses"]
                          //                     .length,
                          //                 itemBuilder: (context, index) {
                          //                   return Padding(
                          //                     padding: const EdgeInsets.all(8.0),
                          //                     child: Row(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                       children: [
                          //                         Container(
                          //                           height: screenHeight * 0.040,
                          //                           width: screenWidth * 0.25,
                          //                           child: Row(
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceAround,
                          //                             children: [
                          //                               Center(
                          //                                   child: Text(
                          //                                 index == 0
                          //                                     ? "Office"
                          //                                     : "Home",
                          //                                 style: GoogleFonts.gothicA1(
                          //                                     color: AppColors
                          //                                         .colorLightBlack,
                          //                                     fontWeight:
                          //                                         FontWeight
                          //                                             .bold),
                          //                               )),
                          //                             ],
                          //                           ),
                          //                           decoration: BoxDecoration(
                          //                               borderRadius:
                          //                                   BorderRadius.circular(
                          //                                       10),
                          //                               border: Border.all(
                          //                                 color: AppColors
                          //                                     .colorLightOrange, // Set the color of the border
                          //                                 width:
                          //                                     1.0, // Set the width of the border
                          //                               ),
                          //                               color: Colors.white),
                          //                         ),
                          //                         Padding(
                          //                           padding: EdgeInsets.only(
                          //                             left: screenWidth * 0.020,
                          //                           ),
                          //                           child: Container(
                          //                             height:
                          //                                 screenHeight * 0.040,
                          //                             width: screenWidth * 0.25,
                          //                             child: Center(
                          //                                 child: Text(
                          //                               "Default",
                          //                               style:
                          //                                   GoogleFonts.poppins(
                          //                                       color:
                          //                                           Colors.white),
                          //                             )),
                          //                             decoration: BoxDecoration(
                          //                                 borderRadius:
                          //                                     BorderRadius
                          //                                         .circular(10),
                          //                                 color: AppColors
                          //                                     .colorLightOrange),
                          //                           ),
                          //                         ),
                          //                         Spacer(),
                          //                         Padding(
                          //                           padding: EdgeInsets.only(
                          //                               right:
                          //                                   screenWidth * 0.020),
                          //                           child: Icon(
                          //                             Icons.edit,
                          //                             color: AppColors.colorGrey,
                          //                             size: screenHeight * 0.020,
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   );
                          //                 }),
                          //           ],
                          //         ),
                          //       );
                          //     }),
                          //
                          // InkWell(
                          //   onTap: () {
                          //
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
                          // SizedBox(
                          //   height: screenHeight * 0.020,
                          // ),
                          //
                        ],
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Payment Methods",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: [
                          // Text("We are still working on it....."),

                          ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Cardjournals.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // SQLCardHelper.deleteItem(int.parse("${Cardjournals[index]["id"]}"));
                                    //refreshCardJournal();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Credit card or Debit card",
                                              //"${Cardjournals[index]["cardIssuer"]}",//cardIssuer
                                              style: GoogleFonts.gothicA1(
                                                color:
                                                    AppColors.colorLightBlack,
                                                fontSize: screenHeight * 0.016,
                                              ),
                                            ),
                                            Text(
                                              "${Cardjournals[index]["cardHolderName"]}",
                                              style: GoogleFonts.gothicA1(
                                                color:
                                                    AppColors.colorLightBlack,
                                                fontSize: screenHeight * 0.013,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Card no : ${Cardjournals[index]["cardNumber"]}",
                                                  style: GoogleFonts.gothicA1(
                                                    color: AppColors
                                                        .colorLightBlack,
                                                    fontSize:
                                                        screenHeight * 0.013,
                                                  ),
                                                ),
                                                // Text(
                                                //   " 2119 X X X X X X 998 ",
                                                //   style: GoogleFonts.gothicA1(
                                                //     color: AppColors.colorLightBlack,
                                                //     fontSize: screenHeight * 0.013,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Exp : ${Cardjournals[index]["validity"]}",
                                                  style: GoogleFonts.gothicA1(
                                                    color: AppColors
                                                        .colorLightBlack,
                                                    fontSize:
                                                        screenHeight * 0.013,
                                                  ),
                                                ),
                                                // Text(
                                                //   "  05/25",
                                                //   style: GoogleFonts.gothicA1(
                                                //     color: AppColors.colorLightBlack,
                                                //     fontSize: screenHeight * 0.013,
                                                //   ),
                                                // ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth * 0.020),
                                          child: SvgPicture.asset(
                                            "assets/images/visa_card.svg",
                                            height: screenHeight * 0.030,
                                            width: screenWidth * 0.070,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: screenWidth * 0.020),
                                          child: Icon(
                                            Icons.edit,
                                            color: AppColors.colorGrey,
                                            size: screenHeight * 0.022,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // SQLCardHelper.deleteItem(int.parse(
                                            //     "${Cardjournals[index]["id"]}"));

                                            // refreshCardJournal();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: screenWidth * 0.020),
                                            child: Icon(
                                              Icons.delete_outlined,
                                              color: AppColors.colorGrey,
                                              size: screenHeight * 0.022,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  // Container(
                                  //   color: Colors.white,
                                  //   margin: EdgeInsets.all(10.0),
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       customPaymentCard(int.parse("${Cardjournals[index]["id"]}")),
                                  //     ],
                                  //   ),
                                  // ),
                                );
                              }),

                          InkWell(
                            onTap: () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextField(
                                                    maxLines: 1,
                                                    controller:
                                                        CardNumbertextEditingController,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Card Number",
                                                        labelStyle: GoogleFonts
                                                            .raleway(),
                                                        floatingLabelStyle:
                                                            GoogleFonts
                                                                .yantramanav(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        hintText:
                                                            "Enter Card Number",
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width:
                                                                        1.0))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    controller:
                                                        CardValiditytextEditingController,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Expire Month",
                                                        labelStyle: GoogleFonts
                                                            .raleway(),
                                                        floatingLabelStyle:
                                                            GoogleFonts
                                                                .yantramanav(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        hintText: "MM/YY",
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width:
                                                                        1.0))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    controller:
                                                        holderNametextEditingController,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Card Holder Name",
                                                        labelStyle: GoogleFonts
                                                            .raleway(),
                                                        floatingLabelStyle:
                                                            GoogleFonts
                                                                .yantramanav(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        hintText:
                                                            "Enter Card Holder Name",
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width:
                                                                        1.0))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    controller:
                                                        CVVtextEditingController,
                                                    decoration: InputDecoration(
                                                        labelText: "CVV",
                                                        labelStyle: GoogleFonts
                                                            .raleway(),
                                                        floatingLabelStyle:
                                                            GoogleFonts
                                                                .yantramanav(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        hintText: "Enter CVV",
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width:
                                                                        1.0))),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenHeight * 0.020,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth / 2 + 20,
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        //PasswordReset(passwordResetController.text,context);

                                                        //SQLCardHelper.createItem(title, Price, sizeID, ProductID, colorID, quantity, ImageLink)
                                                        // SQLCardHelper.createItem(
                                                        //     CardNumbertextEditingController
                                                        //         .text,
                                                        //     holderNametextEditingController
                                                        //         .text,
                                                        //     CardValiditytextEditingController
                                                        //         .text,
                                                        //     CVVtextEditingController
                                                        //         .text,
                                                        //     "${CardIssuer}");
                                                        //
                                                        // refreshCardJournal();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20,
                                                                vertical: 2),
                                                        backgroundColor:
                                                            AppColors
                                                                .colorLightGrey,
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      child: const Text(
                                                        "Add Card",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .colorLightBlack,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // actions: [
                                          //   ElevatedButton(
                                          //     onPressed: () async {
                                          //       //PasswordReset(passwordResetController.text,context);
                                          //       scanCard();
                                          //     },
                                          //     style: ElevatedButton.styleFrom(
                                          //       padding: EdgeInsets.symmetric(
                                          //           horizontal: 20,
                                          //           vertical: 2),
                                          //       backgroundColor: Color.fromARGB(
                                          //           255, 238, 98, 49),
                                          //       shape: StadiumBorder(),
                                          //     ),
                                          //     child: Text(
                                          //       "Scan Card",
                                          //       style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18,
                                          //           fontWeight:
                                          //               FontWeight.bold),
                                          //     ),
                                          //   ),
                                          //   ElevatedButton(
                                          //     onPressed: () async {
                                          //       //PasswordReset(passwordResetController.text,context);
                                          //
                                          //       //SQLCardHelper.createItem(title, Price, sizeID, ProductID, colorID, quantity, ImageLink)
                                          //       SQLCardHelper.createItem(
                                          //           CardNumbertextEditingController
                                          //               .text,
                                          //           holderNametextEditingController
                                          //               .text,
                                          //           CardValiditytextEditingController
                                          //               .text,
                                          //           CVVtextEditingController
                                          //               .text,
                                          //           "${CardIssuer}");
                                          //
                                          //       refreshCardJournal();
                                          //     },
                                          //     style: ElevatedButton.styleFrom(
                                          //       padding: EdgeInsets.symmetric(
                                          //           horizontal: 20,
                                          //           vertical: 2),
                                          //       backgroundColor: Color.fromARGB(
                                          //           255, 238, 98, 49),
                                          //       shape: StadiumBorder(),
                                          //     ),
                                          //     child: Text(
                                          //       "Add Card",
                                          //       style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18,
                                          //           fontWeight:
                                          //               FontWeight.bold),
                                          //     ),
                                          //   ),
                                          // ],
                                        ));
                              });
                            },
                            child: Container(
                              width: screenWidth,
                              height: screenHeight * 0.060,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
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
                                  "Add new +",
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
                          )
                        ],
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Contact Preferences",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: const [
                          Text("We are still working on it.....")
                        ],
                      ),

                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(left: 18),
                          child: Text(
                            "Help Center",
                            style: GoogleFonts.yantramanav(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Delivery",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: [
                          Obx(() => accountController.isLoading.value == true
                              ? Center(
                                  child: Lottie.asset(
                                      "assets/json/loading.json",
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.095,
                                      width: screenWidth * 0.095))
                              : Html(
                                  shrinkWrap: true,
                                  data:
                                      "${accountController.apiDeliveryPolicyMap!["data"]["description"]}"))
                        ],
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Returns & Refunds",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: [
                          Obx(() => accountController.isLoading.value == true
                              ? Center(
                                  child: Lottie.asset(
                                      "assets/json/loading.json",
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.095,
                                      width: screenWidth * 0.095))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Html(
                                      data:
                                          "${accountController.apiReturnPolicyMap!["data"]["description"]}"),
                                ))
                        ],
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Order Issue",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: const [
                          Text("We are still working on it.....")
                        ],
                      ),

                      // ExpansionTile(
                      //   iconColor: AppColors.colorLightOrange,
                      //   title: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 18),
                      //     child: Text("Payment",
                      //         style: GoogleFonts.gothicA1(
                      //           color: AppColors.colorLightBlack,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: screenHeight * 0.018,
                      //         )),
                      //   ),
                      //   children: [Text("We are still working on it.....")],
                      // ),

                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PaymentHistory());
                        },
                        child: Container(
                          height: screenHeight * 0.060,
                          color: AppColors.colorWhite,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.085),
                                child: Text("Payment",
                                    style: GoogleFonts.yantramanav(
                                      color: AppColors.colorLightBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.019,
                                    )),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.050),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: screenHeight * 0.019,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      ExpansionTile(
                        iconColor: AppColors.colorLightOrange,
                        title: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("Contact customer care",
                              style: GoogleFonts.gothicA1(
                                color: AppColors.colorLightBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              )),
                        ),
                        children: [
                          Obx(() => accountController.isLoading.value == true
                              ? Center(
                                  child: Lottie.asset(
                                      "assets/json/loading.json",
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.095,
                                      width: screenWidth * 0.095))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Html(
                                      data:
                                          "${accountController.apiContactMap!["data"]["description"]}"),
                                ))
                        ],
                      ),

                      SizedBox(
                        height: screenHeight * 0.020,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.020),
                                  child: Text(
                                    "My Offers",
                                    style: GoogleFonts.ruluko(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.022,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.020),
                                  child: Text(
                                    "Currently You don’t have any special offer!",
                                    style: GoogleFonts.gothicA1(
                                      color: AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.018,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.020),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'But you can browse other ',
                                      style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontSize: screenHeight * 0.018,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " offer(s)",
                                          style: GoogleFonts.gothicA1(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.colorLightBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "and",
                                  maxLines: 2,
                                  style: GoogleFonts.gothicA1(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.018,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.020),
                              child: Text(
                                "enjoy shopping",
                                maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.018,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const OfferView());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.020),
                                    child: Text(
                                      "Browse offers",
                                      style: GoogleFonts.gothicA1(
                                        color: AppColors.colorLightBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                          ],
                        ),
                      ),

                      // Padding(
                      //   padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      //   child: SizedBox(
                      //     width: screenWidth,
                      //     child: const Divider(
                      //       color: AppColors.colorGrey,
                      //       thickness: 1.0,
                      //     ),
                      //   ),
                      // ),
                      //
                      Container(
                        height: screenHeight * 0.060,
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.colorGrey.withOpacity(0.2),
                              spreadRadius: 10,
                              blurRadius: 9,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.020),
                              child: Text(
                                "Need support ? ",
                                style: GoogleFonts.ruluko(
                                    fontSize: screenHeight * 0.019,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.mail),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.message_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )

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

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: ScrollPhysics(),
                      //     itemCount: helpController.apiFAQListMap?['banner'].length,
                      //     itemBuilder: (context, index) {
                      //       return  ExpansionTile(
                      //         title: Text(
                      //           "${helpController.apiFAQListMap?['banner'][index]["questions"]}",
                      //           style: GoogleFonts.yantramanav(
                      //               color: AppColors.colorLightBlack,
                      //               fontSize: screenHeight * 0.018,
                      //               fontWeight: FontWeight.w500),
                      //         ),
                      //
                      //
                      //         children: [
                      //
                      //           Container(
                      //
                      //             child: Html(
                      //               data: "${helpController.apiFAQListMap?['banner'][index]["answers"]}",
                      //               // style: GoogleFonts.yantramanav(
                      //               //     color: AppColors.colorLightBlack,
                      //               //     fontSize: screenHeight * 0.018,
                      //               //     fontWeight: FontWeight.w500),
                      //             ),
                      //             margin: EdgeInsets.symmetric(horizontal: 20),
                      //           ),
                      //
                      //         ],
                      //
                      //       );
                      //
                      //
                      //     }),
                    ],
                  )

                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //     Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               currentTime <= 12.0
                    //                   ? Text(
                    //                       "Good Morning",
                    //                       style: GoogleFonts.ruluko(
                    //                           color: AppColors.colorLightBlack,
                    //                           fontSize: screenHeight * 0.020),
                    //                     )
                    //                   : currentTime <= 16.0
                    //                       ? Text(
                    //                           "Good Noon",
                    //                           style: GoogleFonts.ruluko(
                    //                               color: AppColors.colorLightBlack,
                    //                               fontSize: screenHeight * 0.020),
                    //                         )
                    //                       : currentTime <= 18.0
                    //                           ? Text(
                    //                               "Good Evening",
                    //                               style: GoogleFonts.ruluko(
                    //                                   color: AppColors.colorLightBlack,
                    //                                   fontSize: screenHeight * 0.020),
                    //                             )
                    //                           : Text(
                    //                               "Good Night",
                    //                               style: GoogleFonts.ruluko(
                    //                                   color: AppColors.colorLightBlack,
                    //                                   fontSize: screenHeight * 0.020),
                    //                             ),
                    //               Text(
                    //                 "Mr. Tanveer",
                    //                 style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorLightBlack,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //         const Spacer(),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //
                    //
                    //             Obx(() =>
                    //             //accountController.isWishListLoading.value==true
                    //             isLoading.value==true
                    //                 ?Center(
                    //               child: Lottie.asset("assets/json/loading.json",
                    //                   fit: BoxFit.cover,
                    //                   height: screenHeight * 0.095,
                    //                   width: screenWidth * 0.095),
                    //             ) :Text(
                    //               //"${accountController.apiWishListMap?['data'].length}",
                    //               "${journals.length}",
                    //               style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorLightBlack,
                    //                   fontSize: screenHeight * 0.028),
                    //             ),
                    //             ),
                    //
                    //
                    //
                    //
                    //
                    //             InkWell(
                    //               onTap: (){
                    //                 Get.to(() => MyWishList());
                    //               },
                    //               child: Row(
                    //                 children: [
                    //
                    //
                    //                   SvgPicture.asset(
                    //                     "assets/images/wishlist_fav.svg",
                    //                     height: screenHeight * 0.020,
                    //                     width: screenWidth * 0.050,
                    //                     fit: BoxFit.fill,
                    //                   ),
                    //                   SizedBox(
                    //                     width: screenWidth * 0.009,
                    //                   ),
                    //                   Text(
                    //                     "Wishlist",
                    //                     style: GoogleFonts.ruluko(
                    //                       color: AppColors.colorLightBlack,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             )
                    //
                    //
                    //
                    //
                    //
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           width: screenWidth * 0.025,
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "12",
                    //               style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorLightBlack,
                    //                   fontSize: screenHeight * 0.028),
                    //             ),
                    //             Row(
                    //               children: [
                    //                 SvgPicture.asset(
                    //                   "assets/images/reputation_icon.svg",
                    //                   height: screenHeight * 0.020,
                    //                   width: screenWidth * 0.050,
                    //                   fit: BoxFit.fill,
                    //                 ),
                    //                 SizedBox(
                    //                   width: screenWidth * 0.009,
                    //                 ),
                    //                 Text(
                    //                   "Reputation",
                    //                   style: GoogleFonts.ruluko(
                    //                     color: AppColors.colorLightBlack,
                    //                   ),
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           width: screenWidth * 0.025,
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "09",
                    //               style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorLightBlack,
                    //                   fontSize: screenHeight * 0.028),
                    //             ),
                    //             Row(
                    //               children: [
                    //                 SvgPicture.asset(
                    //                   "assets/images/voucher_icon.svg",
                    //                   height: screenHeight * 0.020,
                    //                   width: screenWidth * 0.050,
                    //                   fit: BoxFit.fill,
                    //                 ),
                    //                 SizedBox(
                    //                   width: screenWidth * 0.009,
                    //                 ),
                    //                 Text(
                    //                   "Voucher",
                    //                   style: GoogleFonts.ruluko(
                    //                     color: AppColors.colorLightBlack,
                    //                   ),
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           width: screenWidth * 0.009,
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //     Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //           child: Text(
                    //             "My orders",
                    //             style: GoogleFonts.yantramanav(
                    //                 color: AppColors.colorLightBlack,
                    //                 fontSize: screenHeight * 0.030),
                    //           ),
                    //         ),
                    //         const Spacer(),
                    //         GestureDetector(
                    //           onTap: () {
                    //             Get.to(() => MyOrder());
                    //           },
                    //           child: Padding(
                    //             padding: EdgeInsets.only(right: screenWidth * 0.025),
                    //             child: Text(
                    //               "view all",
                    //               style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorLightBlack,
                    //                   fontSize: screenHeight * 0.020),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //
                    //
                    //     ///////////////////////////////////////////////////////////////////
                    //
                    //
                    //     // Padding(
                    //     //   padding:  EdgeInsets.symmetric(horizontal: 10),
                    //     //   child: Column(
                    //     //     children: [
                    //     //
                    //     //       Row(
                    //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     //         children: [
                    //     //
                    //     //
                    //     //           ElevatedButton(
                    //     //               onPressed: (){
                    //     //
                    //     //               },
                    //     //               style: ElevatedButton.styleFrom(
                    //     //                 primary: Colors.grey.shade100, // Background color
                    //     //               ),
                    //     //               child: Container(
                    //     //                 alignment: Alignment.center,
                    //     //                 width: screenWidth*0.42,
                    //     //                   child: Center(
                    //     //                     child: Row(
                    //     //                       mainAxisAlignment: MainAxisAlignment.center,
                    //     //                       children: [
                    //     //
                    //     //                         Image.asset("assets/images/iconamoon_box-thin.png",
                    //     //                           height: 16,
                    //     //                           width: 16,
                    //     //                         ),
                    //     //                         // Icon(Icons.package_2,
                    //     //                         //   color: Colors.black,
                    //     //                         // ),
                    //     //
                    //     //                         SizedBox(width: 10,),
                    //     //
                    //     //                         Text("To Ship",
                    //     //
                    //     //                           style: GoogleFonts.openSans(
                    //     //                               color: Colors.black
                    //     //                           ),
                    //     //
                    //     //                         ),
                    //     //                       ],
                    //     //                     ),
                    //     //                   ))
                    //     //           ),
                    //     //
                    //     //
                    //     //
                    //     //           ElevatedButton(
                    //     //               onPressed: (){
                    //     //
                    //     //               },
                    //     //               style: ElevatedButton.styleFrom(
                    //     //                 primary: Colors.grey.shade100, // Background color
                    //     //               ),
                    //     //               child: Container(
                    //     //                 alignment: Alignment.center,
                    //     //                   width: screenWidth*0.42,
                    //     //                   child: Center(
                    //     //                     child: Row(
                    //     //                       mainAxisAlignment: MainAxisAlignment.center,
                    //     //                       children: [
                    //     //
                    //     //                         Icon(Icons.local_shipping_outlined,
                    //     //                           color: Colors.black,
                    //     //                         ),
                    //     //
                    //     //                         SizedBox(width: 10,),
                    //     //
                    //     //                         Text("To Receive",
                    //     //                           style: GoogleFonts.openSans(
                    //     //                               color: Colors.black
                    //     //                           ),
                    //     //                         ),
                    //     //                       ],
                    //     //                     ),
                    //     //                   )
                    //     //               )
                    //     //           )
                    //     //
                    //     //
                    //     //
                    //     //
                    //     //
                    //     //         ],
                    //     //       ),
                    //     //
                    //     //
                    //     //
                    //     //       Row(
                    //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     //         children: [
                    //     //
                    //     //           ElevatedButton(
                    //     //               onPressed: (){
                    //     //
                    //     //               },
                    //     //               style: ElevatedButton.styleFrom(
                    //     //                 primary: Colors.grey.shade100, // Background color
                    //     //               ),
                    //     //               child: Container(
                    //     //                   alignment: Alignment.center,
                    //     //                   width: screenWidth*0.42,
                    //     //                   child: Center(
                    //     //                     child: Row(
                    //     //                       mainAxisAlignment: MainAxisAlignment.center,
                    //     //                       children: [
                    //     //                         Image.asset("assets/images/tabler_truck-return.png",
                    //     //                           height: 18,
                    //     //                           width: 18,
                    //     //                         ),
                    //     //
                    //     //                         SizedBox(width: 10,),
                    //     //
                    //     //                         Text("My Returns",
                    //     //                           style: GoogleFonts.openSans(
                    //     //                             color: Colors.red
                    //     //                           ),
                    //     //                         ),
                    //     //                       ],
                    //     //                     ),
                    //     //                   )
                    //     //               )
                    //     //           ),
                    //     //
                    //     //           ElevatedButton(
                    //     //               onPressed: (){
                    //     //
                    //     //               },
                    //     //               style: ElevatedButton.styleFrom(
                    //     //                 primary: Colors.grey.shade100, // Background color
                    //     //               ),
                    //     //               child: Container(
                    //     //                   alignment: Alignment.center,
                    //     //                   width: screenWidth*0.42,
                    //     //                   child: Center(
                    //     //                     child: Row(
                    //     //                       mainAxisAlignment: MainAxisAlignment.center,
                    //     //                       children: [
                    //     //
                    //     //                         Image.asset("assets/images/quill_send-cancelled.png",
                    //     //                           height: 18,
                    //     //                           width: 18,
                    //     //                         ),
                    //     //
                    //     //                         SizedBox(width: 10,),
                    //     //
                    //     //                         Text("My Cancellation",
                    //     //
                    //     //                               style: GoogleFonts.openSans(
                    //     //                                   color: Colors.red
                    //     //                               )),
                    //     //                       ],
                    //     //                     ),
                    //     //                   ),
                    //     //
                    //     //               )
                    //     //           )
                    //     //
                    //     //
                    //     //
                    //     //         ],
                    //     //       )
                    //     //
                    //     //     ],
                    //     //   ),
                    //     // ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //     ///////////////////////////////////////////////////////////////////
                    //
                    //
                    //
                    //     ListView(
                    //         shrinkWrap: true,
                    //         physics: ScrollPhysics(),
                    //          children: [
                    //
                    //
                    //            Container(
                    //              width: screenWidth,
                    //              height: screenHeight * 0.080,
                    //              color: Colors.white,
                    //              margin: EdgeInsets.all(3.0),
                    //              child: Row(
                    //                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                children: [
                    //                  Row(
                    //                    children: [
                    //                      const Icon(Icons.inventory_2),
                    //                      SizedBox(
                    //                        width: screenWidth * 0.015,
                    //                      ),
                    //                      Text(
                    //                        "To ship",
                    //                        style: GoogleFonts.ruluko(
                    //                            color: AppColors.colorLightBlack,
                    //                            fontSize: screenHeight * 0.020),
                    //                      ),
                    //                    ],
                    //                  ),
                    //                  Row(
                    //                    children: [
                    //                      const Icon(Icons.local_shipping_outlined),
                    //                      SizedBox(
                    //                        width: screenWidth * 0.015,
                    //                      ),
                    //                      Text(
                    //                        "To Receive",
                    //                        style: GoogleFonts.ruluko(
                    //                            color: AppColors.colorLightBlack,
                    //                            fontSize: screenHeight * 0.020),
                    //                      ),
                    //                    ],
                    //                  )
                    //                ],
                    //              ),
                    //            ),
                    //
                    //            Container(
                    //              width: screenWidth,
                    //              height: screenHeight * 0.080,
                    //              color: Colors.white,
                    //              margin: EdgeInsets.all(3.0),
                    //              child: Row(
                    //                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                children: [
                    //                  Row(
                    //                    children: [
                    //
                    //                      Image.asset("assets/images/truck-return.png"),
                    //                      // const Icon(Icons.local_shipping_outlined),
                    //                      SizedBox(
                    //                        width: screenWidth * 0.015,
                    //                      ),
                    //                      Text(
                    //                        "My Returns",
                    //                        style: GoogleFonts.ruluko(
                    //                            color: AppColors.colorLightBlack,
                    //                            fontSize: screenHeight * 0.020),
                    //                      ),
                    //                    ],
                    //                  ),
                    //                  Row(
                    //                    children: [
                    //                      const Icon(Icons.cancel_schedule_send),
                    //                      SizedBox(
                    //                        width: screenWidth * 0.015,
                    //                      ),
                    //                      Text(
                    //                        "My Cancellation",
                    //                        style: GoogleFonts.ruluko(
                    //                            color: AppColors.colorLightBlack,
                    //                            fontSize: screenHeight * 0.020),
                    //                      ),
                    //                    ],
                    //                  )
                    //                ],
                    //              ),
                    //            )
                    //
                    //          ],
                    //     ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //     Container(
                    //       width: screenWidth,
                    //       color: AppColors.colorLightOrange,
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           getAccountBannerSlider(),
                    //           SizedBox(
                    //             height: screenHeight * 0.010,
                    //           ),
                    //           buildAccountBannerDot(2),
                    //           SizedBox(
                    //             height: screenHeight * 0.020,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //     Padding(
                    //       padding: const EdgeInsets.all(10.0),
                    //       child:  ExpansionTile(
                    //         iconColor: Color.fromARGB(255,238, 98, 49),
                    //         title: Text(
                    //           "Recent",
                    //           style: GoogleFonts.ruluko(
                    //               color: AppColors.colorLightBlack,
                    //               fontSize: screenHeight * 0.022,
                    //               fontWeight: FontWeight.w600),
                    //         ),
                    //
                    //         children: [
                    //
                    //
                    //
                    //           Obx(() => accountController.isOrderListLoading.value==true?
                    //           CircularProgressIndicator():
                    //           Container(
                    //
                    //             child: ListView.builder(
                    //                 shrinkWrap: true,
                    //                 physics: ScrollPhysics(),
                    //                 itemCount: accountController.apiOrderListMap?["data"]["data"].length,
                    //                 itemBuilder: (context,index ){
                    //
                    //                   return orderList("#${accountController.apiOrderListMap?["data"]["data"][index]["order_number"]}",
                    //                       "${accountController.apiOrderListMap?["data"]["data"][index]["created_at"]}",
                    //                       "${accountController.apiOrderListMap?["data"]["data"][index]["order_products"].length}",
                    //                       "${accountController.apiOrderListMap?["data"]["data"][index]["total_price"]}",
                    //                       "${accountController.apiOrderListMap?["data"]["data"][index]["id"]}",
                    //                       accountController.apiOrderListMap?["data"]["data"][index]["order_products"],
                    //                       accountController.apiOrderListMap?["data"]["data"][index]
                    //                   );
                    //                 }),
                    //           ),
                    //           )
                    //
                    //
                    //
                    //         ],
                    //
                    //
                    //
                    //       ),
                    //       // ListView.builder(
                    //       //   shrinkWrap: true,
                    //       //   itemCount: 1,
                    //       //   itemBuilder: (context, index) {
                    //       //     final item = _faq[index];
                    //       //     return ExpansionPanelList(
                    //       //       dividerColor: Colors.transparent,
                    //       //       expandIconColor: AppColors.colorGrey,
                    //       //       elevation: 0,
                    //       //       expandedHeaderPadding: EdgeInsets.zero,
                    //       //       expansionCallback: (panelIndex, isExpanded) {
                    //       //         setState(() {
                    //       //           item.isExpanded = !isExpanded;
                    //       //         });
                    //       //       },
                    //       //       children: [
                    //       //         ExpansionPanel(
                    //       //           headerBuilder: (context, isExpanded) {
                    //       //             return ListTile(
                    //       //               title: Padding(
                    //       //                 padding:
                    //       //                     EdgeInsets.only(left: screenWidth * 0.030),
                    //       //                 child: Text(
                    //       //                   "Recent",
                    //       //                   style: GoogleFonts.ruluko(
                    //       //                       color: AppColors.colorLightBlack,
                    //       //                       fontSize: screenHeight * 0.022,
                    //       //                       fontWeight: FontWeight.w600),
                    //       //                 ),
                    //       //               ),
                    //       //             );
                    //       //           },
                    //       //           body: orderList(
                    //       //             "#083838",
                    //       //             "23 May 2023 13:22",
                    //       //             "",
                    //       //             "",
                    //       //             ["",""],
                    //       //             {"":""}
                    //       //
                    //       //           ),
                    //       //           isExpanded: item.isExpanded,
                    //       //           backgroundColor: Colors.white,
                    //       //         ),
                    //       //
                    //       //
                    //       //
                    //       //
                    //       //
                    //       //
                    //       //       ],
                    //       //     );
                    //       //   },
                    //       // ),
                    //     ),
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //           child: Text(
                    //             "My Services",
                    //             style: GoogleFonts.ruluko(
                    //                 color: AppColors.colorLightBlack,
                    //                 fontSize: screenHeight * 0.022,
                    //                 fontWeight: FontWeight.w600),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.only(top: screenHeight * 0.020),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(
                    //                 Icons.message_outlined,
                    //                 color: AppColors.colorGrey,
                    //               ),
                    //               Text(
                    //                 "Message",
                    //                 style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorGrey,
                    //                   fontSize: screenHeight * 0.016,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //
                    //
                    //
                    //           InkWell(
                    //             onTap: (){
                    //               Get.to(() => AccountSetting());
                    //             },
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 const Icon(
                    //                   Icons.payment_outlined,
                    //                   color: AppColors.colorGrey,
                    //                 ),
                    //                 Text(
                    //                   "Payment Option",
                    //                   style: GoogleFonts.ruluko(
                    //                     color: AppColors.colorGrey,
                    //                     fontSize: screenHeight * 0.016,
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //
                    //
                    //
                    //
                    //
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               const Icon(
                    //                 Icons.help_outline,
                    //                 color: AppColors.colorGrey,
                    //               ),
                    //               Text(
                    //                 "Help Center",
                    //                 style: GoogleFonts.ruluko(
                    //                   color: AppColors.colorGrey,
                    //                   fontSize: screenHeight * 0.016,
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //
                    //
                    //
                    //           InkWell(
                    //             onTap: (){
                    //               Get.to(() => AccountSetting());
                    //             },
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 const Icon(
                    //                   Icons.info_outline,
                    //                   color: AppColors.colorGrey,
                    //                 ),
                    //                 Text(
                    //                   "Personal Info",
                    //                   style: GoogleFonts.ruluko(
                    //                     color: AppColors.colorGrey,
                    //                     fontSize: screenHeight * 0.016,
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           )
                    //
                    //
                    //
                    //
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //           child: Text(
                    //             "My Offers",
                    //             style: GoogleFonts.ruluko(
                    //                 color: AppColors.colorLightBlack,
                    //                 fontSize: screenHeight * 0.022,
                    //                 fontWeight: FontWeight.w600),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //           child: Text(
                    //             "Currently You don’t have any special offer!",
                    //             style: GoogleFonts.gothicA1(
                    //               color: AppColors.colorLightBlack,
                    //               fontSize: screenHeight * 0.018,
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //           child: RichText(
                    //             text: TextSpan(
                    //               text: 'But you can browse other ',
                    //               style: GoogleFonts.gothicA1(
                    //                 color: AppColors.colorLightBlack,
                    //                 fontSize: screenHeight * 0.018,
                    //               ),
                    //               children: <TextSpan>[
                    //                 TextSpan(
                    //                   text: " offer(s)",
                    //                   style: GoogleFonts.gothicA1(
                    //                     fontWeight: FontWeight.bold,
                    //                     color: AppColors.colorLightOrange,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         Text(
                    //           "and enjoy shopping",
                    //           style: GoogleFonts.gothicA1(
                    //             color: AppColors.colorLightBlack,
                    //             fontSize: screenHeight * 0.018,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Get.to(() => OfferView());
                    //       },
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.only(left: screenWidth * 0.020),
                    //             child: Text(
                    //               "Browse offers",
                    //               style: GoogleFonts.gothicA1(
                    //                 color: AppColors.colorLightOrange,
                    //                 fontSize: screenHeight * 0.018,
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       height: screenHeight * 0.020,
                    //     ),
                    //   ],
                    // ),

                    ),
          )),
    );
  }

  // Widget getAccountBannerSlider() {
  //   return CarouselSlider.builder(
  //       itemCount: 2,
  //       itemBuilder: (context, index, realIndex) {
  //         return buildBannerImage(index);
  //       },
  //       options: CarouselOptions(
  //         aspectRatio: 6 / 2.0,
  //         viewportFraction: 1.0,
  //         autoPlay: true,
  //         enlargeCenterPage: true,
  //         enableInfiniteScroll: true,
  //         onPageChanged: (index, realReason) {
  //           currentBannerPosition.value = index;
  //         },
  //       ));
  // }
  //
  // Widget buildBannerImage(int index) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               "Trace Your Parcel",
  //               style: GoogleFonts.ruluko(
  //                 color: Colors.white,
  //                 fontSize: screenHeight * 0.022,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.only(left: screenWidth * 0.040),
  //             child: Image.asset(
  //               "assets/images/placeholder_image.png",
  //               height: screenHeight * 0.09,
  //               width: screenWidth * 0.15,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(left: screenWidth * 0.010),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "Delivery Status",
  //                   style: GoogleFonts.poppins(
  //                     color: Colors.white,
  //                     fontSize: screenHeight * 0.017,
  //                   ),
  //                 ),
  //                 Text(
  //                   "Delivery Product Name",
  //                   style: GoogleFonts.poppins(
  //                     color: Colors.white,
  //                     fontSize: screenHeight * 0.016,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: screenWidth / 2,
  //                   child: Text(
  //                     "After multiple attempts, delivery of your product has been canceled and no further attempt will be made",
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: GoogleFonts.poppins(
  //                       color: Colors.white,
  //                       fontSize: screenHeight * 0.013,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           Spacer(),
  //           Padding(
  //             padding: EdgeInsets.only(right: screenWidth * 0.005),
  //             child: Text(
  //               DateTime.now().toString().substring(0, 11),
  //               style: GoogleFonts.ruluko(
  //                 color: Colors.white,
  //                 fontSize: screenHeight * 0.013,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget buildAccountBannerDot(int length) => Obx(() => Center(
  //       child: AnimatedSmoothIndicator(
  //         activeIndex: currentBannerPosition.value,
  //         count: length,
  //         effect: ScrollingDotsEffect(
  //           dotColor: Colors.white,
  //           activeDotColor: Colors.black,
  //           dotHeight: 05,
  //           dotWidth: 05,
  //         ),
  //       ),
  //     ));
}

// class ListItem {
//   final String title;
//   final String description;
//   final IconData icon;
//   bool isExpanded;
//
//   ListItem({
//     required this.title,
//     required this.description,
//     required this.icon,
//     this.isExpanded = false,
//   });
// //
// }
