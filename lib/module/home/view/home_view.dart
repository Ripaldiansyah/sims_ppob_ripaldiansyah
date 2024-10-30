import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final state = controller.state;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(
                    controller: controller,
                    state: state,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18,
                      top: 19,
                      right: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 22.0,
                          ),
                          child: HomeTitle(
                            state: state,
                          ),
                        ),
                        WalletView(),
                        HomeMenu(
                          state: state,
                          controller: controller,
                        ),
                        Text(
                          "Temukan promo menarik",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        HomePromo(
                          state: state,
                          controller: controller,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
