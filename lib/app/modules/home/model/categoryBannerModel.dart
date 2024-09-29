// To parse this JSON data, do
//
//     final categoryBanner = categoryBannerFromJson(jsonString);

import 'dart:convert';

CategoryBanner categoryBannerFromJson(String str) =>
    CategoryBanner.fromJson(json.decode(str));

String categoryBannerToJson(CategoryBanner data) => json.encode(data.toJson());

class CategoryBanner {
  int? status;
  String? message;
  Data? data;

  CategoryBanner({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryBanner.fromJson(Map<String, dynamic> json) => CategoryBanner(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  SCategoryImages? womensCategoryImages;
  SCategoryImages? mensCategoryImages;
  SCategoryImages? girlsCategoryImages;
  SCategoryImages? boysCategoryImages;

  Data({
    this.womensCategoryImages,
    this.mensCategoryImages,
    this.girlsCategoryImages,
    this.boysCategoryImages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        womensCategoryImages:
            SCategoryImages.fromJson(json["womensCategoryImages"]),
        mensCategoryImages:
            SCategoryImages.fromJson(json["mensCategoryImages"]),
        girlsCategoryImages:
            SCategoryImages.fromJson(json["girlsCategoryImages"]),
        boysCategoryImages:
            SCategoryImages.fromJson(json["boysCategoryImages"]),
      );

  Map<String, dynamic> toJson() => {
        "womensCategoryImages": womensCategoryImages!.toJson(),
        "mensCategoryImages": mensCategoryImages!.toJson(),
        "girlsCategoryImages": girlsCategoryImages!.toJson(),
        "boysCategoryImages": boysCategoryImages!.toJson(),
      };
}

class SCategoryImages {
  String? leftImage;
  String? rightImage;
  String? middleImage;

  SCategoryImages({
    required this.leftImage,
    required this.rightImage,
    required this.middleImage,
  });

  factory SCategoryImages.fromJson(Map<String, dynamic> json) =>
      SCategoryImages(
        leftImage: json["left_image"],
        rightImage: json["right_image"],
        middleImage: json["middle_image"],
      );

  Map<String, dynamic> toJson() => {
        "left_image": leftImage,
        "right_image": rightImage,
        "middle_image": middleImage,
      };
}
