// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  DashboardModel({
    this.success,
    this.message,
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? title;
  final int? count;

  Datum({
    this.title,
    this.count,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "count": count,
  };
}
