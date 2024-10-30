import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';
import 'package:sims_ppob_ripaldiansyah/module/home/controller/home_controller.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.state,
  });

  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat datang,",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        if (state.isLoading)
          Container(
            height: 23,
            width: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Colors.grey[200]!,
            ),
          ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                duration: 700.ms,
                color: Colors.white,
              ),
        if (!state.isLoading)
          Text(
            "${state.getProfile?.data?.firstName} ${state.getProfile?.data?.lastName}",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
