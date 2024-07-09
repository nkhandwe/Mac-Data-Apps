import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

class UserLogin {
  String? email;
  String? password;

  UserLogin({this.email, this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? token;
  @HiveField(3)
  final int? id;
  @HiveField(4)
  final String? gender;
  @HiveField(5)
  final String? phone;
  @HiveField(6)
  final String? status;
  @HiveField(7)
  final String? roleId;
  @HiveField(8)
  final String? avatar;
  @HiveField(10)
  final String? employeeId;
  @HiveField(11)
  final String? address;

  const UserModel(
      {this.name,
      this.email,
      this.token,
      this.id,
      this.gender,
      this.phone,
      this.status,
      this.roleId,
      this.employeeId,
      this.address,
      this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user']['name'] == null ? null : json['user']["name"],
      email: json['user']['email'],
      token: json['user']['token'],
      id: json['user']['id'],
      gender: json['user']['gender'],
      phone: json['user']['phone'],
      avatar: json['user']['avatar'],
      status: json['user']['status'].toString(),
      roleId: json['user']['role_id'].toString(),
      address: json['user']['address'],
      employeeId: json['user']['employee_id'],
    );
  }

  factory UserModel.editFromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] == null ? null : json["name"],
      email: json['email'],
      token: json['token'],
      id: json['id'],
      gender: json['gender'],
      phone: json['phone'],
      avatar: json['avatar'],
      status: json['status'].toString(),
      roleId: json['role_id'].toString(),
      address: json['address'],
      employeeId: json['employee_id'],
    );
  }

  UserModel copyWith({required String token}) {
    return UserModel(
        name: name,
        email: email,
        token: token,
        id: id,
        gender: gender,
        phone: phone,
        avatar: avatar,
        status: status,
        roleId: roleId,
        address: address,
        employeeId: employeeId);
  }

  @override
  List<Object?> get props => [name, email, id];
}
