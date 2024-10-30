import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class HomeController extends ChangeNotifier {
  var state = HomeState();
  HomeController() {
    getBanners();
    getServices();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      final profile = await ProfileService().getProfile();
      state = state.copyWith(
        getProfile: profile,
      );
      validateNull();
    } on Exception catch (err) {
      print(err);
    }
  }

  Future getServices() async {
    final services = await MenuService().getServices();
    state = state.copyWith(
      getService: services,
    );
    validateNull();
    notifyListeners();
  }

  Future getBanners() async {
    final banners = await BannerService().getBanners();
    state = state.copyWith(
      getBanners: banners,
    );
    validateNull();
    notifyListeners();
  }

  validateNull() {
    if (state.getBanners != null &&
        state.getProfile != null &&
        state.getService != null) {
      state = state.copyWith(
        isLoading: false,
      );
    }
    notifyListeners();
  }
}
