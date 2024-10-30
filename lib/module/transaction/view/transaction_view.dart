import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({
    super.key,
    this.controllerNavigation,
  });

  final controllerNavigation;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionController>();
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: AppBarTransaction(controllerNavigation: controllerNavigation),
        ),
        title: const Text("Transaksi"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletView(height: 95),
              const SizedBox(height: 40.0),
              Text(
                "Transaksi",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (state.isLoading) HistoriesFetching(),
              if (!state.isLoading)
                HistoriesShowing(
                  state: state,
                  controller: controller,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
