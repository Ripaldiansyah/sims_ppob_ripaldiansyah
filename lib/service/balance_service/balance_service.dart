import '../../core.dart';

class BalanceService {
  Future getBalance() async {
    try {
      var response = await DioService.ds.get(
        "$baseUrl/balance",
      );

      return response.data;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
