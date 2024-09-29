import 'my_gift_voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:group_radio_button/group_radio_button.dart';

import '../../account/controllers/account_controller.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/custom_submit_button.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/checkout_controller.dart';

enum SingingCharacter { Kalarna, Paypal }

class CheckOutCardView extends StatefulWidget {
  const CheckOutCardView(
      {Key? key, required this.selectedItems, required this.totalPrice})
      : super(key: key);

  final List<Map<String, dynamic>> selectedItems;
  final double totalPrice;

  @override
  State<CheckOutCardView> createState() => _CheckOutCardViewState();
}

class _CheckOutCardViewState extends State<CheckOutCardView> {
  AccountController controller = Get.put(AccountController());

  SingingCharacter? _character = SingingCharacter.Kalarna;

  CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.12),
              child: customGeneralAPPBar("Checkout")),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.015, right: screenWidth * 0.015),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Address",
                                        style: GoogleFonts.yantramanav(
                                          color: AppColors.colorGrey,
                                          fontSize: screenHeight * 0.013,
                                        ),
                                      ),
                                      Text(
                                        "Delivery ",
                                        style: GoogleFonts.yantramanav(
                                          color: AppColors.colorGrey,
                                          fontSize: screenHeight * 0.013,
                                        ),
                                      ),
                                      Text(
                                        "Payment",
                                        style: GoogleFonts.yantramanav(
                                          color: AppColors.colorGrey,
                                          fontSize: screenHeight * 0.013,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.035),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.10,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.018,
                                          width: screenWidth * 0.030,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == 0
                                                  ? Colors.black
                                                  : AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.15,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.13,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.018,
                                          width: screenWidth * 0.030,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == 0
                                                  ? Colors.black
                                                  : AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.15,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.15,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.018,
                                          width: screenWidth * 0.030,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == 0
                                                  ? Colors.black
                                                  : AppColors.colorGrey),
                                        ),
                                        Container(
                                          height: screenHeight * 0.001,
                                          width: screenWidth * 0.10,
                                          decoration: const BoxDecoration(
                                              color: AppColors.colorGrey),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      SizedBox(height: screenHeight * 0.020),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.020),
                            child: Text(
                              "£${widget.totalPrice} (${widget.selectedItems.length} item) ",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.020,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.20,
                        margin: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.selectedItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(
                                  "${widget.selectedItems[index]["imageLink"]}",
                                  height: screenHeight * 0.20,
                                  width: screenWidth * 0.20,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.020),
                            child: Text(
                              "Select Payment Method",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.020,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),

                      InkWell(
                        onTap: () {
                          Get.to(const MyGiftVoucher());
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.010,
                            ),
                            SvgPicture.asset(
                              "assets/images/gift_voucher.svg",
                              height: screenHeight * 0.030,
                              width: screenWidth * 0.070,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: screenWidth * 0.030,
                            ),
                            Text(
                              "Use gift card/Voucher/Credit point",
                              style: GoogleFonts.yantramanav(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.020,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.030,
                                color: AppColors.colorGrey,
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.020),
                            child: Text(
                              "Credit/Debit Card",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                          SvgPicture.asset(
                            "assets/images/mastercard.svg",
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.090,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: screenWidth * 0.050,
                          ),
                          SvgPicture.asset(
                            "assets/images/mastercard.svg",
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.090,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: screenWidth * 0.050,
                          ),
                          SvgPicture.asset(
                            "assets/images/visa_card.svg",
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.090,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.020),
                            child: Text(
                              "Use different payment method",
                              style: GoogleFonts.yantramanav(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),

                      // Obx(() =>RadioGroup<String>.builder(
                      //   groupValue: _verticalGroupValue.value,
                      //   onChanged: (value) {
                      //     _verticalGroupValue.value="${value}";
                      //   },
                      //   items: _status,
                      //   itemBuilder: (item) => RadioButtonBuilder(
                      //     item,
                      //     textPosition: RadioButtonTextPosition.right,
                      //   ),
                      // ) ),

                      Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Kalarna",
                              style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Radio(
                              activeColor: AppColors.colorLightBlack,
                              value: SingingCharacter.Kalarna,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Pay in 3 interest-free",
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeight * 0.013,
                                          color: AppColors.colorGrey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Split your purchase into smaller payment",
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeight * 0.013,
                                          color: AppColors.colorGrey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Trusted by more than 150 million users",
                                      style: GoogleFonts.poppins(
                                          fontSize: screenHeight * 0.013,
                                          color: AppColors.colorGrey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.020,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth / 2,
                                      child: Expanded(
                                        child: Text(
                                          "By continuing, I accept the terms of Klarna Shopping Service and confirm that I have read the Privacy Notice and the Cookie Notice",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: screenHeight * 0.013,
                                              color: AppColors.colorGrey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Paypal",
                              style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Radio(
                              value: SingingCharacter.Paypal,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                              activeColor: AppColors.colorLightBlack,
                            ),

                            // subtitle: ,
                          ),
                        ],
                      ),

                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Checkbox(
                      //       checkColor: Colors.black,
                      //       value: controller.isChecked.value,
                      //       onChanged: (bool? value) {
                      //         controller.isChecked.value = value!;
                      //       },
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(left: screenWidth * 0.010),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Kalarna",
                      //             style: GoogleFonts.poppins(
                      //                 fontSize: screenHeight * 0.016,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 "Pay in 3 interest-free",
                      //                 style: GoogleFonts.poppins(
                      //                     fontSize: screenHeight * 0.013,
                      //                     color: AppColors.colorGrey),
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 "Split your purchase into smaller payment",
                      //                 style: GoogleFonts.poppins(
                      //                     fontSize: screenHeight * 0.013,
                      //                     color: AppColors.colorGrey),
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 "Trusted by more than 150 million users",
                      //                 style: GoogleFonts.poppins(
                      //                     fontSize: screenHeight * 0.013,
                      //                     color: AppColors.colorGrey),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: screenHeight * 0.020,
                      //           ),
                      //           Row(
                      //             children: [
                      //               Container(
                      //                 width: screenWidth / 2,
                      //                 child: Expanded(
                      //                   child: Text(
                      //                     "By continuing, I accept the terms of Klarna Shopping Service and confirm that I have read the Privacy Notice and the Cookie Notice",
                      //                     maxLines: 3,
                      //                     overflow: TextOverflow.ellipsis,
                      //                     style: GoogleFonts.poppins(
                      //                         fontSize: screenHeight * 0.013,
                      //                         color: AppColors.colorGrey),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Checkbox(
                      //       checkColor: Colors.black,
                      //       value: controller.isChecked.value,
                      //       onChanged: (bool? value) {
                      //         controller.isChecked.value = value!;
                      //       },
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(left: screenWidth * 0.010),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Paypal",
                      //             style: GoogleFonts.poppins(
                      //                 fontSize: screenHeight * 0.016,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      customSubmitButton("CONTINUE TO PAYMENT", 10, () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/arcticons_paydirekt.png"),
                                            const Text("Klarna Pay"),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 16),
                                              child: TextField(
                                                //controller: passwordController,
                                                //obscureText: _isObscure,
                                                keyboardType:
                                                    TextInputType.text,
                                                cursorColor:
                                                    Colors.red.shade900,
                                                decoration: InputDecoration(
                                                    // prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
                                                    // suffixIcon: IconButton(
                                                    //   icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                                                    //   onPressed: (){
                                                    //     setState(() {
                                                    //       _isObscure= !_isObscure;
                                                    //     });
                                                    //   },
                                                    // ),
                                                    // suffixIconColor: Colors.red,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey)),
                                                    hintText: "Phone",
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0))),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 16),
                                              child: TextField(
                                                //controller: passwordController,
                                                //obscureText: _isObscure,
                                                keyboardType:
                                                    TextInputType.text,
                                                cursorColor:
                                                    Colors.red.shade900,
                                                decoration: InputDecoration(
                                                    // prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
                                                    // suffixIcon: IconButton(
                                                    //   icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                                                    //   onPressed: (){
                                                    //     setState(() {
                                                    //       _isObscure= !_isObscure;
                                                    //     });
                                                    //   },
                                                    // ),
                                                    // suffixIconColor: Colors.red,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey)),
                                                    hintText: "Email",
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width:
                                                                        1.0))),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                checkoutController
                                                    .OrderComplete(
                                                        "01797609439",
                                                        widget.selectedItems);

                                                navigator?.pop(context);
                                                successMessage();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 9,
                                                    horizontal:
                                                        screenWidth * 0.20),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .colorGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: const Text("Continue"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: const [
                                      // Text("A link will be sent via email"),

                                      // ElevatedButton(
                                      //   onPressed: () async {
                                      //
                                      //     //PasswordReset(passwordResetController.text,context);
                                      //
                                      //
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     padding: EdgeInsets.symmetric(
                                      //         horizontal: 20, vertical: 2),
                                      //     backgroundColor: Colors.black,
                                      //     shape: StadiumBorder(),
                                      //   ),
                                      //   child: Text(
                                      //     "Reset",
                                      //     style: TextStyle(color: Colors.white, fontSize: 18,
                                      //         fontWeight: FontWeight.bold
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ));
                        });
                      }),
                      SizedBox(
                        height: screenHeight * 0.015,
                      )
                    ],
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: customSubmitButton("CONTINUE TO PAYMENT", 10, () {
              //     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              //       showDialog(
              //           context: context,
              //           builder: (context) => AlertDialog(
              //                 content: SingleChildScrollView(
              //                   child: Container(
              //                     padding: EdgeInsets.all(5),
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         Image.asset(
              //                             "assets/images/arcticons_paydirekt.png"),
              //                         Text("Klarna Pay"),
              //                         Container(
              //                           padding: EdgeInsets.symmetric(
              //                               horizontal: 0, vertical: 16),
              //                           child: TextField(
              //                             //controller: passwordController,
              //                             //obscureText: _isObscure,
              //                             keyboardType: TextInputType.text,
              //                             cursorColor: Colors.red.shade900,
              //                             decoration: InputDecoration(
              //                                 // prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
              //                                 // suffixIcon: IconButton(
              //                                 //   icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              //                                 //   onPressed: (){
              //                                 //     setState(() {
              //                                 //       _isObscure= !_isObscure;
              //                                 //     });
              //                                 //   },
              //                                 // ),
              //                                 // suffixIconColor: Colors.red,
              //                                 border: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(4),
              //                                     borderSide: BorderSide(
              //                                         width: 1,
              //                                         color: Colors.grey)),
              //                                 hintText: "Phone",
              //                                 focusedBorder: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(4),
              //                                     borderSide: BorderSide(
              //                                         color: Colors.grey,
              //                                         width: 1.0))),
              //                           ),
              //                         ),
              //                         Container(
              //                           padding: EdgeInsets.symmetric(
              //                               horizontal: 0, vertical: 16),
              //                           child: TextField(
              //                             //controller: passwordController,
              //                             //obscureText: _isObscure,
              //                             keyboardType: TextInputType.text,
              //                             cursorColor: Colors.red.shade900,
              //                             decoration: InputDecoration(
              //                                 // prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
              //                                 // suffixIcon: IconButton(
              //                                 //   icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              //                                 //   onPressed: (){
              //                                 //     setState(() {
              //                                 //       _isObscure= !_isObscure;
              //                                 //     });
              //                                 //   },
              //                                 // ),
              //                                 // suffixIconColor: Colors.red,
              //                                 border: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(4),
              //                                     borderSide: BorderSide(
              //                                         width: 1,
              //                                         color: Colors.grey)),
              //                                 hintText: "Email",
              //                                 focusedBorder: OutlineInputBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(4),
              //                                     borderSide: BorderSide(
              //                                         color: Colors.grey,
              //                                         width: 1.0))),
              //                           ),
              //                         ),
              //                         InkWell(
              //                           onTap: () {
              //                             checkoutController.OrderComplete(
              //                                 "01797609439",
              //                                 widget.selectedItems);
              //
              //                             navigator?.pop(context);
              //                             successMessage();
              //                           },
              //                           child: Container(
              //                             child: Text("Continue"),
              //                             padding: EdgeInsets.symmetric(
              //                                 vertical: 9,
              //                                 horizontal: screenWidth * 0.20),
              //                             decoration: BoxDecoration(
              //                                 border: Border.all(
              //                                     color: Color.fromARGB(
              //                                         255, 238, 98, 49)),
              //                                 borderRadius:
              //                                     BorderRadius.circular(5)),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 actions: [
              //                   // Text("A link will be sent via email"),
              //
              //                   // ElevatedButton(
              //                   //   onPressed: () async {
              //                   //
              //                   //     //PasswordReset(passwordResetController.text,context);
              //                   //
              //                   //
              //                   //   },
              //                   //   style: ElevatedButton.styleFrom(
              //                   //     padding: EdgeInsets.symmetric(
              //                   //         horizontal: 20, vertical: 2),
              //                   //     backgroundColor: Colors.black,
              //                   //     shape: StadiumBorder(),
              //                   //   ),
              //                   //   child: Text(
              //                   //     "Reset",
              //                   //     style: TextStyle(color: Colors.white, fontSize: 18,
              //                   //         fontWeight: FontWeight.bold
              //                   //     ),
              //                   //   ),
              //                   // ),
              //                 ],
              //               ));
              //     });
              //   }),
              // ),
            ],
          )),
    );
  }

  void successMessage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/checked.png"),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Order has been placed",
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        Text(
                          "SUCCESSFULLY",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 238, 98, 49)),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Order #44214533",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(vertical:11,horizontal: 0.07),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 238, 98, 49))),
                          // padding: EdgeInsets.symmetric(vertical:11,horizontal: 0.07),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 11, horizontal: screenWidth * 0.07),
                              child: const Text("Track my orders")),
                        )
                      ],
                    ),
                  ),
                ),
                actions: const [
                  // Text("A link will be sent via email"),

                  // ElevatedButton(
                  //   onPressed: () async {
                  //
                  //     //PasswordReset(passwordResetController.text,context);
                  //
                  //
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 20, vertical: 2),
                  //     backgroundColor: Colors.black,
                  //     shape: StadiumBorder(),
                  //   ),
                  //   child: Text(
                  //     "Reset",
                  //     style: TextStyle(color: Colors.white, fontSize: 18,
                  //         fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                ],
              ));
    });
  }

  // Future<void> OrderComplete(String contact_number) async {
  //
  //
  //
  //   Map<String, dynamic> OrderDetail = Map();
  //   String accept = "true";
  //   OrderDetail['contact_number'] = contact_number;
  //   OrderDetail["itemList"]=selectedItems;
  //
  //   // userData['password'] = password;
  //
  //   // print("userData" + userData.toString());
  //
  //   final url = Uri.parse(BASE_URL + 'api/customer/complete-order');
  //
  //   var response = await http.post(url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode(OrderDetail));
  //
  //   // print("Response Code..................." + response.statusCode.toString());
  //   // print("Response Code..................." + response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     //Navigator.pop(context);
  //
  //   }
  //
  //
  //
  //   print("Password reset response code--------------------${response.statusCode}");
  //   //var jsonResponse = jsonDecode(response.body);
  //
  //   // try {
  //   //   if (jsonResponse['status'] == 200) {
  //   //     String token = jsonResponse['token'].toString();
  //   //     await saveToken(token);
  //   //     // print("Response ..................." + jsonResponse.toString());
  //   //     return true;
  //   //   } else if (jsonResponse['status'] == 400) {
  //   //     Get.snackbar(
  //   //       "Error",
  //   //       jsonResponse['message'],
  //   //       colorText: Colors.white,
  //   //       backgroundColor: Colors.red,
  //   //       snackPosition: SnackPosition.BOTTOM,
  //   //     );
  //   //   }
  //   // } catch (e) {
  //   //   // print(e.toString());
  //   // }
  //
  //
  //   // } else {
  //   //   // return false;
  //   // }
  //
  //
  //
  //
  // }
}
