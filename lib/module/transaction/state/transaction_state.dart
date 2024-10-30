import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_histories/get_histories.dart';
part 'transaction_state.freezed.dart';

@unfreezed
class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(null) GetHistories? getHistories,
    @Default(0) int offset,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadHistories,
    @Default(false) bool isRecordsNull,
    @Default(null) List? histories,
  }) = _TransactionState;
}
