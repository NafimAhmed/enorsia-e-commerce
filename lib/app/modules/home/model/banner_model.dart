// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  int? status;
  List<Banner>? banner;

  BannerModel({
    this.status,
    this.banner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
      };
}

class Banner {
  int? id;
  String? title;
  String? descriptions;
  String? link;
  String? image;
  dynamic? video;
  int? featured;
  int? status;
  String? createdAt;
  String? updatedAt;

  Banner({
    this.id,
    this.title,
    this.descriptions,
    this.link,
    this.image,
    this.video,
    this.featured,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        descriptions: json["descriptions"],
        link: json["link"],
        image: json["image"],
        video: json["video"],
        featured: json["featured"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "descriptions": descriptions,
        "link": link,
        "image": image,
        "video": video,
        "featured": featured,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
