import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/country_dropdown_menu/country_dropdown_menu_bloc.dart';
import 'package:flutter_mini_project/features/university/domain/constants/country_dropdown_menu_constants.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/country_dropdown_menu/country_dropdown_menu_flag_widget.dart';

class CountryDropDownMenuListViewBuilder extends StatelessWidget {
  final double? width;
  final Function toggleOverlay;
  const CountryDropDownMenuListViewBuilder(
      {required this.width, required this.toggleOverlay, super.key});

  @override
  Widget build(BuildContext context) {
    CountryDropdownMenuState countryDropdownState =
        context.read<CountryDropdownMenuBloc>().state;

    ScrollController scrollController = ScrollController(
        initialScrollOffset: countryDropdownState.selectedCountryIndex *
            CountryDropdownMenuConstants.dropdownFlagItemHeight);

    return ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.zero,
        prototypeItem: CountryDropdownMenuFlagWidget(
          width: width,
          flagItem: countryDropdownState.flagItems.first,
          toggleOverlay: toggleOverlay,
          isSelected: false,
        ),
        itemCount: countryDropdownState.filteredFlagItems.length,
        itemBuilder: (context, index) {
          return CountryDropdownMenuFlagWidget(
            width: (width != null && width! > context.width)
                ? context.width
                : width,
            flagItem: countryDropdownState.filteredFlagItems[index],
            toggleOverlay: toggleOverlay,
            isSelected: (countryDropdownState.selectedCountry ==
                    countryDropdownState.filteredFlagItems[index].countryName)
                ? true
                : false,
          );
        });
  }
}
