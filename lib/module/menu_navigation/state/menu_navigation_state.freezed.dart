// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuNavigationState {
  int get selectedMenu => throw _privateConstructorUsedError;
  set selectedMenu(int value) => throw _privateConstructorUsedError;
  int get previousIndexTemp => throw _privateConstructorUsedError;
  set previousIndexTemp(int value) => throw _privateConstructorUsedError;
  int get previousIndex => throw _privateConstructorUsedError;
  set previousIndex(int value) => throw _privateConstructorUsedError;
  List<dynamic> get menus => throw _privateConstructorUsedError;
  set menus(List<dynamic> value) => throw _privateConstructorUsedError;

  /// Create a copy of MenuNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuNavigationStateCopyWith<MenuNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuNavigationStateCopyWith<$Res> {
  factory $MenuNavigationStateCopyWith(
          MenuNavigationState value, $Res Function(MenuNavigationState) then) =
      _$MenuNavigationStateCopyWithImpl<$Res, MenuNavigationState>;
  @useResult
  $Res call(
      {int selectedMenu,
      int previousIndexTemp,
      int previousIndex,
      List<dynamic> menus});
}

/// @nodoc
class _$MenuNavigationStateCopyWithImpl<$Res, $Val extends MenuNavigationState>
    implements $MenuNavigationStateCopyWith<$Res> {
  _$MenuNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMenu = null,
    Object? previousIndexTemp = null,
    Object? previousIndex = null,
    Object? menus = null,
  }) {
    return _then(_value.copyWith(
      selectedMenu: null == selectedMenu
          ? _value.selectedMenu
          : selectedMenu // ignore: cast_nullable_to_non_nullable
              as int,
      previousIndexTemp: null == previousIndexTemp
          ? _value.previousIndexTemp
          : previousIndexTemp // ignore: cast_nullable_to_non_nullable
              as int,
      previousIndex: null == previousIndex
          ? _value.previousIndex
          : previousIndex // ignore: cast_nullable_to_non_nullable
              as int,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuNavigationStateImplCopyWith<$Res>
    implements $MenuNavigationStateCopyWith<$Res> {
  factory _$$MenuNavigationStateImplCopyWith(_$MenuNavigationStateImpl value,
          $Res Function(_$MenuNavigationStateImpl) then) =
      __$$MenuNavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedMenu,
      int previousIndexTemp,
      int previousIndex,
      List<dynamic> menus});
}

/// @nodoc
class __$$MenuNavigationStateImplCopyWithImpl<$Res>
    extends _$MenuNavigationStateCopyWithImpl<$Res, _$MenuNavigationStateImpl>
    implements _$$MenuNavigationStateImplCopyWith<$Res> {
  __$$MenuNavigationStateImplCopyWithImpl(_$MenuNavigationStateImpl _value,
      $Res Function(_$MenuNavigationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMenu = null,
    Object? previousIndexTemp = null,
    Object? previousIndex = null,
    Object? menus = null,
  }) {
    return _then(_$MenuNavigationStateImpl(
      selectedMenu: null == selectedMenu
          ? _value.selectedMenu
          : selectedMenu // ignore: cast_nullable_to_non_nullable
              as int,
      previousIndexTemp: null == previousIndexTemp
          ? _value.previousIndexTemp
          : previousIndexTemp // ignore: cast_nullable_to_non_nullable
              as int,
      previousIndex: null == previousIndex
          ? _value.previousIndex
          : previousIndex // ignore: cast_nullable_to_non_nullable
              as int,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$MenuNavigationStateImpl implements _MenuNavigationState {
  _$MenuNavigationStateImpl(
      {this.selectedMenu = 0,
      this.previousIndexTemp = 0,
      this.previousIndex = 0,
      this.menus = const [
        (icon: Icons.home, label: "Home"),
        (icon: Icons.money, label: "Top Up"),
        (icon: Icons.credit_card, label: "Transaction"),
        (icon: Icons.person, label: "Akun")
      ]});

  @override
  @JsonKey()
  int selectedMenu;
  @override
  @JsonKey()
  int previousIndexTemp;
  @override
  @JsonKey()
  int previousIndex;
  @override
  @JsonKey()
  List<dynamic> menus;

  @override
  String toString() {
    return 'MenuNavigationState(selectedMenu: $selectedMenu, previousIndexTemp: $previousIndexTemp, previousIndex: $previousIndex, menus: $menus)';
  }

  /// Create a copy of MenuNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuNavigationStateImplCopyWith<_$MenuNavigationStateImpl> get copyWith =>
      __$$MenuNavigationStateImplCopyWithImpl<_$MenuNavigationStateImpl>(
          this, _$identity);
}

abstract class _MenuNavigationState implements MenuNavigationState {
  factory _MenuNavigationState(
      {int selectedMenu,
      int previousIndexTemp,
      int previousIndex,
      List<dynamic> menus}) = _$MenuNavigationStateImpl;

  @override
  int get selectedMenu;
  set selectedMenu(int value);
  @override
  int get previousIndexTemp;
  set previousIndexTemp(int value);
  @override
  int get previousIndex;
  set previousIndex(int value);
  @override
  List<dynamic> get menus;
  set menus(List<dynamic> value);

  /// Create a copy of MenuNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuNavigationStateImplCopyWith<_$MenuNavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
