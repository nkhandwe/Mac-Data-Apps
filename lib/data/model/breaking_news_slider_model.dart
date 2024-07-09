import 'dart:convert';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  final bool? success;
  final String? message;
  final List<NewsData>? data;

  NewsResponse({
    this.success,
    this.message,
    this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NewsData>.from(
                json["data"]!.map((x) => NewsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewsData {
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

  NewsData({
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

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
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
