import 'dart:convert';

PostNewsletterModel postNewsletterModelFromJson(String str) =>
    PostNewsletterModel.fromJson(json.decode(str));

String postNewsletterModelToJson(PostNewsletterModel data) =>
    json.encode(data.toJson());

class PostNewsletterModel {
  final bool? success;
  final String? message;
  final Data? data;

  PostNewsletterModel({
    this.success,
    this.message,
    this.data,
  });

  factory PostNewsletterModel.fromJson(Map<String, dynamic> json) =>
      PostNewsletterModel(
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
  final int? userId;
  final String? title;
  final String? key;
  final String? value;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.title,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        key: json["key"],
        value: json["value"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "key": key,
        "value": value,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
