import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/sql_card_helper.dart';
import '../../widgets/general_appbar.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List<Map<String, dynamic>> Cardjournals = [];
  bool CardisLoading = true;

  TextEditingController CardNumbertextEditingController =
      TextEditingController();
  TextEditingController CardValiditytextEditingController =
      TextEditingController();
  TextEditingController holderNametextEditingController =
      TextEditingController();
  TextEditingController CVVtextEditingController = TextEditingController();
  String CardIssuer = "Visa";

  Future<void> refreshCardJournal() async {
    print("in funcion call");

    final data = await SQLCardHelper.getItems();
    //journals=data;
    setState(() {
      Cardjournals = data;
      CardisLoading = false;
    });

    //CardisChecked = List<bool>.filled(Cardjournals.length, false);

    // for(int i = 0; i<isChecked.length ; i++){
    //   print("is value checked.............."+isChecked[i].toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.12),
            child: customGeneralAPPBar("Payment History")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //customPaymentCard(),

              ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Cardjournals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Credit card or Debit card",
                                //"${Cardjournals[index]["cardIssuer"]}",//cardIssuer
                                style: GoogleFonts.gothicA1(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.016,
                                ),
                              ),
                              Text(
                                "${Cardjournals[index]["cardHolderName"]}",
                                style: GoogleFonts.gothicA1(
                                  color: AppColors.colorLightBlack,
                                  fontSize: screenHeight * 0.013,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Card no : ${Cardjournals[index]["cardNumber"]}",
                                    style: GoogleFonts.gothicA1(
                                      color: AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.013,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exp : ${Cardjournals[index]["validity"]}",
                                    style: GoogleFonts.gothicA1(
                                      color: AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.013,
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
                            padding:
                                EdgeInsets.only(right: screenWidth * 0.020),
                            child: SvgPicture.asset(
                              "assets/images/visa_card.svg",
                              height: screenHeight * 0.030,
                              width: screenWidth * 0.070,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: screenWidth * 0.020),
                            child: Icon(
                              Icons.edit,
                              color: AppColors.colorGrey,
                              size: screenHeight * 0.022,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              SQLCardHelper.deleteItem(
                                  int.parse("${Cardjournals[index]["id"]}"));

                              refreshCardJournal();
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.020),
                              child: Icon(
                                Icons.delete_outlined,
                                color: AppColors.colorGrey,
                                size: screenHeight * 0.022,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),

              InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
                                            labelText: "Card Number",
                                            labelStyle: GoogleFonts.raleway(),
                                            floatingLabelStyle:
                                                GoogleFonts.yantramanav(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            hintText: "Enter Card Number",
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        maxLines: 1,
                                        controller:
                                            CardValiditytextEditingController,
                                        decoration: InputDecoration(
                                            labelText: "Expire Month",
                                            labelStyle: GoogleFonts.raleway(),
                                            floatingLabelStyle:
                                                GoogleFonts.yantramanav(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            hintText: "MM/YY",
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        maxLines: 1,
                                        controller:
                                            holderNametextEditingController,
                                        decoration: InputDecoration(
                                            labelText: "Card Holder Name",
                                            labelStyle: GoogleFonts.raleway(),
                                            floatingLabelStyle:
                                                GoogleFonts.yantramanav(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            hintText: "Enter Card Holder Name",
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        maxLines: 1,
                                        controller: CVVtextEditingController,
                                        decoration: InputDecoration(
                                            labelText: "CVV",
                                            labelStyle: GoogleFonts.raleway(),
                                            floatingLabelStyle:
                                                GoogleFonts.yantramanav(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            hintText: "Enter CVV",
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.020,
                                      ),
                                      SizedBox(
                                        width: screenWidth / 2 + 20,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            //PasswordReset(passwordResetController.text,context);

                                            //SQLCardHelper.createItem(title, Price, sizeID, ProductID, colorID, quantity, ImageLink)
                                            SQLCardHelper.createItem(
                                                CardNumbertextEditingController
                                                    .text,
                                                holderNametextEditingController
                                                    .text,
                                                CardValiditytextEditingController
                                                    .text,
                                                CVVtextEditingController.text,
                                                CardIssuer);

                                            refreshCardJournal();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 2),
                                            backgroundColor:
                                                AppColors.colorLightGrey,
                                            shape: const StadiumBorder(),
                                          ),
                                          child: const Text(
                                            "Add Card",
                                            style: TextStyle(
                                              color: AppColors.colorLightBlack,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  });
                },
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.060,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // Set your desired border radius
                    border: Border.all(
                      color: AppColors.colorGrey, // Set the color of the border
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.050),
                    child: Text(
                      "My transactions",
                      style: GoogleFonts.gothicA1(
                          color: AppColors.colorLightBlack,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.12,
                      width: screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.050),
                                child: Text(
                                  DateTime.now().toString(),
                                  style: GoogleFonts.poppins(
                                    color: AppColors.colorGrey,
                                    fontSize: screenHeight * 0.013,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.050),
                                child: Text(
                                  "Payment received for the order #2114244",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.019,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.050),
                                child: Text(
                                  "Using",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.colorLightBlack,
                                    fontSize: screenHeight * 0.015,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.020),
                                child: Text(
                                  "card",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.colorLightBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight * 0.015,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshCardJournal();
  }
}
