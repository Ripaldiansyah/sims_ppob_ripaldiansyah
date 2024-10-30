import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/module/login/widget/register.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/title/title.dart';
import '../../../core.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final controller = context.read<LoginController>();
    final state = context.watch<LoginController>().state;

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title(
                textTitle: "Masuk atau buat akun untuk memulai",
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    QTextField(
                      hint: "masukan email anda",
                      prefixIcon: Icons.alternate_email,
                      validator: Validator.email,
                      onChanged: (value) {
                        state.email = value;
                      },
                    ),
                    QTextField(
                      hint: "masukan password anda",
                      obscure: true,
                      prefixIcon: Icons.lock_outline,
                      validator: Validator.password,
                      onChanged: (value) {
                        state.password = value;
                      },
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    QButton(
                      label: "Masuk",
                      onPressed: () {
                        controller.login(formKey, context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              register(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
