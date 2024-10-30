import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_state.freezed.dart';

@unfreezed
class WalletState with _$WalletState {
  factory WalletState({
    @Default("0") String balance,
    @Default(true) bool isLoading,
    @Default(false) bool isObscured,
  }) = _WalletState;
}
