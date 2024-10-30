import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/logo/logo.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.state,
    required this.controller,
  });

  final controller;
  final state;

  @override
  Widget build(BuildContext context) {
    bool isPhotoNull =
        state.getProfile?.data?.profileImage?.contains("take-home-test/null") ??
            true;
    return Padding(
      padding: EdgeInsets.only(
        left: 18,
        top: 23,
        right: 31,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(
            fontSize: 12,
            width: 15,
            mainAxis: MainAxisAlignment.start,
          ),
          Spacer(),
          if (state.isLoading)
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(99.0),
                ),
                color: Colors.grey[200]!,
              ),
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  duration: 700.ms,
                  color: Colors.white,
                ),
          if (!state.isLoading && isPhotoNull)
            Image.asset(
              "assets/Profile Photo.png",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.fill,
            ),
          if (!state.isLoading && !isPhotoNull)
            Image.network(
              "${state.getProfile?.data?.profileImage}",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.fill,
            ),
        ],
      ),
    );
  }
}
