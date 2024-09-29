// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  int? status;
  String? message;
  List<Datum>? data;

  SliderModel({
    this.status,
    this.message,
    this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
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
  int? id;
  String? title;
  String? link;
  String? image;
  int? sequence;
  String? target;
  int? status;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.title,
    this.link,
    this.image,
    this.sequence,
    this.target,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        image: json["image"],
        sequence: json["sequence"],
        target: json["target"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "image": image,
        "sequence": sequence,
        "target": target,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
