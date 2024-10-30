import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core.dart';

class DioService {
  static final Dio _dio = _initDio();
  static BuildContext? _context;

  static Dio _initDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          bool isTokenNotValid = response.data["message"] ==
              "Token tidak tidak valid atau kadaluwarsa";
          if (isTokenNotValid && _context != null) {
            relogin(_context!);
          } else {
            return handler.next(response);
          }
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  static void setContext(BuildContext context) {
    _context = context;
  }

  static Future relogin(BuildContext context) async {
    bool? isBack = await isRelogin(context);
    if (isBack == true) {
      DBService.clear("token");
      Get.to(LoginView());
    }
  }

  static Future<bool?> isRelogin(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'Token tidak valid',
          confirmText: "Login",
          description: "Silahkan login kembali!",
        );
      },
    );
  }

  static Dio get instance => _dio;
  static Dio get ds => instance;
}
