import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CategoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  final String? style;
  final String? datumClass;
  final String? attributes;
  final int? styleId;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.style,
    this.datumClass,
    this.attributes,
    this.styleId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        style: json["style"],
        datumClass: json["class"],
        attributes: json["attributes"],
        styleId: json["style_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "style": style,
        "class": datumClass,
        "attributes": attributes,
        "style_id": styleId,
      };
}
