import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_services.freezed.dart';
part 'get_services.g.dart';

@freezed
class GetServices with _$GetServices {
  const factory GetServices({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Datum>? data,
  }) = _GetServices;

  factory GetServices.fromJson(Map<String, dynamic> json) =>
      _$GetServicesFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "service_code") String? serviceCode,
    @JsonKey(name: "service_name") String? serviceName,
    @JsonKey(name: "service_icon") String? serviceIcon,
    @JsonKey(name: "service_tariff") int? serviceTariff,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
