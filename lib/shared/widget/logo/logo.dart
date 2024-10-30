import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo({
    super.key,
    this.width,
    this.fontSize,
    this.mainAxis,
  });

  final double? width;
  final double? fontSize;
  final MainAxisAlignment? mainAxis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxis ?? MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/Logo.png",
          fit: BoxFit.fill,
          width: width ?? 30,
        ),
        const SizedBox(
          width: 7.0,
        ),
        Text(
          "SIMS PPOB",
          style: TextStyle(
            fontSize: fontSize ?? 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
