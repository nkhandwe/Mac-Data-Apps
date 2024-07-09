import 'dart:convert';

VoteResponseModel voteResponseModelFromJson(String str) => VoteResponseModel.fromJson(json.decode(str));

String voteResponseModelToJson(VoteResponseModel data) => json.encode(data.toJson());

class VoteResponseModel {
  final bool? success;
  final String? message;

  VoteResponseModel({
    this.success,
    this.message,
  });

  factory VoteResponseModel.fromJson(Map<String, dynamic> json) => VoteResponseModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
