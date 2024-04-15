import 'package:country_flags/country_flags.dart';

class FlagEntity {
  const FlagEntity(
      {required this.flag,
      required this.countryCode,
      required this.countryName});

  final CountryFlag flag;
  final String countryCode;
  final String countryName;
}
