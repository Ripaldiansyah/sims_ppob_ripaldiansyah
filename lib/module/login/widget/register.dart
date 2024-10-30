import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class register extends StatelessWidget {
  const register({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "belum punya akun? registrasi ",
          style: TextStyle(
            fontSize: 10.0,
            color: Color(0xff838383),
          ),
        ),
        InkWell(
          onTap: () {
            controller.register();
          },
          child: Text(
            "di sini",
            style: TextStyle(
              fontSize: 10.0,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
