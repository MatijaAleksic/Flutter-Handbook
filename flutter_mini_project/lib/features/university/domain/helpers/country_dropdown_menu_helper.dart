import 'package:flutter_mini_project/features/university/domain/constants/country_dropdown_menu_constants.dart';

class CountryDropdownMenuHelper {
  static double calculateOverlayHeight(
      double? height, int itemCount, double contextHeight) {
    if (height != null) {
      if (itemCount * CountryDropdownMenuConstants.dropdownFlagItemHeight <
          height) {
        return itemCount * CountryDropdownMenuConstants.dropdownFlagItemHeight;
      }
      if (height > contextHeight) return contextHeight;
      return height;
    }
    return contextHeight;
  }
}
