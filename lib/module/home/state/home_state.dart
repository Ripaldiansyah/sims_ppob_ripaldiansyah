import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_banners/get_banners.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_profile/get_profile.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_services/get_services.dart';
part 'home_state.freezed.dart';

@unfreezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(null) GetProfile? getProfile,
    @Default(null) GetServices? getService,
    @Default(null) GetBanners? getBanners,
    @Default(true) bool isLoading,
    @Default(0) int count,
  }) = _HomeState;
}
