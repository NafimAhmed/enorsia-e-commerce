import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sizer/sizer.dart';

import '../../utill/app_size.dart';

class Loyality extends StatelessWidget {
  RxBool isChecked = false.obs;

  Loyality({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: screenHeight * (151 / 852),
              // width: screenWidth,
              //color: Colors.deepOrange,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/rectangle_enorsia.png",
                  ),
                  fit: BoxFit.fill,
                ),

                // color: Color.fromARGB(100,238, 98, 49)
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "11",
                          style: GoogleFonts.ruluko(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/images/tabler_arrow-badge-up-filled.png"),
                            Text(
                              "Reputation",
                              style: GoogleFonts.ruluko(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Welcome to the loyalty program",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Obx(() => ListTile(
                    leading: Checkbox(
                      checkColor: Colors.black,
                      value: isChecked.value, //isChecked[index],
                      onChanged: (val) {
                        isChecked.value = val!;
                      },
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: 'I’ve read and agreed with the ',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'terms & condition',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 238, 98, 49))),
                        ],
                      ),
                    ),
                  )),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'You have 11 Loyalty Reputation points ',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      "Redeem now",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 238, 98, 49),
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            'Currently you are availing 5% Discount in delivery',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              ListTile(
                title: Column(
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent scelerisque vestibulum lectus at pellentesque. Morbi malesuada faucibus dapibus. Quisque feugiat laoreet erat vitae gravida. Nulla in cursus tellus, et mollis arcu. Integer nec velit ipsum. Praesent rhoncus sollicitudin nibh mollis iaculis. Mauris a rhoncus elit. In hac habitasse platea dictumst. Ut tempor ex non turpis finibus, sed rutrum odio posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;",
                      maxLines: 6,
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: screenWidth*0.29,//29.w,
                          height: 27,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 238, 98, 49)),
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          child: Text(
                            "Continue shopping",
                            style: GoogleFonts.yantramanav(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 238, 98, 49)),
                          ),
                        ),
                        Text(
                          " & Unlock the promotions",
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset("assets/images/facebook.png"),
                          Text(
                            "    Share on facebook and get 10 reputation point",
                            style: GoogleFonts.ruluko(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(179, 238, 98, 49)),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Image.asset("assets/images/formkit_twitter.png"),
                          Text(
                            "    Share on twitter and get 10 reputation point",
                            style: GoogleFonts.ruluko(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(179, 238, 98, 49)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
