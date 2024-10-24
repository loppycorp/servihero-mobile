// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthLoginHiveAdapter extends TypeAdapter<AuthLoginHive> {
  @override
  final int typeId = 0;

  @override
  AuthLoginHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthLoginHive(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthLoginHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthLoginHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
