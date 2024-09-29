// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? status;
  String? message;
  Data? data;

  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  List<SCategory>? womensCategory;
  List<SCategory>? mensCategory;
  List<SCategory>? girlsCategory;
  List<SCategory>? boysCategory;

  Data({
    this.womensCategory,
    this.mensCategory,
    this.girlsCategory,
    this.boysCategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        womensCategory: List<SCategory>.from(
            json["womensCategory"].map((x) => SCategory.fromJson(x))),
        mensCategory: List<SCategory>.from(
            json["mensCategory"].map((x) => SCategory.fromJson(x))),
        girlsCategory: List<SCategory>.from(
            json["girlsCategory"].map((x) => SCategory.fromJson(x))),
        boysCategory: List<SCategory>.from(
            json["boysCategory"].map((x) => SCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "womensCategory":
            List<dynamic>.from(womensCategory!.map((x) => x.toJson())),
        "mensCategory":
            List<dynamic>.from(mensCategory!.map((x) => x.toJson())),
        "girlsCategory":
            List<dynamic>.from(girlsCategory!.map((x) => x.toJson())),
        "boysCategory":
            List<dynamic>.from(boysCategory!.map((x) => x.toJson())),
      };
}

class SCategory {
  int? id;
  int? departmentId;
  int? categoryId;
  String? categoryName;
  String? image;
  String? slug;
  int? isRight;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? sizeGuide;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? metaH1;

  SCategory({
    this.id,
    this.departmentId,
    this.categoryId,
    this.categoryName,
    this.image,
    this.slug,
    this.isRight,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.sizeGuide,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.metaH1,
  });

  factory SCategory.fromJson(Map<String, dynamic> json) => SCategory(
        id: json["id"],
        departmentId: json["department_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        isRight: json["isRight"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sizeGuide: json["size_guide"],
        metaTitle: json["meta_title"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        metaH1: json["meta_h1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department_id": departmentId,
        "category_id": categoryId,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
        "isRight": isRight,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "size_guide": sizeGuide,
        "meta_title": metaTitle,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "meta_h1": metaH1,
      };
}
