import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/data/provider/university_provider.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/university_mapper.dart';

class UniversityRepository {
  final UniversityProvider _universityProvider;
  final UniversityMapper _universityMapper;

  UniversityRepository(
      {required UniversityProvider universityProvider,
      required UniversityMapper universityMapper})
      : _universityProvider = universityProvider,
        _universityMapper = universityMapper;

  Future<List<UniversityEntity>> getUniversities(String countryName) async {
    return _universityMapper.fromUniversityDtoToUniversity(
        await _universityProvider.getUniversities(countryName));
  }
}
