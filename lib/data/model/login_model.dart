import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool? success;
  final String? message;
  final Data? data;

  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  final String? accessToken;
  final String? tokenType;
  final User? user;

  Data({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? name;
  final String? employeeId;
  final String? email;
  final String? phone;
  final String? gender;
  final String? role;
  final int? roleId;
  final String? avatar;
  final int? statusId;
  final String? address;

  User({
    this.id,
    this.name,
    this.employeeId,
    this.email,
    this.phone,
    this.gender,
    this.role,
    this.roleId,
    this.avatar,
    this.statusId,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        employeeId: json["employee_id"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        role: json["role"],
        roleId: json["role_id"],
        avatar: json["avatar"],
        statusId: json["status_id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "employee_id": employeeId,
        "email": email,
        "phone": phone,
        "gender": gender,
        "role": role,
        "role_id": roleId,
        "avatar": avatar,
        "status_id": statusId,
        "address": address,
      };
}
