import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/help_controller.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  HelpController helpController = Get.put(HelpController());

  final List<ListItem> _cardItems = [
    ListItem(
        title: 'Phone',
        description: 'Call us for quick support',
        icon: Icons.phone),
    ListItem(
        title: 'Email',
        description: 'Email us with your queries',
        icon: Icons.email_outlined),
    ListItem(
        title: 'Chat',
        description: 'Poke the support team directly',
        icon: Icons.chat),
    ListItem(
        title: 'Whats App',
        description: 'Get Help & Support instatnly',
        icon: Icons.phone),

    // Add more items as needed
  ];

  final List<ListItem> _faq = [
    ListItem(
        title: 'Refund and Return',
        description: 'How do I claim for refund',
        icon: Icons.phone),
    ListItem(
        title: 'Delivery',
        description: 'Where is my order? ',
        icon: Icons.email_outlined),
    ListItem(
        title: 'Payment', description: 'Payment queries', icon: Icons.chat),
    ListItem(
        title: 'Store Information',
        description: 'Place an order ',
        icon: Icons.phone),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: customGeneralAPPBar("Help")),
      body: SingleChildScrollView(
        child: Obx(() => helpController.isFAQListLoading == true
            ? Center(
                child: Lottie.asset("assets/json/loading.json",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.095,
                    width: screenWidth * 0.095),
              )
            : Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Padding(
                      padding:
                          const EdgeInsets.only(left: 05, right: 05, top: 15.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: _cardItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 3.0),
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 3.0,
                              child: GestureDetector(
                                onTap: () {
                                  if (_cardItems[index].title == 'Phone') {
                                    launch("tel: +44 07492725437");
                                  } else if (_cardItems[index].title ==
                                      'Email') {
                                    launch("mailto: info@enorsia.com");
                                  } else if (_cardItems[index].title ==
                                      'Chat') {
                                    launch("sms:+44 07492725437");
                                  } else if (_cardItems[index].title ==
                                      'Whats App') {
                                    //https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}
                                    launch(
                                        "https://api.whatsapp.com/send?phone=+4407492725437");
                                  }

                                  //launchUrl(url)
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      border: Border.all(
                                        color: AppColors.colorLightOrange,
                                      )),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0),
                                            child: Icon(
                                              _cardItems[index].icon,
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25.0),
                                            child: Container(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                _cardItems[index].title,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.yantramanav(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                          )
                                        ],
                                      ),
                                      Text(
                                        _cardItems[index].description,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.yantramanav(
                                          fontSize: screenWidth * 0.030,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),

                  SizedBox(
                    height: screenHeight * 0.020,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: ListView.builder(
                  //     physics: ScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemCount: _faq.length,
                  //     itemBuilder: (context, index) {
                  //       final item = _faq[index];
                  //       return ExpansionPanelList(
                  //         dividerColor: Colors.transparent,
                  //         expandIconColor: Colors.grey,
                  //         elevation: 0,
                  //         expandedHeaderPadding: EdgeInsets.zero,
                  //         expansionCallback: (panelIndex, isExpanded) {
                  //           setState(() {
                  //             item.isExpanded = !isExpanded;
                  //           });
                  //         },
                  //         children: [
                  //           ExpansionPanel(
                  //             headerBuilder: (context, isExpanded) {
                  //               return ListTile(
                  //                 title: Padding(
                  //                   padding:
                  //                   EdgeInsets.only(left: screenWidth * 0.065),
                  //                   child: Text(
                  //                     item.title,
                  //                     style: GoogleFonts.yantramanav(
                  //                         color: AppColors.colorLightBlack,
                  //                         fontSize: screenHeight * 0.022,
                  //                         fontWeight: FontWeight.w500),
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //             body: ListTile(
                  //               title: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: _faq
                  //                     .map((value) => Padding(
                  //                   padding: EdgeInsets.only(
                  //                       left: screenWidth * 0.095),
                  //                   child: Text(
                  //                     value.description,
                  //                     style: GoogleFonts.yantramanav(
                  //                       color: AppColors.colorLightBlack,
                  //                       fontSize: screenHeight * 0.018,
                  //                     ),
                  //                   ),
                  //                 ))
                  //                     .toList(),
                  //               ),
                  //             ),
                  //             isExpanded: item.isExpanded,
                  //             backgroundColor: Colors.white,
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),

                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.025),
                        child: Text(
                          "FAQ's ",
                          style: GoogleFonts.yantramanav(
                              color: AppColors.colorLightBlack,
                              fontSize: screenHeight * 0.022,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: helpController.apiFAQListMap?['banner'].length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(
                            "${helpController.apiFAQListMap?['banner'][index]["questions"]}",
                            style: GoogleFonts.yantramanav(
                                color: AppColors.colorLightBlack,
                                fontSize: screenHeight * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Html(
                                data:
                                    "${helpController.apiFAQListMap?['banner'][index]["answers"]}",
                                // style: GoogleFonts.yantramanav(
                                //     color: AppColors.colorLightBlack,
                                //     fontSize: screenHeight * 0.018,
                                //     fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        );
                      }),

                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                ],
              )),
      ),
    );
  }
}

class ListItem {
  final String title;
  final String description;
  final IconData icon;
  bool isExpanded;

  ListItem({
    required this.title,
    required this.description,
    required this.icon,
    this.isExpanded = false,
  });
}
