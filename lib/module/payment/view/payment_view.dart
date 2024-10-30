import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({
    super.key,
    required this.stateHome,
    required this.controllerHome,
    required this.index,
  });

  final controllerHome;
  final stateHome;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PaymentController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final controller = context.read<PaymentController>();
    final state = context.watch<PaymentController>().state;
    String value = NumberFormat('#,##0', 'id_ID')
        .format(stateHome.getService?.data[index].serviceTariff);
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 140,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 18.0,
                  ),
                ),
                Text(
                  "Kembali",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          title: const Text("PemBayaran"),
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WalletView(
                    height: 95,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "PemBayaran",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Image.network(
                        "${stateHome.getService?.data[index].serviceIcon}",
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "${stateHome.getService?.data[index].serviceName}",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  QTextField(
                    hint: "masukan nominal Top Up ",
                    prefixIcon: Icons.money,
                    validator: Validator.topUp,
                    value: value,
                    enabled: false,
                    isNumberOnly: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  QButton(
                    label: "Bayar",
                    onPressed: () {
                      int serviceTariff =
                          stateHome.getService?.data[index].serviceTariff;
                      String serviceCode =
                          stateHome.getService?.data[index].serviceCode;
                      controller.onPaymentPressed(
                          context, serviceCode, serviceTariff);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
