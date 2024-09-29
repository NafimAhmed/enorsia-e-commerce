import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utill/app_size.dart';

class FilterDetailSizeStyle extends StatelessWidget {
  final Map<String, dynamic>? apiProductMap;

  //FilterDetailSizeStyle({super.key, this.apiShopProductMap});

  const FilterDetailSizeStyle({super.key, required this.apiProductMap});

  @override
  Widget build(BuildContext context) {
    RxString size = "${apiProductMap?["size"][0]["size"]}".obs;

    return Scaffold(
        body: Column(
      children: [
        Obx(
          () => size.value != null
              ? ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: apiProductMap?["size"]
                      .length, //shopController.apiProductSizeMap?["size"].length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      activeColor: Colors.red,
                      title: Text(
                        "${apiProductMap?["size"][index]["size"]}",
                        style: GoogleFonts.yantramanav(
                            fontSize: screenHeight * 0.020),
                      ),
                      value: "${apiProductMap?["size"][index]["size"]}",
                      groupValue: size.value,
                      onChanged: (value) {
                        size.value = value.toString();
                        // setState(() {
                        //   size = value.toString();
                        // });
                      },
                    ); //Text("${apiProductSizeMap?["size"][index]["size"]}");
                  })
              : const Text("no item found"),
        )
      ],
    ));
  }
}
