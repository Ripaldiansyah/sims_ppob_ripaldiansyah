import 'package:dio/dio.dart';

import '../../core.dart';

class AuthService {
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "$baseUrl/login",
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
