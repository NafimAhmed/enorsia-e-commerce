// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

// import 'dart:convert';
//
// TrendingModel trendingModelFromJson(String str) =>
//     TrendingModel.fromJson(json.decode(str));
//
// String trendingModelToJson(TrendingModel data) => json.encode(data.toJson());
//
// class TrendingModel {
//   int? status;
//   String? message;
//   List<Datum>? data;
//
//   TrendingModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class Datum {
//   int? id;
//   dynamic? title;
//   String? link;
//   String? image;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? video;
//   int? videoStatus;
//
//   Datum({
//     this.id,
//     this.title,
//     this.link,
//     this.image,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.video,
//     this.videoStatus,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         title: json["title"],
//         link: json["link"],
//         image: json["image"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         video: json["video"],
//         videoStatus: json["video_status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "link": link,
//         "image": image,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "video": video,
//         "video_status": videoStatus,
//       };
// }



// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? status;
  String? message;
  List<Product>? product;
  Heading? heading;

  ProductModel({
     this.status,
     this.message,
     this.product,
     this.heading,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    message: json["message"],
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    heading: Heading.fromJson(json["heading"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "product": List<dynamic>.from(product!.map((x) => x.toJson())),
    "heading": heading,
  };
}

class Heading {
  String? title;
  String? subtitle;
  String? linktext;
  String? link;

  Heading({
     this.title,
     this.subtitle,
     this.linktext,
     this.link,
  });

  factory Heading.fromJson(Map<String, dynamic> json) => Heading(
    title: json["title"],
    subtitle: json["subtitle"],
    linktext: json["linktext"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "linktext": linktext,
    "link": link,
  };
}

class Product {
  String pImg;
  String pName;
  String pSlug;

  Product({
    required this.pImg,
    required this.pName,
    required this.pSlug,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    pImg: json["p_img"],
    pName: json["p_name"],
    pSlug: json["p_slug"],
  );

  Map<String, dynamic> toJson() => {
    "p_img": pImg,
    "p_name": pName,
    "p_slug": pSlug,
  };
}

