import 'dart:convert';

import 'package:flutter/material.dart';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  final bool? success;
  final String? message;
  final List<CountryData>? data;

  CountryModel({
    this.success,
    this.message,
    this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CountryData>.from(
                json["data"]!.map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CountryData {
  final int? id;
  final String? code;
  final String? name;
  final String? iso3;

  CountryData({
    this.id,
    this.code,
    this.name,
    this.iso3,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        iso3: json["iso3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "iso3": iso3,
      };

  map(DropdownMenuItem<CountryData> Function(CountryData value) param0) {}
}
