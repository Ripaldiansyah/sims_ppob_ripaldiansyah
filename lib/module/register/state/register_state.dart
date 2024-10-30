import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@unfreezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(null) String? email,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) String? password,
    @Default(null) String? confirmPassword,
    @Default(true) bool isPasswordMatch,
  }) = _RegisterState;
}
