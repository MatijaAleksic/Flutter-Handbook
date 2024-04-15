import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/data/repository/university_repository.dart';

class UniversityUsecase {
  final UniversityRepository _universityRepository;

  UniversityUsecase({
    required UniversityRepository universityRepository,
  }) : _universityRepository = universityRepository;
  Future<List<UniversityEntity>> getUniversities(String countryName) async {
    return await _universityRepository.getUniversities(countryName);
  }
}
