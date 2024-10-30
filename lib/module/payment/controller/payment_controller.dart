import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';
import '../state/payment_state.dart';

class PaymentController extends ChangeNotifier {
  var state = PaymentState();

  void onPaymentPressed(
      BuildContext context, String serviceCode, int serviceTariff) async {
    bool? confirm = await confirmPayment(context, serviceTariff);

    if (confirm == true) {
      loadingPayment(context);
      try {
        final payment = await TransactionService().payment(
          serviceCode: serviceCode,
        );

        if (payment.data["status"] == 0) {
          successPayment(context, serviceTariff);
        } else {
          failedPayment(context, serviceTariff);
        }
      } on Exception catch (err) {
        bool? confirm = await dialogFailedPayment(context, serviceTariff);
        if (confirm == true) {
          Get.back();
        }
      }
    }
  }

  successPayment(BuildContext context, int serviceTariff) async {
    final refreshBalance =
        await Provider.of<WalletController>(context, listen: false)
            .refreshBalance();
    final refreshTransaction =
        await Provider.of<TransactionController>(context, listen: false)
            .refreshTransaction();

    if (refreshBalance && refreshTransaction) {
      Get.back();
      bool? isBack = await dialogSuccessPayment(context, serviceTariff);
      if (isBack == true) {
        Get.back();
      }
    }
  }

  failedPayment(BuildContext context, int serviceTariff) async {
    Get.back();
    bool? isBack = await dialogFailedPayment(context, serviceTariff);
    if (isBack == true) {
      Get.back();
    }
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

  Future<bool?> confirmPayment(BuildContext context, int serviceTariff) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount =
            NumberFormat('#,##0', 'id_ID').format(serviceTariff);

        return ConfirmDialog(
          title: 'Anda yakin untuk PemBayaran sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Ya, lanjutkan Pembayaran",
          cancelText: "Batalkan",
          imagePath: "assets/Logo.png",
        );
      },
    );
  }

  Future<bool?> dialogSuccessPayment(
      BuildContext context, int serviceTariff) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount =
            NumberFormat('#,##0', 'id_ID').format(serviceTariff);

        return ConfirmDialog(
          title: 'Pembayaran sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Kembali ke Beranda",
          description: "berhasil!",
          isSuccess: true,
        );
      },
    );
  }

  Future<bool?> dialogFailedPayment(
      BuildContext context, int serviceTariff) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String formattedAmount =
            NumberFormat('#,##0', 'id_ID').format(serviceTariff);

        return ConfirmDialog(
          title: 'PemBayaran sebesar',
          amount: "Rp${formattedAmount}",
          confirmText: "Kembali ke Beranda",
          description: "gagal",
          isFailed: true,
        );
      },
    );
  }
}
