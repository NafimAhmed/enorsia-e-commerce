import 'package:flutter/material.dart';

import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../../widgets/offer_tile.dart';

class OfferView extends StatelessWidget {
  const OfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.12),
              child: customGeneralAPPBar("Offers")),
          body: getOfferTile("account"),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Obx(() => controller.isOfferLoading.value == true
          //       ? Center(
          //           child: Lottie.asset("assets/json/loading.json",
          //               fit: BoxFit.cover,
          //               height: screenHeight * 0.095,
          //               width: screenWidth * 0.095),
          //         )
          //       :
          //   ListView.builder(
          //           shrinkWrap: true,
          //           itemCount: 1,
          //           itemBuilder: (context, index) {
          //             return GestureDetector(
          //               onTap: () {
          //                 shopController.slug.value == "";
          //                 shopController.subCategoryName.value = "";
          //                 shopController.getDiscountShopProductData();
          //                 Get.to(() => ShopView());
          //               },
          //               child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(12.0),
          //                   child: FadeInImage(
          //                     image: NetworkImage(IMAGE_HEADER +
          //                         controller.apiOfferMap!["data"]
          //                                 ["discount_banner_image"]
          //                             .toString()),
          //                     placeholder: const AssetImage(
          //                         'assets/images/placeholder_image.png'),
          //                     fit: BoxFit.cover,
          //                     imageErrorBuilder: (context, error, stackTrace) {
          //                       return Image.asset(
          //                         "assets/images/placeholder_image.png",
          //                         height: screenHeight * 0.18,
          //                         width: screenWidth,
          //                         fit: BoxFit.cover,
          //                       );
          //                     },
          //                     height: screenHeight * 0.18,
          //                     width: screenWidth,
          //                   )),
          //             );
          //           })
          //   ),
          // ),
        ),
      ),
    );
  }
}
