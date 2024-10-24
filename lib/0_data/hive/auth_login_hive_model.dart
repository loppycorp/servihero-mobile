// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hive/hive.dart';

part 'auth_login_hive_model.g.dart';

@HiveType(typeId: 0)
class AuthLoginHive {
  AuthLoginHive(
    this.id,
    this.email,
    this.status, 
    this.accessToken,
  );
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? status;

  @HiveField(3)
  final String? accessToken;
}
