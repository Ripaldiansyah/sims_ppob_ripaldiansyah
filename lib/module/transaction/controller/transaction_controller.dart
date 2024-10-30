import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_histories/get_histories.dart';

class TransactionController extends ChangeNotifier {
  var state = TransactionState();
  TransactionController() {
    getHistories();
  }

  showMore() async {
    int offset = state.offset + 5;
    state = state.copyWith(offset: offset, isLoadHistories: true);
    int itemCount = state.getHistories?.data?.records?.length ?? 0;
    await getHistories();
    int itemCountTemp = state.getHistories?.data?.records?.length ?? 0;

    if (itemCount == itemCountTemp) {
      state = state.copyWith(isRecordsNull: true);
    }
    notifyListeners();
  }

  Future<void> getHistories() async {
    final newHistories =
        await TransactionService().getHistories(offset: state.offset);
    final oldHistories = state.getHistories?.data;
    final records = [
      ...(oldHistories?.records ?? []),
      ...(newHistories.data?.records ?? []),
    ].cast<Record>();

    final updatedData = Data(
      limit: newHistories.data?.limit ?? oldHistories?.limit,
      offset: newHistories.data?.offset ?? oldHistories?.offset,
      records: records,
    );

    final updatedProducts = GetHistories(data: updatedData);
    state = state.copyWith(
        getHistories: updatedProducts,
        isLoadHistories: false,
        isLoading: false);
    notifyListeners();
  }

  refreshTransaction() async {
    int offset = 0;
    state = state.copyWith(
      getHistories: null,
      isLoading: true,
      offset: offset,
    );
    await getHistories();
    notifyListeners();
    return true;
  }
}
