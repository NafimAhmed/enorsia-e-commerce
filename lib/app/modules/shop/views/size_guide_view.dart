import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../utill/app_size.dart';
import '../../widgets/general_appbar.dart';
import '../controllers/shop_controller.dart';

class SizeGuideView extends StatelessWidget {
  SizeGuideView({Key? key}) : super(key: key);

  ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.12),
          child: customGeneralAPPBar("Size Guide")),
      body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Html(
                  shrinkWrap: true,
                  data: shopController.apiShopProductDetailMap!["data"]
                          ["sizeGuide"]["size_guide"]
                      .toString(),
                  style: {
                    "*": Style(
                      fontSize: FontSize(6.0),
                    ),
                  },
                );
              })),
    ));
  }
}
