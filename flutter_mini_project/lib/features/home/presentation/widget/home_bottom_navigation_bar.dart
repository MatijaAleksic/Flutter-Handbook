import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/features/home/presentation/blocs-cubits/bottom_nav_bar/bottom_nav_bar_bloc.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return NavigationBar(
          backgroundColor: ThemeColors.primaryColor,
          onDestinationSelected: (int index) =>
              _onNavigationSelected(index, context),
          indicatorColor: Colors.black26,
          selectedIndex: state.pageIndex,
          destinations: const <Widget>[
            NavigationDestination(
                selectedIcon: Icon(Icons.school_rounded),
                icon: Icon(Icons.school_outlined),
                label: 'Universities'),
            NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: 'Profile')
          ],
        );
      },
    );
  }

  void _onNavigationSelected(int index, BuildContext context) {
    context
        .read<BottomNavBarBloc>()
        .add(BottomNavBarChangedEvent(pageIndex: index));
  }
}
