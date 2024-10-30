import 'package:flutter/material.dart';

import '../../../core.dart';
import '../state/register_state.dart';

class RegisterController extends ChangeNotifier {
  var state = RegisterState();

  login() {
    Get.to(LoginView());
  }

  register(formKey) async {
    state.isPasswordMatch = state.password == state.confirmPassword;
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    try {
      var register = await RegisterService().register(
        email: state.email!,
        firstName: state.firstName!,
        lastName: state.lastName!,
        password: state.password!,
      );

      if (register.data["status"] == 0) {
        return _sucessRegister(register);
      }

      return _failedRegister(register);
    } on Exception catch (err) {
      snackbarWarning(message: err.toString());
    }
  }

  _sucessRegister(register) {
    snackbarSuccess(message: register.data["message"]);
    _clearField();
    login();
  }

  _failedRegister(register) {
    snackbarWarning(message: register.data["message"]);
  }

  _clearField() {
    state = state.copyWith(
      email: null,
      password: null,
      confirmPassword: null,
      firstName: null,
      lastName: null,
    );
    notifyListeners();
  }
}
