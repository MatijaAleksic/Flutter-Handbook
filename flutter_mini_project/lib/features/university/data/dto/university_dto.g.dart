// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UniversityDtoImpl _$$UniversityDtoImplFromJson(Map<String, dynamic> json) =>
    _$UniversityDtoImpl(
      alphaTwoCode: json['alpha_two_code'] as String?,
      webPages: (json['web_pages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stateProvince: json['state-province'],
      name: json['name'] as String?,
      domains:
          (json['domains'] as List<dynamic>?)?.map((e) => e as String).toList(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$UniversityDtoImplToJson(_$UniversityDtoImpl instance) =>
    <String, dynamic>{
      'alphaTwoCode': instance.alphaTwoCode,
      'webPages': instance.webPages,
      'stateProvince': instance.stateProvince,
      'name': instance.name,
      'domains': instance.domains,
      'country': instance.country,
    };
