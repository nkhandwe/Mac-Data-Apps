import 'dart:convert';

InterestedTopicModel interestedTopicModelFromJson(String str) =>
    InterestedTopicModel.fromJson(json.decode(str));

String interestedTopicModelToJson(InterestedTopicModel data) =>
    json.encode(data.toJson());

class InterestedTopicModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  InterestedTopicModel({
    this.success,
    this.message,
    this.data,
  });

  factory InterestedTopicModel.fromJson(Map<String, dynamic> json) =>
      InterestedTopicModel(
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
  final String? image;
  bool? isMyInterested;

  Datum({
    this.id,
    this.title,
    this.image,
    this.isMyInterested,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        isMyInterested: json["is_my_interested"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "is_my_interested": isMyInterested,
      };
}
