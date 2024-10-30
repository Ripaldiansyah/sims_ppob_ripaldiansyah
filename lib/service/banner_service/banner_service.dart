import 'package:sims_ppob_ripaldiansyah/model/get_banners/get_banners.dart';
import '../../core.dart';

class BannerService {
  Future<GetBanners> getBanners() async {
    try {
      var response = await DioService.ds.get(
        "$baseUrl/banner",
      );
      return GetBanners.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
