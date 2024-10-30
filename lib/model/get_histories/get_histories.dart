import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_histories.freezed.dart';
part 'get_histories.g.dart';

@freezed
class GetHistories with _$GetHistories {
  const factory GetHistories({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _GetHistories;

  factory GetHistories.fromJson(Map<String, dynamic> json) =>
      _$GetHistoriesFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "offset") String? offset,
    @JsonKey(name: "limit") String? limit,
    @JsonKey(name: "records") List<Record>? records,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Record with _$Record {
  const factory Record({
    @JsonKey(name: "invoice_number") String? invoiceNumber,
    @JsonKey(name: "transaction_type") String? transactionType,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "total_amount") int? totalAmount,
    @JsonKey(name: "created_on") DateTime? createdOn,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
