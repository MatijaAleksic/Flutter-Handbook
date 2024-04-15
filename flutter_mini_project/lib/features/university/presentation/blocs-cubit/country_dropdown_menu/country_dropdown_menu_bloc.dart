import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/extensions/string_extension.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/country_flag_helper.dart';
import 'package:flutter_mini_project/features/university/data/entities/flag_entity.dart';

part 'country_dropdown_menu_event.dart';
part 'country_dropdown_menu_state.dart';

class CountryDropdownMenuBloc
    extends Bloc<CountryDropdownMenuEvent, CountryDropdownMenuState> {
  CountryDropdownMenuBloc() : super(CountryDropdownInitialState()) {
    on<FilterSearchCountryEvent>(_filterSearchCountry);
    on<SelectSearchCountryEvent>(_selectSearchCountry);
  }

  void _filterSearchCountry(
      FilterSearchCountryEvent event, Emitter<CountryDropdownMenuState> emit) {
    if (event.searchCountry.isEmptyOrNull) emit(CountryDropdownInitialState());

    emit(CountryDropdownUpdatedState(
      flagItems: state.flagItems,
      searchCountry: event.searchCountry,
      filteredFlagItems: CountryFlagHelper.filterFlagItemsByCountryName(
          countryName: event.searchCountry, flagItems: state.flagItems),
      selectedCountry: "",
      selectedCountryIndex: 0,
    ));
  }

  void _selectSearchCountry(
      SelectSearchCountryEvent event, Emitter<CountryDropdownMenuState> emit) {
    emit(CountryDropdownUpdatedState(
        flagItems: state.flagItems,
        searchCountry: "",
        filteredFlagItems: state.flagItems,
        selectedCountry: event.selectedCountry,
        selectedCountryIndex: state.flagItems
            .indexWhere((item) => item.countryName == event.selectedCountry)));
  }
}
