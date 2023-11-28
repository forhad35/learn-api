// To parse this JSON data, do
//
//     final bosssendProductDetails = bosssendProductDetailsFromJson(jsonString);

import 'dart:convert';

BosssendProductDetails bosssendProductDetailsFromJson(String str) => BosssendProductDetails.fromJson(json.decode(str));

String bosssendProductDetailsToJson(BosssendProductDetails data) => json.encode(data.toJson());

class BosssendProductDetails {
  bool success;
  Data data;
  String message;
  int status;

  BosssendProductDetails({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory BosssendProductDetails.fromJson(Map<String, dynamic> json) => BosssendProductDetails(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  int id;
  String slug;
  String name;
  String brandId;
  dynamic brandName;
  dynamic typeId;
  String categoryId;
  String categoryName;
  String shortDescription;
  String? longDescription;
  int price;
  String quantity;
  String primaryImage;
  List<dynamic> image;
  List<dynamic> review;
  List<Data>? relatedProduct;
  String? parentCategory;
  int? rating;
  int? ratedBy;

  Data({
    required this.id,
    required this.slug,
    required this.name,
    required this.brandId,
    required this.brandName,
    required this.typeId,
    required this.categoryId,
    required this.categoryName,
    required this.shortDescription,
    this.longDescription,
    required this.price,
    required this.quantity,
    required this.primaryImage,
    required this.image,
    required this.review,
    this.relatedProduct,
    this.parentCategory,
    this.rating,
    this.ratedBy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    brandId: json["brand_id"],
    brandName: json["brand_name"],
    typeId: json["type_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    price: json["price"],
    quantity: json["quantity"],
    primaryImage: json["primary_image"],
    image: List<dynamic>.from(json["image"].map((x) => x)),
    review: List<dynamic>.from(json["review"].map((x) => x)),
    relatedProduct: json["related_product"] == null ? [] : List<Data>.from(json["related_product"]!.map((x) => Data.fromJson(x))),
    parentCategory: json["parent_category"],
    rating: json["rating"],
    ratedBy: json["ratedBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "brand_id": brandId,
    "brand_name": brandName,
    "type_id": typeId,
    "category_id": categoryId,
    "category_name": categoryName,
    "short_description": shortDescription,
    "long_description": longDescription,
    "price": price,
    "quantity": quantity,
    "primary_image": primaryImage,
    "image": List<dynamic>.from(image.map((x) => x)),
    "review": List<dynamic>.from(review.map((x) => x)),
    "related_product": relatedProduct == null ? [] : List<dynamic>.from(relatedProduct!.map((x) => x.toJson())),
    "parent_category": parentCategory,
    "rating": rating,
    "ratedBy": ratedBy,
  };
}
