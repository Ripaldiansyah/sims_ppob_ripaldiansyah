import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_profile.freezed.dart';
part 'get_profile.g.dart';

@freezed
class GetProfile with _$GetProfile {
  const factory GetProfile({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _GetProfile;

  factory GetProfile.fromJson(Map<String, dynamic> json) =>
      _$GetProfileFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "profile_image") String? profileImage,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
