import 'package:flutter/material.dart';

import '../state/menu_navigation_state.dart';

class MenuNavigationController extends ChangeNotifier {
  var state = MenuNavigationState();

  selectMenu(int newIndex) {
    state.selectedMenu = newIndex;
    notifyListeners();
  }

  backNavigation() {
    state = state.copyWith(selectedMenu: state.previousIndex);
    notifyListeners();
  }
}
