part of 'country_dropdown_menu_bloc.dart';

abstract class CountryDropdownMenuState {
  List<FlagEntity> flagItems;
  List<FlagEntity> filteredFlagItems;
  String searchCountry;
  String selectedCountry;
  int selectedCountryIndex;

  CountryDropdownMenuState({
    required this.flagItems,
    required this.searchCountry,
    required this.filteredFlagItems,
    required this.selectedCountry,
    required this.selectedCountryIndex,
  });
}

class CountryDropdownInitialState extends CountryDropdownMenuState {
  CountryDropdownInitialState()
      : super(
          flagItems: CountryFlagHelper.getAllFlagItems(),
          filteredFlagItems: CountryFlagHelper.getAllFlagItems(),
          searchCountry: "",
          selectedCountry: "",
          selectedCountryIndex: 0,
        );
}

class CountryDropdownUpdatedState extends CountryDropdownMenuState {
  CountryDropdownUpdatedState({
    required super.flagItems,
    required super.filteredFlagItems,
    required super.searchCountry,
    required super.selectedCountry,
    required super.selectedCountryIndex,
  });
}
