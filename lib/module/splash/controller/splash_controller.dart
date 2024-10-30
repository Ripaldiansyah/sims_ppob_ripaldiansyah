import 'package:flutter/material.dart';
import '../../../core.dart';

class SplashController extends ChangeNotifier {
  redirectToLogin() {
    bool isTokenSave = token != null;
    Widget widget = isTokenSave ? MenuNavigationView() : LoginView();
    Future.delayed(Duration(milliseconds: 3500), () {
      Get.offAll(widget);
    });
  }
}
