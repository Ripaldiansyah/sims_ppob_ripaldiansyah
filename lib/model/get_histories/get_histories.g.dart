// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_histories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHistoriesImpl _$$GetHistoriesImplFromJson(Map<String, dynamic> json) =>
    _$GetHistoriesImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetHistoriesImplToJson(_$GetHistoriesImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      offset: json['offset'] as String?,
      limit: json['limit'] as String?,
      records: (json['records'] as List<dynamic>?)
          ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'records': instance.records,
    };

_$RecordImpl _$$RecordImplFromJson(Map<String, dynamic> json) => _$RecordImpl(
      invoiceNumber: json['invoice_number'] as String?,
      transactionType: json['transaction_type'] as String?,
      description: json['description'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
    );

Map<String, dynamic> _$$RecordImplToJson(_$RecordImpl instance) =>
    <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'transaction_type': instance.transactionType,
      'description': instance.description,
      'total_amount': instance.totalAmount,
      'created_on': instance.createdOn?.toIso8601String(),
    };
