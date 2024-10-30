import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme/theme_config.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashController()..redirectToLogin(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final controller = context.read<SplashController>();

    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/Logo.png",
            fit: BoxFit.fill,
            width: 120,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "SIMS PPOB",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Ripaldiansyah",
            style: TextStyle(
              fontSize: 14.0,
              color: textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    )
            .animate()
            .fadeIn(duration: 2500.ms)
            .shimmer(duration: 3000.ms)
            .saturate(duration: 800.ms));
  }
}
