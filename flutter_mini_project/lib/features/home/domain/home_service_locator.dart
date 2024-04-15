import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/features/home/presentation/blocs-cubits/bottom_nav_bar/bottom_nav_bar_bloc.dart';

Future<void> registerHomeDependencies() async {
  serviceLocator.registerFactory(BottomNavBarBloc.new);
}
