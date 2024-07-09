import 'dart:convert';

PostCommentModel postCommentModelFromJson(String str) => PostCommentModel.fromJson(json.decode(str));

String postCommentModelToJson(PostCommentModel data) => json.encode(data.toJson());

class PostCommentModel {
  final bool? success;
  final Data? data;
  final String? message;

  PostCommentModel({
    this.success,
    this.data,
    this.message,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) => PostCommentModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  final int? newsId;
  final int? userId;
  final String? content;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.newsId,
    this.userId,
    this.content,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    newsId: json["news_id"],
    userId: json["user_id"],
    content: json["content"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "news_id": newsId,
    "user_id": userId,
    "content": content,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
