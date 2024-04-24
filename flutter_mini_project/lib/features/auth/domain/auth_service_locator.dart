import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/utils/helpers/secure_storage_service.dart';
import 'package:flutter_mini_project/features/auth/domain/constants/auth_validation_use_case.dart';
import 'package:flutter_mini_project/features/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/auth/auth_bloc.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/onboarding/onboarding_bloc.dart';

Future<void> registerAuthDependencies() async {
  serviceLocator.registerLazySingleton(SecureStorageService.new);
  serviceLocator.registerLazySingleton(AuthValidationUseCase.new);

  serviceLocator.registerLazySingleton(() => AuthUsecase(
        secureStorageService: serviceLocator(),
      ));

  serviceLocator.registerFactory(() => AuthBloc(
        authUseCase: serviceLocator(),
      ));

  serviceLocator.registerFactory(OnboardingBloc.new);
}
