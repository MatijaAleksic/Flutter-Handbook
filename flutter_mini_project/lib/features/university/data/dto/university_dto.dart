import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_dto.freezed.dart';
part 'university_dto.g.dart';

@freezed
class UniversityDto with _$UniversityDto {
  const factory UniversityDto({
    String? alphaTwoCode,
    List<String>? webPages,
    dynamic stateProvince,
    String? name,
    List<String>? domains,
    String? country,
  }) = _UniversityDto;

  factory UniversityDto.fromJson(Map<String, dynamic> json) =>
      _$UniversityDtoFromJson(json);
}
