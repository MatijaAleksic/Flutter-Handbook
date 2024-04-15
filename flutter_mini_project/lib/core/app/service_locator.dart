import 'package:flutter_mini_project/core/utils/helpers/bloc_helper.dart';
import 'package:flutter_mini_project/core/utils/helpers/json_helper.dart';
import 'package:flutter_mini_project/features/auth/domain/auth_service_locator.dart';
import 'package:flutter_mini_project/features/home/domain/home_service_locator.dart';
import 'package:flutter_mini_project/features/university/domain/university_service_locator.dart';
import 'package:flutter_mini_project/features/user/domain/user_service_locator.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> registerDependencies() async {
  await Future.wait([
    registerAppDependencies(),
    registerUserDependencies(),
    registerAuthDependencies(),
    registerHomeDependencies(),
    registerUniversityDependencies()
  ]);
}

Future<void> registerAppDependencies() async {
  serviceLocator.registerLazySingleton(JsonHelper.new);
  serviceLocator.registerLazySingleton(BlocHelper.new);
}
