import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/features/university/data/provider/university_provider.dart';
import 'package:flutter_mini_project/features/university/data/repository/university_repository.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/university_mapper.dart';
import 'package:flutter_mini_project/features/university/domain/usecase/university_usecase.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/universities/universities_bloc.dart';

Future<void> registerUniversityDependencies() async {
  serviceLocator.registerLazySingleton(UniversityMapper.new);

  serviceLocator.registerLazySingleton(() => UniversityProvider(
        jsonHelper: serviceLocator(),
        universityMapper: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => UniversityRepository(
        universityMapper: serviceLocator(),
        universityProvider: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => UniversityUsecase(
        universityRepository: serviceLocator(),
      ));

  serviceLocator.registerFactory(() => UniversityBloc(
        universityUsecase: serviceLocator(),
      ));
}
