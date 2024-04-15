part of 'country_dropdown_menu_bloc.dart';

@immutable
class CountryDropdownMenuEvent {}

class FilterSearchCountryEvent extends CountryDropdownMenuEvent {
  final String searchCountry;

  FilterSearchCountryEvent({required this.searchCountry});
}

class SelectSearchCountryEvent extends CountryDropdownMenuEvent {
  final String selectedCountry;

  SelectSearchCountryEvent({required this.selectedCountry});
}
