import 'package:equatable/equatable.dart';

class UniversityEntity extends Equatable {
  const UniversityEntity({
    required this.alphaTwoCode,
    required this.webPages,
    required this.stateProvince,
    required this.name,
    required this.domains,
    required this.country,
  });

  final String? alphaTwoCode;
  final List<String>? webPages;
  final dynamic stateProvince;
  final String? name;
  final List<String>? domains;
  final String? country;

  UniversityEntity copyWith({
    String? alphaTwoCode,
    List<String>? webPages,
    dynamic stateProvince,
    String? name,
    List<String>? domains,
    String? country,
  }) {
    return UniversityEntity(
      alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      webPages: webPages ?? this.webPages,
      stateProvince: stateProvince ?? this.stateProvince,
      name: name ?? this.name,
      domains: domains ?? this.domains,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toJson() => {
        'alphaTwoCode': alphaTwoCode,
        'webPages': webPages,
        'stateProvince': stateProvince,
        'name': name,
        'domains': domains,
        'country': country
      };

  factory UniversityEntity.fromJson(Map<String, dynamic> json) =>
      UniversityEntity(
        alphaTwoCode: json['alphaTwoCode'] as String?,
        webPages: (json['webPages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        stateProvince: json['stateProvince'],
        name: json['name'] as String?,
        domains: (json['domains'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        country: json['country'] as String?,
      );

  @override
  List<Object?> get props =>
      [alphaTwoCode, webPages, stateProvince, name, domains, country];
}
