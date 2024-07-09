import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  final bool? success;
  final String? message;
  final List<StateData>? data;

  StateModel({
    this.success,
    this.message,
    this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StateData>.from(
                json["data"]!.map((x) => StateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StateData {
  final int? id;
  final String? name;
  final String? country;
  final String? code;

  StateData({
    this.id,
    this.name,
    this.country,
    this.code,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "code": code,
      };
}
