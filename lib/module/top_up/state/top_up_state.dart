import 'package:freezed_annotation/freezed_annotation.dart';
part 'top_up_state.freezed.dart';

@unfreezed
class TopUpState with _$TopUpState {
  factory TopUpState({
    @Default(null) String? topUpAmount,
    @Default(null) String? errorText,
    @Default(false) bool isValueNoBlank,
    @Default([
      (
        label: "Rp.10.000",
        value: 10000,
      ),
      (
        label: "Rp.20.000",
        value: 20000,
      ),
      (
        label: "Rp.50.000",
        value: 50000,
      ),
      (
        label: "Rp.100.000",
        value: 100000,
      ),
      (
        label: "Rp.250.000",
        value: 250000,
      ),
      (
        label: "Rp.500.000",
        value: 500000,
      ),
    ])
    List topUpList,
  }) = _TopUpState;
}
