import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:sims_ppob_ripaldiansyah/model/get_profile/get_profile.dart';
import '../../core.dart';
import 'package:http_parser/http_parser.dart';

class ProfileService {
  Future<GetProfile> getProfile() async {
    try {
      var response = await DioService.ds.get(
        "$baseUrl/profile",
      );

      return GetProfile.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<GetProfile> editProfile(
      {required String firstName, required String lastName}) async {
    try {
      var response = await DioService.ds.put(
        "$baseUrl/profile/update",
        data: {
          "first_name": firstName,
          "last_name": lastName,
        },
      );

      return GetProfile.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<GetProfile> changeProfilePic({required String filePath}) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: "image.jpg",
          contentType: MediaType.parse("image/jpeg"),
        ),
      });

      final response = await DioService.ds.put(
        "$baseUrl/profile/image",
        data: formData,
      );

      return GetProfile.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
