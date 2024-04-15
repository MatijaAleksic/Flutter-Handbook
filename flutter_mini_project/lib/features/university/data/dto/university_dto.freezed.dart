// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'university_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UniversityDto _$UniversityDtoFromJson(Map<String, dynamic> json) {
  return _UniversityDto.fromJson(json);
}

/// @nodoc
mixin _$UniversityDto {
  String? get alphaTwoCode => throw _privateConstructorUsedError;
  List<String>? get webPages => throw _privateConstructorUsedError;
  dynamic get stateProvince => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get domains => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniversityDtoCopyWith<UniversityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityDtoCopyWith<$Res> {
  factory $UniversityDtoCopyWith(
          UniversityDto value, $Res Function(UniversityDto) then) =
      _$UniversityDtoCopyWithImpl<$Res, UniversityDto>;
  @useResult
  $Res call(
      {String? alphaTwoCode,
      List<String>? webPages,
      dynamic stateProvince,
      String? name,
      List<String>? domains,
      String? country});
}

/// @nodoc
class _$UniversityDtoCopyWithImpl<$Res, $Val extends UniversityDto>
    implements $UniversityDtoCopyWith<$Res> {
  _$UniversityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphaTwoCode = freezed,
    Object? webPages = freezed,
    Object? stateProvince = freezed,
    Object? name = freezed,
    Object? domains = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      alphaTwoCode: freezed == alphaTwoCode
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      webPages: freezed == webPages
          ? _value.webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateProvince: freezed == stateProvince
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: freezed == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UniversityDtoImplCopyWith<$Res>
    implements $UniversityDtoCopyWith<$Res> {
  factory _$$UniversityDtoImplCopyWith(
          _$UniversityDtoImpl value, $Res Function(_$UniversityDtoImpl) then) =
      __$$UniversityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? alphaTwoCode,
      List<String>? webPages,
      dynamic stateProvince,
      String? name,
      List<String>? domains,
      String? country});
}

/// @nodoc
class __$$UniversityDtoImplCopyWithImpl<$Res>
    extends _$UniversityDtoCopyWithImpl<$Res, _$UniversityDtoImpl>
    implements _$$UniversityDtoImplCopyWith<$Res> {
  __$$UniversityDtoImplCopyWithImpl(
      _$UniversityDtoImpl _value, $Res Function(_$UniversityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alphaTwoCode = freezed,
    Object? webPages = freezed,
    Object? stateProvince = freezed,
    Object? name = freezed,
    Object? domains = freezed,
    Object? country = freezed,
  }) {
    return _then(_$UniversityDtoImpl(
      alphaTwoCode: freezed == alphaTwoCode
          ? _value.alphaTwoCode
          : alphaTwoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      webPages: freezed == webPages
          ? _value._webPages
          : webPages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateProvince: freezed == stateProvince
          ? _value.stateProvince
          : stateProvince // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      domains: freezed == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UniversityDtoImpl implements _UniversityDto {
  const _$UniversityDtoImpl(
      {this.alphaTwoCode,
      final List<String>? webPages,
      this.stateProvince,
      this.name,
      final List<String>? domains,
      this.country})
      : _webPages = webPages,
        _domains = domains;

  factory _$UniversityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UniversityDtoImplFromJson(json);

  @override
  final String? alphaTwoCode;
  final List<String>? _webPages;
  @override
  List<String>? get webPages {
    final value = _webPages;
    if (value == null) return null;
    if (_webPages is EqualUnmodifiableListView) return _webPages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic stateProvince;
  @override
  final String? name;
  final List<String>? _domains;
  @override
  List<String>? get domains {
    final value = _domains;
    if (value == null) return null;
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? country;

  @override
  String toString() {
    return 'UniversityDto(alphaTwoCode: $alphaTwoCode, webPages: $webPages, stateProvince: $stateProvince, name: $name, domains: $domains, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UniversityDtoImpl &&
            (identical(other.alphaTwoCode, alphaTwoCode) ||
                other.alphaTwoCode == alphaTwoCode) &&
            const DeepCollectionEquality().equals(other._webPages, _webPages) &&
            const DeepCollectionEquality()
                .equals(other.stateProvince, stateProvince) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      alphaTwoCode,
      const DeepCollectionEquality().hash(_webPages),
      const DeepCollectionEquality().hash(stateProvince),
      name,
      const DeepCollectionEquality().hash(_domains),
      country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UniversityDtoImplCopyWith<_$UniversityDtoImpl> get copyWith =>
      __$$UniversityDtoImplCopyWithImpl<_$UniversityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UniversityDtoImplToJson(
      this,
    );
  }
}

abstract class _UniversityDto implements UniversityDto {
  const factory _UniversityDto(
      {final String? alphaTwoCode,
      final List<String>? webPages,
      final dynamic stateProvince,
      final String? name,
      final List<String>? domains,
      final String? country}) = _$UniversityDtoImpl;

  factory _UniversityDto.fromJson(Map<String, dynamic> json) =
      _$UniversityDtoImpl.fromJson;

  @override
  String? get alphaTwoCode;
  @override
  List<String>? get webPages;
  @override
  dynamic get stateProvince;
  @override
  String? get name;
  @override
  List<String>? get domains;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$UniversityDtoImplCopyWith<_$UniversityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
