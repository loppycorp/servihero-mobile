// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthLoginModel _$AuthLoginModelFromJson(Map<String, dynamic> json) {
  return _AuthLoginModel.fromJson(json);
}

/// @nodoc
mixin _$AuthLoginModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthLoginModelCopyWith<AuthLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLoginModelCopyWith<$Res> {
  factory $AuthLoginModelCopyWith(
          AuthLoginModel value, $Res Function(AuthLoginModel) then) =
      _$AuthLoginModelCopyWithImpl<$Res, AuthLoginModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String status,
      @JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class _$AuthLoginModelCopyWithImpl<$Res, $Val extends AuthLoginModel>
    implements $AuthLoginModelCopyWith<$Res> {
  _$AuthLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? status = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthLoginModelImplCopyWith<$Res>
    implements $AuthLoginModelCopyWith<$Res> {
  factory _$$AuthLoginModelImplCopyWith(_$AuthLoginModelImpl value,
          $Res Function(_$AuthLoginModelImpl) then) =
      __$$AuthLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String email,
      String status,
      @JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class __$$AuthLoginModelImplCopyWithImpl<$Res>
    extends _$AuthLoginModelCopyWithImpl<$Res, _$AuthLoginModelImpl>
    implements _$$AuthLoginModelImplCopyWith<$Res> {
  __$$AuthLoginModelImplCopyWithImpl(
      _$AuthLoginModelImpl _value, $Res Function(_$AuthLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? status = null,
    Object? accessToken = null,
  }) {
    return _then(_$AuthLoginModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthLoginModelImpl implements _AuthLoginModel {
  const _$AuthLoginModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.email,
      required this.status,
      @JsonKey(name: 'access_token') required this.accessToken});

  factory _$AuthLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthLoginModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String email;
  @override
  final String status;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString() {
    return 'AuthLoginModel(id: $id, email: $email, status: $status, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, status, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginModelImplCopyWith<_$AuthLoginModelImpl> get copyWith =>
      __$$AuthLoginModelImplCopyWithImpl<_$AuthLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthLoginModelImplToJson(
      this,
    );
  }
}

abstract class _AuthLoginModel implements AuthLoginModel {
  const factory _AuthLoginModel(
          {@JsonKey(name: '_id') required final String id,
          required final String email,
          required final String status,
          @JsonKey(name: 'access_token') required final String accessToken}) =
      _$AuthLoginModelImpl;

  factory _AuthLoginModel.fromJson(Map<String, dynamic> json) =
      _$AuthLoginModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get email;
  @override
  String get status;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$AuthLoginModelImplCopyWith<_$AuthLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
