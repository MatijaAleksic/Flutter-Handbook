import 'package:country_flags/country_flags.dart';
import 'package:flutter_mini_project/features/university/domain/constants/country_dropdown_menu_constants.dart';
import 'package:flutter_mini_project/features/university/data/entities/flag_entity.dart';
import 'package:flutter_mini_project/features/university/domain/constants/country_flag_constants.dart';

class CountryFlagHelper {
  static FlagEntity buildCountryFlag(String countryCode, String countryName) =>
      FlagEntity(
        flag: CountryFlag.fromCountryCode(countryCode,
            height: CountryDropdownMenuConstants.flagImageHeight,
            width: CountryDropdownMenuConstants.flagImageWidth),
        countryCode: countryCode,
        countryName: countryName,
      );

  static String formatCountryName(String countryName) {
    final value = countryName.replaceAllMapped(RegExp(r"\+"), (match) => " ");
    return value;
  }

  static List<FlagEntity> getAllFlagItems() {
    return CountryConstants.countryData.entries.map((item) {
      return CountryFlagHelper.buildCountryFlag(item.value, item.key);
    }).toList();
  }

  static List<FlagEntity> filterFlagItemsByCountryName({
    required String countryName,
    required List<FlagEntity> flagItems,
  }) {
    return flagItems.where((item) {
      if (formatCountryName(item.countryName)
          .toLowerCase()
          .contains(countryName.toLowerCase())) {
        return true;
      }
      return false;
    }).toList();
  }
}
