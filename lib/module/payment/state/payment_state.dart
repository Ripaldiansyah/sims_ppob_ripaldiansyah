import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_state.freezed.dart';

@unfreezed
class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(false) bool isLoading,
  }) = _PaymentState;
}
