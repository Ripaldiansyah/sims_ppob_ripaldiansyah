import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_navigation_state.freezed.dart';

@unfreezed
class MenuNavigationState with _$MenuNavigationState {
  factory MenuNavigationState({
    @Default(0) int selectedMenu,
    @Default(0) int previousIndexTemp,
    @Default(0) int previousIndex,
    @Default([
      (
        icon: Icons.home,
        label: "Home",
      ),
      (
        icon: Icons.money,
        label: "Top Up",
      ),
      (
        icon: Icons.credit_card,
        label: "Transaction",
      ),
      (
        icon: Icons.person,
        label: "Akun",
      ),
    ])
    List menus,
  }) = _MenuNavigationState;
}
