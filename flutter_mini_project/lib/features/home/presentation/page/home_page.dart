import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';

import 'package:flutter_mini_project/features/home/presentation/blocs-cubits/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:flutter_mini_project/features/home/presentation/widget/home_bottom_navigation_bar.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/universities/universities_bloc.dart';
import 'package:flutter_mini_project/features/university/presentation/page/universities_page.dart';
import 'package:flutter_mini_project/features/user/presentation/page/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<UniversityBloc>()),
        BlocProvider(
            create: (context) => serviceLocator.get<BottomNavBarBloc>()),
      ],
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: const HomeBottomNavigationBar(),
            body: Builder(builder: (context) {
              if (state is BottomNavBarUniversityState) {
                return const UniversitiesPage();
              }
              return const ProfilePage();
            }));
      }),
    );
  }
}
