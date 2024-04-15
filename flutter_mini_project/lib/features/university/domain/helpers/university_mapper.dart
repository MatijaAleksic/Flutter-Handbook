import 'package:flutter_mini_project/core/utils/constants/loading_enum.dart';
import 'package:flutter_mini_project/features/university/data/dto/university_dto.dart';
import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/domain/constants/university_constants.dart';

class UniversityMapper {
  List<UniversityDto> fromJsonToUniversityDto(List<dynamic> json) {
    return json.map((json) => UniversityDto.fromJson(json)).toList();
  }

  List<UniversityEntity> fromUniversityDtoToUniversity(
      List<UniversityDto> universityDtos) {
    return universityDtos
        .map((dto) => UniversityEntity(
            alphaTwoCode: dto.alphaTwoCode,
            country: dto.country,
            domains: dto.domains,
            name: dto.name,
            stateProvince: dto.stateProvince,
            webPages: dto.webPages))
        .toList();
  }

  static List<UniversityEntity> fromJsonListToUniversityList(
      Map<String, dynamic> json) {
    List<dynamic> jsonListOfUniversities =
        json[UniversityConstants.cacheUniversitiesName];
    return jsonListOfUniversities
        .map((jsonString) => UniversityEntity.fromJson(jsonString))
        .toList();
  }

  static LoadingState fromJsonToLoadingState(Map<String, dynamic> json) {
    return LoadingState.values.firstWhere((element) =>
        element.name.toString() == json[UniversityConstants.cacheStatusName]);
  }
}
