import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/module/register/widget/login.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/title/title.dart';
import '../../../core.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RegisterController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final controller = context.read<RegisterController>();
    final state = context.watch<RegisterController>().state;

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                title(textTitle: "Lengkapi data untuk membuat akun"),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QTextField(
                        hint: "masukan email anda",
                        prefixIcon: Icons.alternate_email,
                        validator: Validator.email,
                        value: state.email,
                        onChanged: (value) {
                          state.email = value;
                        },
                      ),
                      QTextField(
                        hint: "nama depan",
                        validator: Validator.required,
                        prefixIcon: Icons.person,
                        value: state.firstName,
                        onChanged: (value) {
                          state.firstName = value;
                        },
                      ),
                      QTextField(
                        hint: "nama belakang",
                        validator: Validator.required,
                        prefixIcon: Icons.person,
                        value: state.lastName,
                        onChanged: (value) {
                          state.lastName = value;
                        },
                      ),
                      QTextField(
                        hint: "buat password",
                        obscure: true,
                        prefixIcon: Icons.lock_outline,
                        validator: Validator.password,
                        suffixIcon: Icons.password,
                        value: state.password,
                        onChanged: (value) {
                          state.password = value;
                        },
                      ),
                      QTextField(
                        hint: "konfirmasi password",
                        obscure: true,
                        prefixIcon: Icons.lock_outline,
                        validator: (value) => Validator.confirmPassword(
                            value, state.isPasswordMatch),
                        suffixIcon: Icons.password,
                        value: state.confirmPassword,
                        onChanged: (value) {
                          state.confirmPassword = value;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      QButton(
                        label: "Registrasi",
                        onPressed: () {
                          controller.register(formKey);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                login(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
