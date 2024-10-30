import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_banners.freezed.dart';
part 'get_banners.g.dart';

@freezed
class GetBanners with _$GetBanners {
  const factory GetBanners({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Datum>? data,
  }) = _GetBanners;

  factory GetBanners.fromJson(Map<String, dynamic> json) =>
      _$GetBannersFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "banner_name") String? bannerName,
    @JsonKey(name: "banner_image") String? bannerImage,
    @JsonKey(name: "description") String? description,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
