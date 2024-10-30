import 'package:flutter/material.dart';

class TitleTopUp extends StatelessWidget {
  const TitleTopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Silahkan masukan",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        Text(
          "nominal Top Up",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
