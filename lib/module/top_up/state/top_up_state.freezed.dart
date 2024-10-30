// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopUpState {
  String? get topUpAmount => throw _privateConstructorUsedError;
  set topUpAmount(String? value) => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  set errorText(String? value) => throw _privateConstructorUsedError;
  bool get isValueNoBlank => throw _privateConstructorUsedError;
  set isValueNoBlank(bool value) => throw _privateConstructorUsedError;
  List<dynamic> get topUpList => throw _privateConstructorUsedError;
  set topUpList(List<dynamic> value) => throw _privateConstructorUsedError;

  /// Create a copy of TopUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopUpStateCopyWith<TopUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopUpStateCopyWith<$Res> {
  factory $TopUpStateCopyWith(
          TopUpState value, $Res Function(TopUpState) then) =
      _$TopUpStateCopyWithImpl<$Res, TopUpState>;
  @useResult
  $Res call(
      {String? topUpAmount,
      String? errorText,
      bool isValueNoBlank,
      List<dynamic> topUpList});
}

/// @nodoc
class _$TopUpStateCopyWithImpl<$Res, $Val extends TopUpState>
    implements $TopUpStateCopyWith<$Res> {
  _$TopUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topUpAmount = freezed,
    Object? errorText = freezed,
    Object? isValueNoBlank = null,
    Object? topUpList = null,
  }) {
    return _then(_value.copyWith(
      topUpAmount: freezed == topUpAmount
          ? _value.topUpAmount
          : topUpAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      isValueNoBlank: null == isValueNoBlank
          ? _value.isValueNoBlank
          : isValueNoBlank // ignore: cast_nullable_to_non_nullable
              as bool,
      topUpList: null == topUpList
          ? _value.topUpList
          : topUpList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopUpStateImplCopyWith<$Res>
    implements $TopUpStateCopyWith<$Res> {
  factory _$$TopUpStateImplCopyWith(
          _$TopUpStateImpl value, $Res Function(_$TopUpStateImpl) then) =
      __$$TopUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? topUpAmount,
      String? errorText,
      bool isValueNoBlank,
      List<dynamic> topUpList});
}

/// @nodoc
class __$$TopUpStateImplCopyWithImpl<$Res>
    extends _$TopUpStateCopyWithImpl<$Res, _$TopUpStateImpl>
    implements _$$TopUpStateImplCopyWith<$Res> {
  __$$TopUpStateImplCopyWithImpl(
      _$TopUpStateImpl _value, $Res Function(_$TopUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topUpAmount = freezed,
    Object? errorText = freezed,
    Object? isValueNoBlank = null,
    Object? topUpList = null,
  }) {
    return _then(_$TopUpStateImpl(
      topUpAmount: freezed == topUpAmount
          ? _value.topUpAmount
          : topUpAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      isValueNoBlank: null == isValueNoBlank
          ? _value.isValueNoBlank
          : isValueNoBlank // ignore: cast_nullable_to_non_nullable
              as bool,
      topUpList: null == topUpList
          ? _value.topUpList
          : topUpList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$TopUpStateImpl implements _TopUpState {
  _$TopUpStateImpl(
      {this.topUpAmount = null,
      this.errorText = null,
      this.isValueNoBlank = false,
      this.topUpList = const [
        (label: "Rp.10.000", value: 10000),
        (label: "Rp.20.000", value: 20000),
        (label: "Rp.50.000", value: 50000),
        (label: "Rp.100.000", value: 100000),
        (label: "Rp.250.000", value: 250000),
        (label: "Rp.500.000", value: 500000)
      ]});

  @override
  @JsonKey()
  String? topUpAmount;
  @override
  @JsonKey()
  String? errorText;
  @override
  @JsonKey()
  bool isValueNoBlank;
  @override
  @JsonKey()
  List<dynamic> topUpList;

  @override
  String toString() {
    return 'TopUpState(topUpAmount: $topUpAmount, errorText: $errorText, isValueNoBlank: $isValueNoBlank, topUpList: $topUpList)';
  }

  /// Create a copy of TopUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpStateImplCopyWith<_$TopUpStateImpl> get copyWith =>
      __$$TopUpStateImplCopyWithImpl<_$TopUpStateImpl>(this, _$identity);
}

abstract class _TopUpState implements TopUpState {
  factory _TopUpState(
      {String? topUpAmount,
      String? errorText,
      bool isValueNoBlank,
      List<dynamic> topUpList}) = _$TopUpStateImpl;

  @override
  String? get topUpAmount;
  set topUpAmount(String? value);
  @override
  String? get errorText;
  set errorText(String? value);
  @override
  bool get isValueNoBlank;
  set isValueNoBlank(bool value);
  @override
  List<dynamic> get topUpList;
  set topUpList(List<dynamic> value);

  /// Create a copy of TopUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopUpStateImplCopyWith<_$TopUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
