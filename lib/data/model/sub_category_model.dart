// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
  final bool? success;
  final String? message;
  final Data? data;

  SubCategoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final List<Slider>? slider;
  final List<Slider>? nonSlider;

  Data({
    this.slider,
    this.nonSlider,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    slider: json["slider"] == null ? [] : List<Slider>.from(json["slider"]!.map((x) => Slider.fromJson(x))),
    nonSlider: json["nonSlider"] == null ? [] : List<Slider>.from(json["nonSlider"]!.map((x) => Slider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "slider": slider == null ? [] : List<dynamic>.from(slider!.map((x) => x.toJson())),
    "nonSlider": nonSlider == null ? [] : List<dynamic>.from(nonSlider!.map((x) => x.toJson())),
  };
}

class Slider {
  final int? id;
  final String? title;
  final String? slug;
  final String? subTitle;
  final String? tags;
  final String? content;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaKeywords;
  final String? updatedAt;
  final String? author;
  final String? url;
  final String? pathSmall;
  final String? pathMedium;
  final String? pathLarge;
  final String? loading;
  final String? status;
  final String? category;

  Slider({
    this.id,
    this.title,
    this.slug,
    this.subTitle,
    this.tags,
    this.content,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.updatedAt,
    this.author,
    this.url,
    this.pathSmall,
    this.pathMedium,
    this.pathLarge,
    this.loading,
    this.status,
    this.category,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    subTitle: json["sub_title"],
    tags: json["tags"],
    content: json["content"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    updatedAt: json["updated_at"],
    author: json["author"],
    url: json["url"],
    pathSmall: json["path_small"],
    pathMedium: json["path_medium"],
    pathLarge: json["path_large"],
    loading: json["loading"],
    status: json["status"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "sub_title": subTitle,
    "tags": tags,
    "content": content,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "updated_at": updatedAt,
    "author": author,
    "url": url,
    "path_small": pathSmall,
    "path_medium": pathMedium,
    "path_large": pathLarge,
    "loading": loading,
    "status": status,
    "category": category,
  };
}

