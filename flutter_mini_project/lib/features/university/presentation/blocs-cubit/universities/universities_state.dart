part of 'universities_bloc.dart';

class UniversityState extends Equatable {
  final List<UniversityEntity> universities;
  final LoadingState status;
  final String country;

  const UniversityState(
      {required this.universities,
      required this.status,
      required this.country});

  @override
  factory UniversityState.fromJson(Map<String, dynamic> json) {
    return UniversityState(
      status: UniversityMapper.fromJsonToLoadingState(json),
      universities: UniversityMapper.fromJsonListToUniversityList(json),
      country: json[UniversityConstants.cacheCountryName],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UniversityConstants.cacheUniversitiesName:
          universities.map((university) => university.toJson()).toList(),
      UniversityConstants.cacheStatusName: status.name,
      UniversityConstants.cacheCountryName: country,
    };
  }

  UniversityState copyWith(
      {List<UniversityEntity>? universities,
      LoadingState? status,
      String? country}) {
    return UniversityState(
        universities: universities ?? this.universities,
        status: status ?? this.status,
        country: country ?? this.country);
  }

  @override
  List<Object> get props => [universities, status, country];
}

class UniversityInitialState extends UniversityState {
  const UniversityInitialState()
      : super(
          country: UniversityConstants.defaultUniversityCountry,
          status: LoadingState.initial,
          universities: const [],
        );
}
