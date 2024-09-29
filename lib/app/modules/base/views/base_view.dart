import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../account/views/my_bag.dart';
import '../../favourite/views/favourite_view.dart';
import '../../home/views/home_view.dart';
import '../../search/views/search_view.dart';
import '../../shop/controllers/shop_controller.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../controllers/base_controller.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BaseController baseController = Get.put(BaseController());

  ShopController shopController = Get.put(ShopController());

  var currentIndex = 0;
  bool _isDrawerOpen = false;
  final screens = [
    HomeView(),
    SearchView(),
    const FavouriteView(),
    const MyBagView(),
    const AccountView(),
  ];

  String _searchText = '';










  /////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(
      //     backgroundColor: AppColors.colorLightBlack,
      //     child: Obx(
      //       () => baseController.isMenuLoading.value == true
      //           ? Center(
      //               child: Lottie.asset("assets/json/loading.json",
      //                   fit: BoxFit.cover,
      //                   height: screenHeight * 0.095,
      //                   width: screenWidth * 0.095),
      //             )
      //           : Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.only(top: screenHeight * 0.060),
      //                   child: Container(
      //                     margin: const EdgeInsets.all(4.0),
      //                     width: screenWidth * 0.600,
      //                     height: screenHeight * 0.050,
      //                     decoration: BoxDecoration(
      //                       border: Border.all(
      //                           color: Colors.white,
      //                           strokeAlign: BorderSide.strokeAlignOutside),
      //                       borderRadius: BorderRadius.circular(10.0),
      //                     ),
      //                     child: TextFormField(
      //                       onChanged: _filterDrawerItems,
      //                       decoration: InputDecoration(
      //                         hintText: 'Search...',
      //                         border: InputBorder.none,
      //                         hintStyle:
      //                             GoogleFonts.gothicA1(color: Colors.white),
      //                         prefixIcon: Icon(
      //                           Icons.search,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: ListView.builder(
      //                     itemCount: baseController.apiMenuMap?['data'].length,
      //                     itemBuilder: (context, index) {
      //                       //final item = baseController.apiMenuMap?["data"].length;
      //                       return ExpansionTile(
      //                         iconColor: Colors.red,
      //                         collapsedIconColor: Colors.white,
      //                         title: Text(
      //                           "${baseController.apiMenuMap?['data'][index]["department"]}",
      //                           style: GoogleFonts.gothicA1(
      //                               color: Colors.white,
      //                               fontSize: screenHeight * 0.022,
      //                               fontWeight: FontWeight.bold),
      //                         ),
      //                         children: [
      //                           Container(
      //                             margin: EdgeInsets.symmetric(
      //                               horizontal: 30,
      //                             ),
      //                             child: ListView.builder(
      //                                 shrinkWrap: true,
      //                                 physics: ScrollPhysics(),
      //                                 itemCount: baseController
      //                                     .apiMenuMap?['data'][index]
      //                                         ["categories"]
      //                                     .length, //item.expandedValue.length,
      //                                 itemBuilder: (context, indexi) {
      //                                   return ListTile(
      //                                     onTap: () {
      //                                       print("clicking the button");
      //
      //                                       shopController
      //                                               .subCategoryName.value =
      //                                           baseController
      //                                               .apiMenuMap!['data'][index]
      //                                                   ["categories"][indexi]
      //                                                   ["slug"]
      //                                               .toString();
      //                                       // Get.toNamed(
      //                                       //     Routes.SHOP
      //                                       // );
      //
      //                                       Get.to(() => ShopView(
      //                                           title:
      //                                               "${baseController.apiMenuMap?['data'][index]["department"]}",
      //                                           subTitle:
      //                                               "${baseController.apiMenuMap?['data'][index]["categories"][indexi]["category_name"]}"));
      //                                     },
      //                                     title: Text(
      //                                       "${baseController.apiMenuMap?['data'][index]["categories"][indexi]["category_name"]}",
      //                                       style: GoogleFonts.gothicA1(
      //                                           color: Colors.white,
      //                                           fontSize: screenHeight * 0.018,
      //                                           fontWeight: FontWeight.bold),
      //                                     ),
      //                                   );
      //                                 }),
      //                           )
      //                         ],
      //                       );
      //
      //                       //   ExpansionPanelList(
      //                       //   dividerColor: Colors.transparent,
      //                       //   expandIconColor: Colors.white,
      //                       //   elevation: 0,
      //                       //   expandedHeaderPadding: EdgeInsets.zero,
      //                       //   expansionCallback: (panelIndex, isExpanded) {
      //                       //     setState(() {
      //                       //       item.isExpanded = !isExpanded;
      //                       //     });
      //                       //   },
      //                       //   children: [
      //                       //     ExpansionPanel(
      //                       //       headerBuilder: (context, isExpanded) {
      //                       //         return ListTile(
      //                       //           title: Text(
      //                       //             item.headerValue,
      //                       //             style: GoogleFonts.gothicA1(
      //                       //                 color: Colors.white,
      //                       //                 fontSize: screenHeight * 0.022,
      //                       //                 fontWeight: FontWeight.bold),
      //                       //           ),
      //                       //         );
      //                       //       },
      //                       //       body: ListTile(
      //                       //         title: Column(
      //                       //           crossAxisAlignment: CrossAxisAlignment.start,
      //                       //           children: item.expandedValue
      //                       //               .map((value) => Padding(
      //                       //                     padding: EdgeInsets.only(
      //                       //                         top: screenHeight * 0.010,
      //                       //                         left: screenWidth * 0.035),
      //                       //                     child: GestureDetector(
      //                       //                       child: GestureDetector(
      //                       //                         onTap: () {
      //                       //                           Get.to(() => ShopView(
      //                       //                               title: _drawerItems[index]
      //                       //                                   .headerValue
      //                       //                                   .toString(),
      //                       //                               subTitle: value));
      //                       //                         },
      //                       //                         child: Text(
      //                       //                           value,
      //                       //                           style: GoogleFonts.gothicA1(
      //                       //                             color: Colors.white,
      //                       //                             fontSize: screenHeight * 0.018,
      //                       //                           ),
      //                       //                         ),
      //                       //                       ),
      //                       //                     ),
      //                       //                   ))
      //                       //               .toList(),
      //                       //         ),
      //                       //       ),
      //                       //       isExpanded: item.isExpanded,
      //                       //       backgroundColor: AppColors.colorLightBlack,
      //                       //     ),
      //                       //   ],
      //                       // );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //     )),
      bottomNavigationBar: Container(
        height: screenHeight * 0.08,
        decoration: const BoxDecoration(
          color: Color(0xffF2F2F2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: Container(
                width: screenWidth * 0.20,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.colorLightBlack,
                  // color: currentIndex == 0
                  //     ? Colors.white
                  //     : AppColors.colorLightBlack,
                ),
                child: Icon(
                  Icons.home,
                  size: screenHeight * 0.030,
                  color: currentIndex == 0 ? AppColors.activeBottomNavColor : AppColors.nonActiveBottomNavColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  // _scaffoldKey.currentState!.openDrawer();
                  currentIndex = 1;
                });

                print("bottom nav index.........$currentIndex");
              },
              child: Container(
                width: screenWidth * 0.20,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.colorLightBlack,
                  // color: _isDrawerOpen == 1 && _isDrawerOpen == true
                  //     ? Colors.white
                  //     : AppColors.colorLightBlack,
                ),
                child: Icon(
                  Icons.search,
                  size: screenHeight * 0.030,
                  color: currentIndex == 1 ? AppColors.activeBottomNavColor : AppColors.nonActiveBottomNavColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                print("bottom nav index.........$currentIndex");
              },
              child: Container(
                width: screenWidth * 0.20,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.colorLightBlack,
                  // color: currentIndex == 2
                  //     ? Colors.white
                  //     : AppColors.colorLightBlack,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: screenHeight * 0.030,
                  color: currentIndex == 2 ? AppColors.activeBottomNavColor : AppColors.nonActiveBottomNavColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                print("bottom nav index.........$currentIndex");
              },
              child: Container(
                width: screenWidth * 0.20,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.colorLightBlack,
                  // color: currentIndex == 3
                  //     ? Colors.white
                  //     : AppColors.colorLightBlack,
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: screenHeight * 0.030,
                  color: currentIndex == 3 ? AppColors.activeBottomNavColor : AppColors.nonActiveBottomNavColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              child: Container(
                width: screenWidth * 0.20,
                height: screenHeight * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.colorLightBlack,
                  // color: currentIndex == 3
                  //     ? Colors.white
                  //     : AppColors.colorLightBlack,
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  size: screenHeight * 0.030,
                  color: currentIndex == 4 ?AppColors.activeBottomNavColor : AppColors.nonActiveBottomNavColor,
                ),
              ),
            )
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////
}

class DrawerItem {
  final String headerValue;
  final List<String> expandedValue;
  bool isExpanded;

  DrawerItem({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
}
