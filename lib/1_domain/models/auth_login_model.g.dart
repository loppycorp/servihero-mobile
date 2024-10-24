// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthLoginModelImpl _$$AuthLoginModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthLoginModelImpl(
      id: json['_id'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$$AuthLoginModelImplToJson(
        _$AuthLoginModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'status': instance.status,
      'access_token': instance.accessToken,
    };
