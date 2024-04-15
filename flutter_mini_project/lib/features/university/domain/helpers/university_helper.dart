import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/domain/constants/university_constants.dart';

class UniversityHelper {
  static extractUniversityFromExtra(Object? extra) {
    Map<String, UniversityEntity> extraValue =
        extra as Map<String, UniversityEntity>;
    return extraValue[UniversityConstants.extraUniversity] as UniversityEntity;
  }
}
