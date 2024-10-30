import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';
import 'package:sims_ppob_ripaldiansyah/module/profile/widget/app_bar_profile.dart';
import 'package:sims_ppob_ripaldiansyah/module/profile/widget/photo_fetching.dart';
import 'package:sims_ppob_ripaldiansyah/module/profile/widget/profile_fetching.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    this.controllerNavigation,
  });

  final controllerNavigation;

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final controller = context.read<ProfileController>();
    final state = context.watch<ProfileController>().state;
    bool isPhotoNull =
        state.getProfile?.data?.profileImage?.contains("take-home-test/null") ??
            true;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 140,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 12,
          ),
          child:
              AppBarProfile(controllerNavigation: widget.controllerNavigation),
        ),
        title: const Text("Akun"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 10,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isLoading)
                  PhotoFetching()
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        duration: 700.ms,
                        color: Colors.white,
                      ),
                if (!state.isLoading)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 96.0,
                              width: 96,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(99.0),
                                ),
                                border: Border.all(
                                  width: 1.0,
                                  color: Color(0xffdad6d6),
                                ),
                              ),
                            ),
                            if (isPhotoNull)
                              Container(
                                height: 96.0,
                                width: 96,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/Profile Photo-1.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(99.0),
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xffdad6d6),
                                  ),
                                ),
                              ),
                            if (!isPhotoNull)
                              Container(
                                height: 96.0,
                                width: 96,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${state.getProfile?.data?.profileImage}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(99.0),
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xffdad6d6),
                                  ),
                                ),
                              ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () async {
                                  await controller.changeProfilePic(context);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(99.0),
                                    ),
                                    color: scaffoldBackgroundColor,
                                    border: Border.all(
                                      width: 1.0,
                                      color: Color(0xffdad6d6),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${state.getProfile!.data!.firstName} ${state.getProfile!.data!.lastName}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 15.0,
                ),
                if (state.isLoading)
                  ProfileFetching()
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        duration: 700.ms,
                        color: Colors.white,
                      ),
                if (!state.isLoading)
                  Container(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          QTextField(
                            hint: "masukan email anda",
                            prefixIcon: Icons.alternate_email,
                            validator: Validator.email,
                            value: state.getProfile!.data!.email,
                            enabled: false,
                            onChanged: (value) {
                              state.email = value;
                            },
                          ),
                          Text(
                            "Nama Depan",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          QTextField(
                            hint: "nama depan",
                            validator: Validator.required,
                            prefixIcon: Icons.person_outline,
                            value: state.getProfile!.data!.firstName,
                            enabled: state.isEditing,
                            onChanged: (value) {
                              state.firstName = value;
                            },
                          ),
                          Text(
                            "Nama Belakang",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          QTextField(
                            hint: "nama belakang",
                            validator: Validator.required,
                            prefixIcon: Icons.person_outline,
                            enabled: state.isEditing,
                            value: state.getProfile!.data!.lastName,
                            onChanged: (value) {
                              state.lastName = value;
                            },
                          ),
                          QButton(
                            label: state.isEditing ? "Simpan" : "Edit Profil",
                            onPressed: () {
                              state.isEditing
                                  ? controller.editProfile(formKey, context)
                                  : controller.changeButton();
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          QButton(
                            label: state.isEditing ? "Batalkan" : "Logout",
                            isOutline: true,
                            onPressed: () {
                              state.isEditing
                                  ? controller.changeButton()
                                  : controller.logout(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
