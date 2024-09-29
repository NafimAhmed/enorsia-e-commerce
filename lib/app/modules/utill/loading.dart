import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoader() {
  EasyLoading.show(status: 'Loading...');
}

void configLoader() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.amber
    ..textColor = Colors.black;
}

void dismissLoader() {
  EasyLoading.dismiss();
}
