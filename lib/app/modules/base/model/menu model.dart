// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  int status;
  String message;
  List<Datum> data;

  MenuModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String department;
  List<Category> categories;

  Datum({
    required this.department,
    required this.categories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        department: json["department"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  int departmentId;
  String categoryName;
  String image;
  String slug;

  Category({
    required this.id,
    required this.departmentId,
    required this.categoryName,
    required this.image,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        departmentId: json["department_id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department_id": departmentId,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
      };
}
