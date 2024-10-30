// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetBannersImpl _$$GetBannersImplFromJson(Map<String, dynamic> json) =>
    _$GetBannersImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetBannersImplToJson(_$GetBannersImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      bannerName: json['banner_name'] as String?,
      bannerImage: json['banner_image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'banner_name': instance.bannerName,
      'banner_image': instance.bannerImage,
      'description': instance.description,
    };
