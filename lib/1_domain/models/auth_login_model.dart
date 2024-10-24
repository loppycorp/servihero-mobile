import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_login_model.freezed.dart';
part 'auth_login_model.g.dart';

@freezed
class AuthLoginModel with _$AuthLoginModel {
  const factory AuthLoginModel({
    @JsonKey(name: '_id') required String id,
    required String email,
    required String status,
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _AuthLoginModel;

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginModelFromJson(json);
}
