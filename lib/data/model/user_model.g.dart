// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[0] as String?,
      email: fields[1] as String?,
      token: fields[2] as String?,
      id: fields[3] as int?,
      gender: fields[4] as String?,
      phone: fields[5] as String?,
      status: fields[6] as String?,
      roleId: fields[7] as String?,
      employeeId: fields[10] as String?,
      address: fields[11] as String?,
      avatar: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.roleId)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(10)
      ..write(obj.employeeId)
      ..writeByte(11)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
