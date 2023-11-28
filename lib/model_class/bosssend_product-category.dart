// To parse this JSON data, do
//
//     final allCategoryBosssend = allCategoryBosssendFromJson(jsonString);

import 'dart:convert';

AllCategoryBosssend allCategoryBosssendFromJson(String str) => AllCategoryBosssend.fromJson(json.decode(str));

String allCategoryBosssendToJson(AllCategoryBosssend data) => json.encode(data.toJson());

class AllCategoryBosssend {
  bool success;
  List<Datum> data;
  String message;
  int status;

  AllCategoryBosssend({
    required this.success,
    required this.data,
    required this.message,
    required this.status,
  });

  factory AllCategoryBosssend.fromJson(Map<String, dynamic> json) => AllCategoryBosssend(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Datum {
  int id;
  String name;
  dynamic description;
  dynamic parentId;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.parentId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "parent_id": parentId,
  };
}
