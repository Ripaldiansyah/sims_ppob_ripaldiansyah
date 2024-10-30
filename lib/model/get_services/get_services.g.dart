// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetServicesImpl _$$GetServicesImplFromJson(Map<String, dynamic> json) =>
    _$GetServicesImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetServicesImplToJson(_$GetServicesImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      serviceCode: json['service_code'] as String?,
      serviceName: json['service_name'] as String?,
      serviceIcon: json['service_icon'] as String?,
      serviceTariff: (json['service_tariff'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'service_code': instance.serviceCode,
      'service_name': instance.serviceName,
      'service_icon': instance.serviceIcon,
      'service_tariff': instance.serviceTariff,
    };
