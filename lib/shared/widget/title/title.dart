import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/logo/logo.dart';

class title extends StatelessWidget {
  const title({
    super.key,
    required this.textTitle,
  });

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          logo(),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            "${textTitle}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
