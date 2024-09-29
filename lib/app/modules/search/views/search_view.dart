import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../base/controllers/base_controller.dart';
import '../../shop/controllers/shop_controller.dart';
import '../../shop/views/shop_view.dart';
import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/constant.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  SearchViewController controller = Get.put(SearchViewController());

  BaseController baseController = Get.put(BaseController());

  ShopController shopController = Get.put(ShopController());

  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await shopController.getProductName();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.06),
            child: Container(
              margin: EdgeInsets.only(
                  left: screenWidth * 0.055,
                  right: screenWidth * 0.055,
                  top: screenHeight * 0.005),
              width: screenWidth - 40,
              height: screenHeight * 0.045,
              decoration: BoxDecoration(
                  color: AppColors.colorLightGrey,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.030, top: screenHeight * 0.006),
                    child: SvgPicture.asset("assets/images/search_icon.svg",
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.040,
                        color: AppColors.colorGrey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.015,
                    ),
                    child: SizedBox(
                      width: screenWidth / 2 + 60,
                      height: screenHeight * 0.050,
                      child: RawAutocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          } else {
                            List<String> matches = <String>[];
                            matches.addAll(shopController.productName);

                            matches.retainWhere((searchValue) {
                              return searchValue.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase());
                            });
                            return matches;
                          }
                        },
                        onSelected: (String selection) {
                          shopController.productSearch.value = selection;
                          shopController.getShopProductDataBySearch();
                          Get.to(() => ShopView());
                          TextEditingValue.empty;
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return Center(
                            child: TextFormField(
                              maxLines: 1,
                              decoration: const InputDecoration(

                                isCollapsed: true,
                                  hintText: "What are you looking at today",
                                  border: InputBorder.none),
                              controller: textEditingController,
                              focusNode: focusNode,

                              onSaved: (selection) {
                                shopController.productSearch.value = selection!;
                                shopController.getShopProductDataBySearch();
                                Get.to(() => ShopView());
                                textEditingController.clear();
                              },
                            ),
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            void Function(String) onSelected,
                            Iterable<String> options) {
                          return Material(
                              child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: options.map((opt) {
                                return InkWell(
                                    onTap: () {
                                      onSelected(opt);

                                    },
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 60),
                                        child: Card(
                                            child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          child: Text(opt,style: GoogleFonts.poppins(
                                            fontSize: 12
                                          ) ,),
                                        ))));
                              }).toList(),
                            ),
                          ));
                        },
                      ),






                    ),
                  ),
                ],
              ),
            ),
          ),

          // PreferredSize(
          //     preferredSize: Size.fromHeight(screenHeight * 0.12),
          //     child: customGeneralAPPBar("Search")),
          //

          body: Obx(() => Column(
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Divider(
                      color: AppColors.colorLightGrey.withOpacity(0.5),
                      thickness: 3.0,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.040,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedCategory.value = "women";
                              shopController.slug.value = "women";
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.010,
                                  right: screenWidth * 0.010),
                              height: screenHeight * 0.040,
                              width: screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.selectedCategory.value ==
                                            "women"
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                  color: controller.selectedCategory.value ==
                                          "women"
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  "Women",
                                  style: GoogleFonts.yantramanav(
                                      color:
                                          controller.selectedCategory.value ==
                                                  "women"
                                              ? Colors.white
                                              : AppColors.colorLightBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenHeight * 0.014),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedCategory.value = "men";
                              shopController.slug.value = "men";
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.010,
                                  right: screenWidth * 0.010),
                              height: screenHeight * 0.040,
                              width: screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.selectedCategory.value ==
                                            "men"
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                  color:
                                      controller.selectedCategory.value == "men"
                                          ? Colors.grey
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  "Men",
                                  style: GoogleFonts.yantramanav(
                                      color:
                                          controller.selectedCategory.value ==
                                                  "men"
                                              ? Colors.white
                                              : AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.014),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedCategory.value = "girl";
                              shopController.slug.value = "girl";
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.010,
                                  right: screenWidth * 0.010),
                              height: screenHeight * 0.040,
                              width: screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.selectedCategory.value ==
                                            "girl"
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                  color: controller.selectedCategory.value ==
                                          "girl"
                                      ? Colors.grey
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  "Girls",
                                  style: GoogleFonts.yantramanav(
                                      color:
                                          controller.selectedCategory.value ==
                                                  "girl"
                                              ? Colors.white
                                              : AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.014),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedCategory.value = "boy";
                              shopController.slug.value = "boy";
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.010,
                                  right: screenWidth * 0.010),
                              height: screenHeight * 0.040,
                              width: screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.selectedCategory.value ==
                                            "boy"
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                  color:
                                      controller.selectedCategory.value == "boy"
                                          ? Colors.grey
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  "Boys",
                                  style: GoogleFonts.yantramanav(
                                      color:
                                          controller.selectedCategory.value ==
                                                  "boy"
                                              ? Colors.white
                                              : AppColors.colorLightBlack,
                                      fontSize: screenHeight * 0.014),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  baseController.isMenuLoading.value == true
                      ? Expanded(
                          child: Center(
                          child: Lottie.asset("assets/json/loading.json",
                              fit: BoxFit.cover,
                              height: screenHeight * 0.095,
                              width: screenWidth * 0.095),
                        ))
                      : controller.selectedCategory.value == "women"
                          ? Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: baseController
                                      .apiMenuMap?['data'][0]['categories']
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.040,
                                          right: screenWidth * 0.040),
                                      child: GestureDetector(
                                        onTap: () {
                                          shopController.subCategoryName.value =
                                              baseController.apiMenuMap!['data']
                                                      [0]["categories"][index]
                                                      ["slug"]
                                                  .toString();

                                          shopController.getShopProductData();

                                          print(
                                              "category value ........${shopController.subCategoryName.value}");

                                          Get.to(() => ShopView(
                                              title:
                                                  "${baseController.apiMenuMap?['data'][0]["department"]}",
                                              subTitle:
                                                  "${baseController.apiMenuMap?['data'][0]["categories"][index]["category_name"]}"));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: screenHeight * 0.005,
                                              bottom: screenHeight * 0.005),
                                          height: screenHeight * 0.10,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              color: AppColors.colorWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenWidth * 0.020),
                                                child: Text(
                                                  baseController
                                                      .apiMenuMap!['data'][0]
                                                          ["categories"][index]
                                                          ["category_name"]
                                                      .toString(),
                                                  style:
                                                      GoogleFonts.yantramanav(
                                                          color: AppColors
                                                              .colorLightBlack,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              screenHeight *
                                                                  0.018),
                                                ),
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: screenWidth * 0.040,
                                                ),
                                                child: FadeInImage(
                                                  image: NetworkImage(
                                                    IMAGE_HEADER +
                                                        baseController
                                                            .apiMenuMap!['data']
                                                                [0]
                                                                ["categories"]
                                                                [index]["image"]
                                                            .toString(),
                                                  ),
                                                  placeholder: const AssetImage(
                                                      'assets/images/placeholder_image.png'),
                                                  fit: BoxFit.cover,
                                                  imageErrorBuilder: (context,
                                                      error, stackTrace) {
                                                    return Image.asset(
                                                      "assets/images/placeholder_image.png",
                                                      height:
                                                          screenHeight * 0.10,
                                                      width: screenWidth * 0.19,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                  height: screenHeight * 0.10,
                                                  width: screenWidth * 0.19,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: screenWidth * 0.015,
                                                ),
                                                child: Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: AppColors.colorGrey,
                                                  size: screenHeight * 0.017,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : controller.selectedCategory.value == "men"
                              ? Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: baseController
                                          .apiMenuMap?['data'][1]['categories']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: screenWidth * 0.040,
                                              right: screenWidth * 0.040),
                                          child: GestureDetector(
                                            onTap: () {
                                              shopController
                                                      .subCategoryName.value =
                                                  baseController
                                                      .apiMenuMap!['data'][1]
                                                          ["categories"][index]
                                                          ["slug"]
                                                      .toString();

                                              shopController
                                                  .getShopProductData();

                                              Get.to(() => ShopView(
                                                  title:
                                                      "${baseController.apiMenuMap?['data'][1]["department"]}",
                                                  subTitle:
                                                      "${baseController.apiMenuMap?['data'][1]["categories"][index]["category_name"]}"));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight * 0.005,
                                                  bottom: screenHeight * 0.005),
                                              height: screenHeight * 0.10,
                                              width: screenWidth,
                                              decoration: BoxDecoration(
                                                  color: AppColors.colorWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: screenWidth *
                                                            0.020),
                                                    child: Text(
                                                      baseController
                                                          .apiMenuMap!['data']
                                                              [1]["categories"]
                                                              [index]
                                                              ["category_name"]
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .yantramanav(
                                                              color: AppColors
                                                                  .colorLightBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.018),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right:
                                                          screenWidth * 0.040,
                                                    ),
                                                    child: FadeInImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        IMAGE_HEADER +
                                                            baseController
                                                                .apiMenuMap![
                                                                    'data'][1][
                                                                    "categories"]
                                                                    [index]
                                                                    ["image"]
                                                                .toString(),
                                                      ),
                                                      placeholder: const AssetImage(
                                                          'assets/images/placeholder_image.png'),
                                                      // fit: BoxFit.cover,
                                                      imageErrorBuilder:
                                                          (context, error,
                                                              stackTrace) {
                                                        return Image.asset(
                                                          "assets/images/placeholder_image.png",
                                                          height: screenHeight *
                                                              0.10,
                                                          width: screenWidth *
                                                              0.19,
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                      height:
                                                          screenHeight * 0.10,
                                                      width: screenWidth * 0.19,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: screenWidth * 0.020,
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_circle_right_outlined,
                                                      color:
                                                          AppColors.colorGrey,
                                                      size:
                                                          screenHeight * 0.017,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              : controller.selectedCategory.value == "girl"
                                  ? Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: baseController
                                              .apiMenuMap?['data'][2]
                                                  ['categories']
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth * 0.040,
                                                  right: screenWidth * 0.040),
                                              child: GestureDetector(
                                                onTap: () {
                                                  shopController.subCategoryName
                                                          .value =
                                                      baseController
                                                          .apiMenuMap!['data']
                                                              [2]["categories"]
                                                              [index]["slug"]
                                                          .toString();

                                                  shopController
                                                      .getShopProductData();

                                                  Get.to(() => ShopView(
                                                      title:
                                                          "${baseController.apiMenuMap?['data'][2]["department"]}",
                                                      subTitle:
                                                          "${baseController.apiMenuMap?['data'][2]["categories"][index]["category_name"]}"));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: screenHeight * 0.005,
                                                      bottom:
                                                          screenHeight * 0.005),
                                                  height: screenHeight * 0.10,
                                                  width: screenWidth,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.colorWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.020),
                                                        child: Text(
                                                          baseController
                                                              .apiMenuMap![
                                                                  'data'][2]
                                                                  ["categories"]
                                                                  [index][
                                                                  "category_name"]
                                                              .toString(),
                                                          style: GoogleFonts.yantramanav(
                                                              color: AppColors
                                                                  .colorLightBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.018),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: screenWidth *
                                                              0.040,
                                                        ),
                                                        child: FadeInImage(
                                                          image: NetworkImage(
                                                            IMAGE_HEADER +
                                                                baseController
                                                                    .apiMenuMap![
                                                                        'data']
                                                                        [2][
                                                                        "categories"]
                                                                        [index][
                                                                        "image"]
                                                                    .toString(),
                                                          ),
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/placeholder_image.png'),
                                                          fit: BoxFit.cover,
                                                          imageErrorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Image.asset(
                                                              "assets/images/placeholder_image.png",
                                                              height:
                                                                  screenHeight *
                                                                      0.10,
                                                              width:
                                                                  screenWidth *
                                                                      0.19,
                                                              fit: BoxFit.cover,
                                                            );
                                                          },
                                                          height: screenHeight *
                                                              0.10,
                                                          width: screenWidth *
                                                              0.19,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: screenWidth *
                                                              0.020,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_circle_right_outlined,
                                                          color: AppColors
                                                              .colorGrey,
                                                          size: screenHeight *
                                                              0.017,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: baseController
                                              .apiMenuMap?['data'][3]
                                                  ['categories']
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth * 0.040,
                                                  right: screenWidth * 0.040),
                                              child: GestureDetector(
                                                onTap: () {
                                                  shopController.subCategoryName
                                                          .value =
                                                      baseController
                                                          .apiMenuMap!['data']
                                                              [3]["categories"]
                                                              [index]["slug"]
                                                          .toString();

                                                  shopController
                                                      .getShopProductData();

                                                  Get.to(() => ShopView(
                                                      title:
                                                          "${baseController.apiMenuMap?['data'][3]["department"]}",
                                                      subTitle:
                                                          "${baseController.apiMenuMap?['data'][3]["categories"][index]["category_name"]}"));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: screenHeight * 0.005,
                                                      bottom:
                                                          screenHeight * 0.005),
                                                  height: screenHeight * 0.10,
                                                  width: screenWidth,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.colorWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.020),
                                                        child: Text(
                                                          baseController
                                                              .apiMenuMap![
                                                                  'data'][3]
                                                                  ["categories"]
                                                                  [index][
                                                                  "category_name"]
                                                              .toString(),
                                                          style: GoogleFonts.yantramanav(
                                                              color: AppColors
                                                                  .colorLightBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.018),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: screenWidth *
                                                              0.040,
                                                        ),
                                                        child: FadeInImage(
                                                            image: NetworkImage(
                                                              IMAGE_HEADER +
                                                                  baseController
                                                                      .apiMenuMap![
                                                                          'data']
                                                                          [3][
                                                                          "categories"]
                                                                          [
                                                                          index]
                                                                          [
                                                                          "image"]
                                                                      .toString(),
                                                            ),
                                                            placeholder:
                                                                const AssetImage(
                                                                    'assets/images/placeholder_image.png'),
                                                            fit: BoxFit.cover,
                                                            imageErrorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Image
                                                                  .asset(
                                                                "assets/images/placeholder_image.png",
                                                                height:
                                                                    screenHeight *
                                                                        0.10,
                                                                width:
                                                                    screenWidth *
                                                                        0.19,
                                                                fit: BoxFit
                                                                    .cover,
                                                              );
                                                            },
                                                            height:
                                                                screenHeight *
                                                                    0.10,
                                                            width: screenWidth *
                                                                0.19),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: screenWidth *
                                                              0.020,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_circle_right_outlined,
                                                          color: AppColors
                                                              .colorGrey,
                                                          size: screenHeight *
                                                              0.017,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                  Visibility(
                      visible: false, child: Text(controller.count.toString()))
                ],
              ))),
    );
  }
}
