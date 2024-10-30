import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core.dart';
import '../state/profile_state.dart';

class ProfileController extends ChangeNotifier {
  var state = ProfileDetailState();
  ProfileController() {
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      final profile = await ProfileService().getProfile();
      state = state.copyWith(
        getProfile: profile,
        isLoading: false,
      );
      notifyListeners();
    } on Exception catch (err) {
      print(err);
    }
  }

  changeButton() {
    bool isEditing = !state.isEditing;
    state = state.copyWith(isEditing: isEditing);
    notifyListeners();
  }

  Future<bool?> successEdit(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'Sukses Ubah Profile',
          confirmText: "Kembali",
          isSuccess: true,
        );
      },
    );
  }

  Future<bool?> failedEdit(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'Gagal Ubah Profile',
          confirmText: "Kembali",
          isSuccess: false,
        );
      },
    );
  }

  editProfile(formKey, context) async {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    try {
      var updateProfile = await ProfileService().editProfile(
        firstName: state.firstName ?? state.getProfile!.data!.firstName!,
        lastName: state.lastName ?? state.getProfile!.data!.lastName!,
      );
      loading(context);
      if (updateProfile.status == 0) {
        bool? isBack = await successEdit(context);
        await Provider.of<HomeController>(context, listen: false).getProfile();
        if (isBack == true) {
          state = state.copyWith(getProfile: updateProfile, isEditing: false);
          notifyListeners();
        }
      }
      Get.back();
    } on Exception catch (err) {
      bool? isBack = await failedEdit(context);
      if (isBack == true) {
        state = state.copyWith(isEditing: false);
        notifyListeners();
      }
    }
  }

  Future<String?> getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    final filePath = image?.path;
    if (filePath == null) return null;
    return filePath;
  }

  changeProfilePic(context) async {
    try {
      String? filePath = await getImage();
      if (filePath == null) return;
      final response =
          await ProfileService().changeProfilePic(filePath: filePath);
      loading(context);
      if (response.status == 0) {
        await Provider.of<HomeController>(context, listen: false).getProfile();
        getProfile();
      }
      Get.back();
    } on Exception catch (err) {
      print(err);
    }
  }

  Future loading(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }

  logout(context) async {
    DBService.clear("token");
    Get.offAll(LoginView());
  }
}
