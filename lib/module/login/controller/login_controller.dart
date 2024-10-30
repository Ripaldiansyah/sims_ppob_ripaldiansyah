import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/util/show_snackbar/show_snackbar.dart';
import '../../../core.dart';

String? get token => DBService.get("token");

class LoginController extends ChangeNotifier {
  var state = LoginState();

  register() {
    Get.to(RegisterView());
  }

  login(formKey, context) async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    try {
      String email = state.email!;
      String password = state.password!;
      var user = await AuthService().login(
        email: email,
        password: password,
      );

      if (user.data["status"] == 0) {
        DBService.set("token", user.data["data"]["token"]);
        return _sucessLogin(user, context);
      }

      return _failedLogin(user);
    } on Exception catch (err) {
      snackbarWarning(message: err.toString());
    }
  }

  _sucessLogin(user, context) async {
    final refreshBalance =
        await Provider.of<WalletController>(context, listen: false)
            .refreshBalance();
    final refreshTransaction =
        await Provider.of<TransactionController>(context, listen: false)
            .refreshTransaction();
    final homeController =
        await Provider.of<HomeController>(context, listen: false);

    await Provider.of<HomeController>(context, listen: false).getProfile();
    loadingLogin(context);
    homeController.getBanners();
    homeController.getServices();
    homeController.getProfile();
    if (refreshBalance & refreshTransaction) {
      Get.back();

      snackbarSuccess(message: user.data["message"]);
      Get.offAll(MenuNavigationView());
    }
  }

  Future loadingLogin(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }

  _failedLogin(user) {
    snackbarWarning(message: user.data["message"]);
  }
}
