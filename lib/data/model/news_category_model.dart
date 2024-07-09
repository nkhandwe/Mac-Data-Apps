import 'dart:convert';

NewsCategoryModel newsCategoryModelFromJson(String str) =>
    NewsCategoryModel.fromJson(json.decode(str));

String newsCategoryModelToJson(NewsCategoryModel data) =>
    json.encode(data.toJson());

class NewsCategoryModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  NewsCategoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) =>
      NewsCategoryModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? title;
  final String? slug;
  final int? order;
  final int? statusId;
  final int? parentId;
  final List<Datum>? childCategory;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.order,
    this.statusId,
    this.parentId,
    this.childCategory,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        order: json["order"],
        statusId: json["status_id"],
        parentId: json["parent_id"],
        childCategory: json["child_category"] == null
            ? []
            : List<Datum>.from(
                json["child_category"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "order": order,
        "status_id": statusId,
        "parent_id": parentId,
        "child_category": childCategory == null
            ? []
            : List<dynamic>.from(childCategory!.map((x) => x.toJson())),
      };
}
