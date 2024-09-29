import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utill/app_colors.dart';
import '../../utill/app_size.dart';
import '../../utill/constant.dart';
import '../../widgets/categoryBanner.dart';
import '../../widgets/custom_home_appbar.dart';
import '../../widgets/offer_tile.dart';
import '../../widgets/product_list.dart';
import '../../widgets/simmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List<String> sliderList = [
    "assets/images/placeholder_image.png",
    "assets/images/placeholder_image.png",
    "assets/images/placeholder_image.png",
  ];

  HomeController allBookController = Get.put(HomeController());

  var currentBannerPosition = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.10),
              child: customHomeAPPBar()),
          body: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Obx(
              () => controller.isLoading.value == true
                  ? Center(
                      child: Lottie.asset("assets/json/loading.json",
                          fit: BoxFit.cover,
                          height: screenHeight * 0.095,
                          width: screenWidth * 0.095),
                    )
                  : RefreshIndicator(
                      onRefresh: _onRefreshDataLoad,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // SizedBox(
                            //   width: screenWidth,
                            //   child: const Divider(
                            //     color: AppColors.colorLightBlack,
                            //     thickness: 1.0,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.010,
                            // ),

                            SizedBox(
                              height: screenHeight * 0.010,
                            ),

                            Stack(
                              children: [
                                getTopBannerSlider(),
                                Positioned(
                                  bottom: screenHeight * 0.020,
                                  left: screenWidth * 0.050,
                                  child: buildBannerDot(
                                      controller.slider.value.data!.length),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Featured Products",
                            //       style: GoogleFonts.ruluko(
                            //           fontSize: screenHeight * 0.020,
                            //           fontWeight: FontWeight.bold),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            // Container(
                            //   width: screenWidth,
                            //   height: screenHeight * .20,
                            //   child: Image.asset(
                            //     "assets/images/featture.jpeg",
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "FEATURED PRODUCT",
                            //       style: GoogleFonts.abel(
                            //           fontSize: screenHeight * 0.024,
                            //           fontWeight: FontWeight.bold),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            //
                            // SizedBox(
                            //     height: screenHeight * 0.27,
                            //     width: screenWidth,
                            //     child: featureProductList(controller)),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            getOfferTile("home"),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "DEPARTMENT",
                            //       style: GoogleFonts.imprima(
                            //           fontSize: screenHeight * 0.020,
                            //           fontWeight: FontWeight.bold),
                            //     )
                            //   ],
                            // ),
                            //
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            // SizedBox(
                            //     height: screenHeight * 0.27,
                            //     width: screenWidth,
                            //     child: categoryList(controller)),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            SizedBox(
                                height: screenHeight * 0.27,
                                width: screenWidth,
                                child: categoryBanner(controller, "women")),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "WOMEN CATEGORY",
                                  style: GoogleFonts.ruluko(
                                      fontSize: screenHeight * 0.020,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.30,
                                width: screenWidth,
                                child: productList("women", controller)),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            getMiddleBanner(),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            SizedBox(
                                height: screenHeight * 0.27,
                                width: screenWidth,
                                child: categoryBanner(controller, "men")),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "MEN CATEGORY",
                                  style: GoogleFonts.ruluko(
                                      fontSize: screenHeight * 0.020,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.30,
                                width: screenWidth,
                                child: productList("men", controller)),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.27,
                                width: screenWidth,
                                child: categoryBanner(controller, "boy")),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "BOY CATEGORY",
                                  style: GoogleFonts.ruluko(
                                      fontSize: screenHeight * 0.020,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.32,
                                width: screenWidth,
                                child: productList("boy", controller)),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.27,
                                width: screenWidth,
                                child: categoryBanner(controller, "girl")),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "GIRL CATEGORY",
                                  style: GoogleFonts.ruluko(
                                      fontSize: screenHeight * 0.020,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            SizedBox(
                                height: screenHeight * 0.30,
                                width: screenWidth,
                                child: productList("girl", controller)),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            // Column(
                            //   children: [
                            //     Text(
                            //       "Trending",
                            //       style: GoogleFonts.ruluko(
                            //           fontWeight: FontWeight.w600,
                            //           fontSize: screenHeight * 0.020),
                            //     ),
                            //     SizedBox(
                            //       height: screenHeight * 0.010,
                            //     ),
                            //     Text(
                            //       "Stylish and trendy outfit for any occasion",
                            //       style: GoogleFonts.ruluko(
                            //           fontSize: screenHeight * 0.017),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                            // SizedBox(
                            //     height: screenHeight * 0.18,
                            //     width: screenWidth,
                            //     child: trendingList(controller)),
                            //
                            // SizedBox(
                            //   height: screenHeight * 0.024,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Finds us on",
                            //       style: GoogleFonts.poppins(
                            //           fontSize: screenHeight * 0.030),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.012,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://www.facebook.com/profile.php?id=100092393922299");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/facebook.svg",
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: screenWidth * 0.020,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://twitter.com/InfoEnorsia");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/twitter.svg",
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: screenWidth * 0.020,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://www.instagram.com/enorsia_info/ ");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/instagram.svg",
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: screenWidth * 0.020,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://www.youtube.com/channel/UCnei9_JdGE-VxU34gTNA_zw");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/youtube.svg",
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: screenWidth * 0.020,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://www.tiktok.com/@infoenorsia");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/tiktok-logo.svg",
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: screenWidth * 0.020,
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         redirectToSocialLink(
                            //             "https://www.pinterest.com/infoenorsia/ ");
                            //       },
                            //       child: SvgPicture.asset(
                            //         "assets/images/pinterest_logo.svg",
                            //         color: Colors.black,
                            //         height: screenHeight * 0.030,
                            //         width: screenWidth * 0.070,
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.015,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 20.0, right: 20.0),
                            //   child: SizedBox(
                            //     width: screenWidth,
                            //     child: const Divider(
                            //       color: AppColors.colorGrey,
                            //       thickness: 1.0,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: screenHeight * 0.020,
                            // ),
                          ],
                        ),
                      ),
                    ),
            ),
          )),
    );
  }

  Widget getTopBannerSlider() {
    return Obx(() => CarouselSlider.builder(
        itemCount: controller.slider.value.data!.length,
        itemBuilder: (context, index, realIndex) {
          var imageUrl = controller.slider.value.data![index].image.toString();
          return buildBannerImage(imageUrl, index);
        },
        options: CarouselOptions(
          aspectRatio: screenWidth / (screenHeight * 0.5),
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          onPageChanged: (index, realReason) {
            currentBannerPosition.value = index;
          },
        )));
  }

  Future<void> redirectToSocialLink(String url) async {
    try {
      // if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
      // }
      // else {
      throw 'Could not join';
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget buildBannerImage(String url, int index) {
    return Stack(
      children: [
        ShimmerLoader(
          child: Container(
            color: Colors.white,
            height: screenHeight / 2,
          ),
        ),
        Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Colors.black,
            ),
            child: FadeInImage(
              image: NetworkImage(IMAGE_HEADER + url),
              height: screenHeight / 2 + 100,
              placeholder:
                  const AssetImage('assets/images/transparent_background.png'),
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/transparent_background.png",
                );
              },
            )
            // url.contains(".mp4")
            //     ? YoutubePlayer(
            //         controller: YoutubePlayerController(
            //           initialVideoId:
            //               YoutubePlayer.convertUrlToId(IMAGE_HEADER + url)!,
            //           flags: const YoutubePlayerFlags(
            //             controlsVisibleAtStart: false,
            //             hideControls: true,
            //             autoPlay: true,
            //             mute: true,
            //           ),
            //           // Place additional customization options here
            //         ),
            //         showVideoProgressIndicator: true,
            //       )
            //     : FadeInImage(
            //         image: NetworkImage(IMAGE_HEADER + url),
            //         placeholder:
            //             const AssetImage('assets/images/placeholder_image.png'),
            //         fit: BoxFit.cover,
            //         imageErrorBuilder: (context, error, stackTrace) {
            //           return Image.asset(
            //             "assets/images/placeholder_image.png",
            //           );
            //         },
            //
            //       )
            ),
      ],
    );
  }

  Widget buildBannerDot(int length) => Obx(() => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: currentBannerPosition.value,
          count: length,
          effect: ScrollingDotsEffect(
            dotColor: AppColors.colorLightGrey,
            activeDotColor: AppColors.colorLightBlack,
            spacing: screenWidth * 0.15,
            dotHeight: 5,
            dotWidth: 60,
          ),
        ),
      ));

  Widget getMiddleBanner() {
    return Obx(() => SizedBox(
        width: screenWidth,
        height: screenHeight / 2,
        child: controller.isBannerLoading.value == true
            ? Center(
                child: Lottie.asset("assets/json/loading.json",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.095,
                    width: screenWidth * 0.095),
              )
            : FadeInImage(
                image: NetworkImage(IMAGE_HEADER +
                    controller.banner.value.banner![0].image.toString()),
                placeholder:
                    const AssetImage('assets/images/placeholder_image.png'),
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/placeholder_image.png",
                  );
                },
              )));
  }

  Future<void> _onRefreshDataLoad() async {
    // Future.delayed(const Duration(seconds: 3));
    controller.fetchSlider();
    controller.fetchBanner();
    controller.fetchCategoryProduct();
  }
}
