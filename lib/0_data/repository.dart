// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:herohub_app/1_domain/models/auth_login_model.dart';

class Repository {
  Repository({required this.client});
  final Dio client;
  static String url = 'http://sandbox.servihero.com:8080/api';

  Future<AuthLoginModel?> authLogin(String email, String password) async {
    try {
      final response = await client.post<Map<String, dynamic>>(
        '$url/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      var authLogin = AuthLoginModel.fromJson(response.data!);
      return authLogin;
    } catch (e) {
      return null;
    }
  }
}
