import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/features/user/presentation/blocks-cubits/user/user_bloc.dart';

Future<void> registerUserDependencies() async {
  serviceLocator.registerSingleton(UserBloc());
}
