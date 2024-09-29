// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  int? status;
  String? message;
  List<Datum>? data;

  CartModel({
     this.status,
     this.message,
     this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
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
  String? rowId;
  String? id;
  int? qty;
  String? name;
  double? price;
  int? weight;
  Options? options;
  int? taxRate;
  String? instance;

  Datum({
     this.rowId,
     this.id,
     this.qty,
     this.name,
     this.price,
     this.weight,
     this.options,
     this.taxRate,
     this.instance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    rowId: json["rowId"],
    id: json["id"],
    qty: json["qty"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    weight: json["weight"],
    options: Options.fromJson(json["options"]),
    taxRate: json["taxRate"],
    instance: json["instance"],
  );

  Map<String, dynamic> toJson() => {
    "rowId": rowId,
    "id": id,
    "qty": qty,
    "name": name,
    "price": price,
    "weight": weight,
    "options": options,
    "taxRate": taxRate,
    "instance": instance,
  };
}

class Options {
  String? image;
  String? styleColorId;
  String? color;
  int? colorId;
  String? productSizeId;
  String? size;
  bool? isKids;
  Product? product;

  Options({
     this.image,
     this.styleColorId,
     this.color,
     this.colorId,
     this.productSizeId,
     this.size,
     this.isKids,
     this.product,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    image: json["image"],
    styleColorId: json["style_color_id"],
    color: json["color"],
    colorId: json["color_id"],
    productSizeId: json["product_size_id"],
    size: json["size"],
    isKids: json["isKids"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "style_color_id": styleColorId,
    "color": color,
    "color_id": colorId,
    "product_size_id": productSizeId,
    "size": size,
    "isKids": isKids,
    "product": product,
  };
}

class Product {
  int? id;
  int? styleDesignId;
  String? productName;
  dynamic? labels;
  dynamic? tags;
  String? sku;
  String? shortDescription;
  dynamic? longDescription;
  int? isFeatured;
  String? care;
  String? fabric;
  dynamic? neckline;
  String? featuredImage;
  dynamic? video;
  dynamic? youtubeVideo;
  dynamic? videoThumbnail;
  int? status;
  int? createdBy;
  int? updatedBy;
  String?  lastUpdatedAt;
  String? slug;
  dynamic? discountPrice;
  int? discountPriceStatus;
  dynamic stockClearancePrice;
  int? stockClearancePriceStatus;
  dynamic? discountPriceUpdatedBy;
  dynamic? discountPriceUpdatedAt;
  String? createdAt;
  String?  updatedAt;
  ProductDetail? productDetail;

  Product({
     this.id,
     this.styleDesignId,
     this.productName,
     this.labels,
     this.tags,
     this.sku,
     this.shortDescription,
     this.longDescription,
     this.isFeatured,
     this.care,
     this.fabric,
     this.neckline,
     this.featuredImage,
     this.video,
     this.youtubeVideo,
     this.videoThumbnail,
     this.status,
     this.createdBy,
     this.updatedBy,
     this.lastUpdatedAt,
     this.slug,
     this.discountPrice,
     this.discountPriceStatus,
     this.stockClearancePrice,
     this.stockClearancePriceStatus,
     this.discountPriceUpdatedBy,
     this.discountPriceUpdatedAt,
     this.createdAt,
     this.updatedAt,
     this.productDetail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    styleDesignId: json["style_design_id"],
    productName: json["product_name"],
    labels: json["labels"],
    tags: json["tags"],
    sku: json["sku"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    isFeatured: json["is_featured"],
    care: json["care"],
    fabric: json["fabric"],
    neckline: json["neckline"],
    featuredImage: json["featured_image"],
    video: json["video"],
    youtubeVideo: json["youtube_video"],
    videoThumbnail: json["video_thumbnail"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    lastUpdatedAt: json["last_updated_at"],
    slug: json["slug"],
    discountPrice: json["discount_price"],
    discountPriceStatus: json["discount_price_status"],
    stockClearancePrice: json["stock_clearance_price"],
    stockClearancePriceStatus: json["stock_clearance_price_status"],
    discountPriceUpdatedBy: json["discount_price_updated_by"],
    discountPriceUpdatedAt: json["discount_price_updated_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    productDetail: json["product_detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "style_design_id": styleDesignId,
    "product_name": productName,
    "labels": labels,
    "tags": tags,
    "sku": sku,
    "short_description": shortDescription,
    "long_description": longDescription,
    "is_featured": isFeatured,
    "care": care,
    "fabric": fabric,
    "neckline": neckline,
    "featured_image": featuredImage,
    "video": video,
    "youtube_video": youtubeVideo,
    "video_thumbnail": videoThumbnail,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "last_updated_at": lastUpdatedAt,
    "slug": slug,
    "discount_price": discountPrice,
    "discount_price_status": discountPriceStatus,
    "stock_clearance_price": stockClearancePrice,
    "stock_clearance_price_status": stockClearancePriceStatus,
    "discount_price_updated_by": discountPriceUpdatedBy,
    "discount_price_updated_at": discountPriceUpdatedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "product_detail": productDetail!.toJson(),
  };
}

class ProductDetail {
  int id;
  int styleDesignId;
  int departmentId;
  String itemNo;
  String styleDescription;
  String styleDescriptionText;
  int fabricId;
  int productCategoryId;
  dynamic productImage;
  dynamic internetDescription;
  int discountPriceStatus;
  int stockClearancePriceStatus;
  DateTime createdAt;
  DateTime updatedAt;

  ProductDetail({
    required this.id,
    required this.styleDesignId,
    required this.departmentId,
    required this.itemNo,
    required this.styleDescription,
    required this.styleDescriptionText,
    required this.fabricId,
    required this.productCategoryId,
    required this.productImage,
    required this.internetDescription,
    required this.discountPriceStatus,
    required this.stockClearancePriceStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    styleDesignId: json["style_design_id"],
    departmentId: json["department_id"],
    itemNo: json["item_no"],
    styleDescription: json["style_description"],
    styleDescriptionText: json["style_description_text"],
    fabricId: json["fabric_id"],
    productCategoryId: json["product_category_id"],
    productImage: json["product_image"],
    internetDescription: json["internet_description"],
    discountPriceStatus: json["discount_price_status"],
    stockClearancePriceStatus: json["stock_clearance_price_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "style_design_id": styleDesignId,
    "department_id": departmentId,
    "item_no": itemNo,
    "style_description": styleDescription,
    "style_description_text": styleDescriptionText,
    "fabric_id": fabricId,
    "product_category_id": productCategoryId,
    "product_image": productImage,
    "internet_description": internetDescription,
    "discount_price_status": discountPriceStatus,
    "stock_clearance_price_status": stockClearancePriceStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
