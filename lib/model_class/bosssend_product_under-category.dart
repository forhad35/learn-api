// To parse this JSON data, do
//
//     final bosssendUnderCategory = bosssendUnderCategoryFromJson(jsonString);

import 'dart:convert';

BosssendUnderCategory bosssendUnderCategoryFromJson(String str) => BosssendUnderCategory.fromJson(json.decode(str));

String bosssendUnderCategoryToJson(BosssendUnderCategory data) => json.encode(data.toJson());

class BosssendUnderCategory {
  bool success;
  Data data;
  String message;
  int status;

  BosssendUnderCategory({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory BosssendUnderCategory.fromJson(Map<String, dynamic> json) => BosssendUnderCategory(
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
  List<Datum> data;
  Links links;
  Meta meta;

  Data({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  int id;
  String slug;
  String name;
  String brandId;
  dynamic brandName;
  dynamic typeId;
  String categoryId;
  String categoryName;
  String parentCategory;
  String shortDescription;
  int price;
  String quantity;
  List<Review> review;
  int rating;
  int ratedBy;
  String primaryImage;
  List<dynamic> image;

  Datum({
    required this.id,
    required this.slug,
    required this.name,
    required this.brandId,
    required this.brandName,
    required this.typeId,
    required this.categoryId,
    required this.categoryName,
    required this.parentCategory,
    required this.shortDescription,
    required this.price,
    required this.quantity,
    required this.review,
    required this.rating,
    required this.ratedBy,
    required this.primaryImage,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    brandId: json["brand_id"],
    brandName: json["brand_name"],
    typeId: json["type_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    parentCategory: json["parent_category"],
    shortDescription: json["short_description"],
    price: json["price"],
    quantity: json["quantity"],
    review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
    rating: json["rating"],
    ratedBy: json["ratedBy"],
    primaryImage: json["primary_image"],
    image: List<dynamic>.from(json["image"].map((x) => x)),
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
    "parent_category": parentCategory,
    "short_description": shortDescription,
    "price": price,
    "quantity": quantity,
    "review": List<dynamic>.from(review.map((x) => x.toJson())),
    "rating": rating,
    "ratedBy": ratedBy,
    "primary_image": primaryImage,
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}

class Review {
  int id;
  String rating;
  String customerName;
  String customerImage;
  String comments;

  Review({
    required this.id,
    required this.rating,
    required this.customerName,
    required this.customerImage,
    required this.comments,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    rating: json["rating"],
    customerName: json["customer_name"],
    customerImage: json["customer_image"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "customer_name": customerName,
    "customer_image": customerImage,
    "comments": comments,
  };
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
