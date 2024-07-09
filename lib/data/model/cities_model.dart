// To parse this JSON data, do
//
//     final citiesModels = citiesModelsFromJson(jsonString);

import 'dart:convert';

CitiesModels citiesModelsFromJson(String str) =>
    CitiesModels.fromJson(json.decode(str));

String citiesModelsToJson(CitiesModels data) => json.encode(data.toJson());

class CitiesModels {
  final bool? success;
  final String? message;
  final List<CityData>? data;

  CitiesModels({
    this.success,
    this.message,
    this.data,
  });

  factory CitiesModels.fromJson(Map<String, dynamic> json) => CitiesModels(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CityData>.from(
                json["data"]!.map((x) => CityData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CityData {
  final int? id;
  final String? name;
  final String? countryCode;
  final String? stateCode;
  final String? latitude;
  final String? longitude;

  CityData({
    this.id,
    this.name,
    this.countryCode,
    this.stateCode,
    this.latitude,
    this.longitude,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        stateCode: json["state_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "state_code": stateCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
