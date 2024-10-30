import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class login extends StatelessWidget {
  const login({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "sudah punya akun? login ",
          style: TextStyle(
            fontSize: 10.0,
            color: Color(0xff838383),
          ),
        ),
        InkWell(
          onTap: () {
            controller.login();
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
