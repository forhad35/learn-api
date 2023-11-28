// To parse this JSON data, do
//
//     final allCategoryBdWash = allCategoryBdWashFromJson(jsonString);

import 'dart:convert';

AllCategoryBdWash allCategoryBdWashFromJson(String str) => AllCategoryBdWash.fromJson(json.decode(str));

String allCategoryBdWashToJson(AllCategoryBdWash data) => json.encode(data.toJson());

class AllCategoryBdWash {
  bool success;
  List<Datum> data;
  String message;
  int statusCode;

  AllCategoryBdWash({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
  });

  factory AllCategoryBdWash.fromJson(Map<String, dynamic> json) => AllCategoryBdWash(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status_code": statusCode,
  };
}

class Datum {
  int id;
  String name;
  String position;
  List<Product> products;

  Datum({
    required this.id,
    required this.name,
    required this.position,
    required this.products,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    position: json["position"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String name;
  int price;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "image": image,
  };
}
