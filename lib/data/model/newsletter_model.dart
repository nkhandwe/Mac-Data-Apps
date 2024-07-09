import 'dart:convert';

NewsletterModel newsletterModelFromJson(String str) =>
    NewsletterModel.fromJson(json.decode(str));

String newsletterModelToJson(NewsletterModel data) =>
    json.encode(data.toJson());

class NewsletterModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  NewsletterModel({
    this.success,
    this.message,
    this.data,
  });

  factory NewsletterModel.fromJson(Map<String, dynamic> json) =>
      NewsletterModel(
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
  final String? title;
  final String? key;
  String? value;

  Datum({
    this.title,
    this.key,
    this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key": key,
        "value": value,
      };
}
