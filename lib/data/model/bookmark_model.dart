import 'dart:convert';

BookmarkModel bookmarkModelFromJson(String str) =>
    BookmarkModel.fromJson(json.decode(str));

String bookmarkModelToJson(BookmarkModel data) => json.encode(data.toJson());

class BookmarkModel {
  final bool? success;
  final String? message;
  final Data? data;

  BookmarkModel({
    this.success,
    this.message,
    this.data,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
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
  final int? id;
  final int? newsId;
  final int? newsTranslationId;
  final int? userId;
  final int? isBookmarked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.newsId,
    this.newsTranslationId,
    this.userId,
    this.isBookmarked,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        newsId: json["news_id"],
        newsTranslationId: json["news_translation_id"],
        userId: json["user_id"],
        isBookmarked: json["is_bookmarked"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "news_id": newsId,
        "news_translation_id": newsTranslationId,
        "user_id": userId,
        "is_bookmarked": isBookmarked,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
