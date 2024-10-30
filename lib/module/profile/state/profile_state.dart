import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/get_profile/get_profile.dart';
part 'profile_state.freezed.dart';

@unfreezed
class ProfileDetailState with _$ProfileDetailState {
  factory ProfileDetailState({
    @Default(0) int count,
    @Default(null) String? email,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) GetProfile? getProfile,
    @Default(true) bool isLoading,
    @Default(false) bool isEditing,
  }) = _ProfileDetailState;
}
