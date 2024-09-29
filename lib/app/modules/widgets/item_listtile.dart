import 'package:flutter/material.dart';

import '../utill/app_size.dart';

Widget itemListTile(String itemName, String unitPrice) {
  return Container(
      child: ListTile(
    leading: Image.asset(
      "assets/images/placeholder_image.png",
      height: screenHeight * 0.10,
      width: screenWidth * 0.12,
      fit: BoxFit.cover,
    ),
    title: Text("${itemName}"),
    subtitle: Text("${unitPrice}"),
  ));
}
