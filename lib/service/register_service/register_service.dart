import 'package:dio/dio.dart';

import '../../core.dart';

class RegisterService {
  Future register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "$baseUrl/registration",
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
        },
      );

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
