import 'package:sims_ppob_ripaldiansyah/model/get_services/get_services.dart';
import '../../core.dart';

class MenuService {
  Future<GetServices> getServices() async {
    try {
      var response = await DioService.ds.get(
        "$baseUrl/services",
      );
      return GetServices.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
