import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core.dart';

class WalletController extends ChangeNotifier {
  var state = WalletState();
  WalletController() {
    getBalance();
  }

  Future getBalance() async {
    try {
      final balance = await BalanceService().getBalance();
      String formattedBalance =
          NumberFormat('#,##0', 'id_ID').format(balance["data"]["balance"]);
      state = state.copyWith(
        balance: formattedBalance,
        isLoading: false,
      );
      notifyListeners();
    } on Exception catch (err) {
      print(err);
    }
  }

  refreshBalance() async {
    state = state.copyWith(
      isLoading: true,
    );
    await getBalance();
    notifyListeners();
    return true;
  }

  showBalance() {
    state = state.copyWith(isObscured: !state.isObscured);
    notifyListeners();
  }
}
