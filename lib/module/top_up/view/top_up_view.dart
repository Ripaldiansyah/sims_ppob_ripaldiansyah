import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/module/top_up/widget/app_bar_top_up.dart';
import '../../../core.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({
    super.key,
    this.controllerNavigation,
  });

  final controllerNavigation;

  @override
  _TopUpViewState createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  late TopUpController controller;

  @override
  void initState() {
    super.initState();
    controller = TopUpController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopUpController>(
      create: (BuildContext context) => controller,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final state = context.watch<TopUpController>().state;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 140,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 12,
          ),
          child: AppBarTopUp(controllerNavigation: widget.controllerNavigation),
        ),
        title: const Text("Top Up"),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WalletView(
                  height: 95,
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TitleTopUp(),
                QTextField(
                  hint: "masukan nominal Top Up ",
                  prefixIcon: Icons.money,
                  validator: Validator.topUp,
                  value: state.topUpAmount,
                  isNumberOnly: true,
                  errorText: state.errorText,
                  onChanged: (value) {
                    state.topUpAmount = value;
                    final isValid = Validator.topUp(value);
                    controller.errorValidation(isValid);
                  },
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.4,
                    crossAxisCount: 3,
                    mainAxisSpacing: 18.2,
                    crossAxisSpacing: 6.2,
                  ),
                  itemCount: state.topUpList.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = state.topUpList[index];
                    return InkWell(
                      onTap: () {
                        state.topUpAmount = item.value.toString();
                        controller.setValueTopUp();
                        controller.validationButton();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xffe4e4e4),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${item.label}",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 51.0,
                ),
                QButton(
                  label: "Top Up",
                  enabled: state.isValueNoBlank,
                  onPressed: () {
                    controller.onTopUpPressed(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
