import 'package:flutter/material.dart';

class AppBarTransaction extends StatelessWidget {
  const AppBarTransaction({
    super.key,
    required this.controllerNavigation,
  });

  final dynamic controllerNavigation;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            controllerNavigation.backNavigation();
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
    );
  }
}
