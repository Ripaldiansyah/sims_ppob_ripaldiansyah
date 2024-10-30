import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/state_util.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBService.init();
  DioService.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletController()),
        ChangeNotifierProvider(create: (context) => TransactionController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      home: const SplashView(),
    );
  }
}
