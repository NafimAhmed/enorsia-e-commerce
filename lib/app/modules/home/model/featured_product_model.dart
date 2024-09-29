// To parse this JSON data, do
//
//     final featuredProductModel = featuredProductModelFromJson(jsonString);

import 'dart:convert';

FeaturedProductModel featuredProductModelFromJson(String str) =>
    FeaturedProductModel.fromJson(json.decode(str));

String featuredProductModelToJson(FeaturedProductModel data) =>
    json.encode(data.toJson());

class FeaturedProductModel {
  int? status;
  String? message;
  List<Datum>? data;

  FeaturedProductModel({
    this.status,
    this.message,
    this.data,
  });

  factory FeaturedProductModel.fromJson(Map<String, dynamic> json) =>
      FeaturedProductModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  // int? id;
  // int? deptId;
  String? image;
  dynamic? serial;
  String? slug;
  // int? isFeatured;
  // int? status;
  // String? createdAt;
  // String? updatedAt;
  // String? metaTitle;
  // String? metaKeyword;
  // String? metaDescription;
  // String? metaH1;
  // Department? department;

  Datum({
    // this.id,
    // this.deptId,
    this.image,
    this.serial,
    this.slug,
    // this.isFeatured,
    // this.status,
    // this.createdAt,
    // this.updatedAt,
    // this.metaTitle,
    // this.metaKeyword,
    // this.metaDescription,
    // this.metaH1,
    // this.department,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        // id: json["id"],
        // deptId: json["dept_id"],
        image: json["image"],
        serial: json["serial"],
        slug: json["slug"],
        // isFeatured: json["isFeatured"],
        // status: json["status"],
        // createdAt: json["created_at"] == null ? null : json["created_at"],
        // updatedAt: json["updated_at"],
        // metaTitle: json["meta_title"],
        // metaKeyword: json["meta_keyword"],
        // metaDescription: json["meta_description"],
        // metaH1: json["meta_h1"],
        // department: Department.fromJson(json["department"]),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "dept_id": deptId,
        "image": image,
        "serial": serial,
        "slug": slug,
        // "isFeatured": isFeatured,
        // "status": status,
        // "created_at": createdAt,
        // "updated_at": updatedAt,
        // "meta_title": metaTitle,
        // "meta_keyword": metaKeyword,
        // "meta_description": metaDescription,
        // "meta_h1": metaH1,
        // "department": department!.toJson(),
      };
}

class Department {
  int? id;
  String? name;
  int? typeId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Department({
    this.id,
    this.name,
    this.typeId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        typeId: json["type_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type_id": typeId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
