import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core.dart';

class MenuNavigationView extends StatelessWidget {
  const MenuNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MenuNavigationController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    DioService.setContext(context);
    final controller = context.read<MenuNavigationController>();
    final state = context.watch<MenuNavigationController>().state;
    state.previousIndex = state.previousIndexTemp;

    return Scaffold(
      body: DefaultTabController(
        length: state.menus.length,
        initialIndex: state.selectedMenu,
        child: Scaffold(
          body: IndexedStack(
            index: state.selectedMenu,
            children: [
              HomeView(),
              TopUpView(
                controllerNavigation: controller,
              ),
              TransactionView(
                controllerNavigation: controller,
              ),
              ProfileView(
                controllerNavigation: controller,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedMenu,
              onTap: controller.selectMenu,
              type: BottomNavigationBarType.fixed,
              items: List.generate(state.menus.length, (index) {
                final item = state.menus[index];
                state.previousIndexTemp = state.selectedMenu;
                return BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                  ),
                  label: item.label,
                );
              })),
        ),
      ),
    );
  }
}
