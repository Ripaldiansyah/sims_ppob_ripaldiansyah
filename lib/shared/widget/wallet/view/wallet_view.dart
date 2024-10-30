import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../../../core.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key, this.height});

  final double? height;

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WalletController>();
    final state = controller.state;

    return Container(
      height: widget.height ?? 130.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Background Saldo.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saldo anda",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    if (state.isLoading)
                      Container(
                        height: 30,
                        width: 132,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: primaryColor.withOpacity(0.8),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                            duration: 700.ms,
                            color: Colors.white,
                          ),
                    const SizedBox(height: 5.0),
                    if (!state.isLoading)
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Text(
                              "Rp ",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Positioned(
                              top: state.isObscured ? -45 : 0,
                              left: 30,
                              child: Text(
                                state.isObscured
                                    ? "......."
                                    : "${state.balance}",
                                style: TextStyle(
                                  fontSize: state.isObscured ? 60 : 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.height == null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Lihat saldo",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.showBalance();
                            },
                            icon: Icon(
                              state.isObscured
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width / 3,
              child: CustomPaint(
                painter: CurvedLinePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
