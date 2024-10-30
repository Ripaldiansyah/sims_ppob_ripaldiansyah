import '../../core.dart';
import '../../model/get_histories/get_histories.dart';

class TransactionService {
  Future topUp({
    required int topUpAmount,
  }) async {
    try {
      var response = await DioService.ds.post(
        "$baseUrl/topup",
        data: {
          "top_up_amount": topUpAmount,
        },
      );

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future payment({
    required String serviceCode,
  }) async {
    try {
      var response = await DioService.ds.post(
        "$baseUrl/transaction",
        data: {
          "service_code": serviceCode,
        },
      );

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<GetHistories> getHistories({
    required int offset,
  }) async {
    try {
      var response = await DioService.ds.get(
        "$baseUrl/transaction/history?offset=$offset&limit=5",
      );
      return GetHistories.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
