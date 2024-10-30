// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';
import '../../../core.dart';
import '../state/top_up_state.dart';

class TopUpController extends ChangeNotifier {
  var state = TopUpState();

  setValueTopUp() {
    bool isTrue = true;
    state =
        state.copyWith(topUpAmount: state.topUpAmount, isValueNoBlank: isTrue);
    notifyListeners();
  }

  validationButton() {
    if (state.topUpAmount == "") {
      state = state.copyWith(isValueNoBlank: false);
      notifyListeners();
    } else {
      state = state.copyWith(isValueNoBlank: true);
      notifyListeners();
    }
  }

  errorValidation(value) {
    if (value != null) {
      state =
          state.copyWith(errorText: value.toString(), isValueNoBlank: false);
    } else {
      bool isValueNoBlank = state.topUpAmount != "" ? true : false;
      state = state.copyWith(errorText: null, isValueNoBlank: isValueNoBlank);
    }
    notifyListeners();
  }

  Future<bool?> confirmTopUp(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount = NumberFormat('#,##0', 'id_ID')
            .format(int.parse(state.topUpAmount!.replaceAll(".", "")));

        return ConfirmDialog(
          title: 'Anda yakin untuk Top Up sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Ya, lanjutkan Top Up",
          cancelText: "Batalkan",
          imagePath: "assets/Logo.png",
        );
      },
    );
  }

  Future<bool?> successTopUp(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount = NumberFormat('#,##0', 'id_ID')
            .format(int.parse(state.topUpAmount!.replaceAll(".", "")));

        return ConfirmDialog(
          title: 'Top Up sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Kembali ke Beranda",
          description: "berhasil!",
          isSuccess: true,
        );
      },
    );
  }

  Future<bool?> failedTopUp(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount = NumberFormat('#,##0', 'id_ID')
            .format(int.parse(state.topUpAmount!.replaceAll(".", "")));

        return ConfirmDialog(
          title: 'Top Up sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Kembali ke Beranda",
          description: "gagal",
          isFailed: true,
        );
      },
    );
  }

  Future<bool?> loadingPayment(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }

  void onTopUpPressed(BuildContext context) async {
    bool? confirm = await confirmTopUp(context);
    if (confirm == true) {
      loadingPayment(context);
      try {
        await TransactionService().topUp(
          topUpAmount: int.parse(state.topUpAmount!.replaceAll(".", "")),
        );
        final refreshBalance =
            await Provider.of<WalletController>(context, listen: false)
                .refreshBalance();
        final refreshTransaction =
            await Provider.of<TransactionController>(context, listen: false)
                .refreshTransaction();

        if (refreshBalance && refreshTransaction) {
          Get.back();
          bool? isBack = await successTopUp(context);
          if (isBack == true) {
            state = state.copyWith(topUpAmount: null, isValueNoBlank: false);
            notifyListeners();
            Get.back();
          }
        }
      } on Exception catch (err) {
        bool? confirm = await failedTopUp(context);
        if (confirm == true) {
          Get.back();
        }
      }
    }
  }
}
