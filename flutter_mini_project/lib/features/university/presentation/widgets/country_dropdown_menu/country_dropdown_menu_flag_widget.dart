import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/country_dropdown_menu/country_dropdown_menu_bloc.dart';
import 'package:flutter_mini_project/features/university/domain/constants/country_dropdown_menu_constants.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/country_flag_helper.dart';
import 'package:flutter_mini_project/features/university/data/entities/flag_entity.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/universities/universities_bloc.dart';

class CountryDropdownMenuFlagWidget extends StatelessWidget {
  final double? width;
  final FlagEntity flagItem;
  final Function toggleOverlay;
  final bool isSelected;

  const CountryDropdownMenuFlagWidget({
    required this.flagItem,
    required this.width,
    required this.toggleOverlay,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isSelected
          ? const BoxDecoration(color: ThemeColors.overlaySelectedElementColor)
          : const BoxDecoration(),
      child: GestureDetector(
        onTap: () => _onCountrySelect(context),
        child: SizedBox(
          height: CountryDropdownMenuConstants.dropdownFlagItemHeight,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                flagItem.flag,
                const SizedBox(width: 5),
                _CountryFlagName(
                    countryName: CountryFlagHelper.formatCountryName(
                        flagItem.countryName)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCountrySelect(BuildContext context) {
    context.read<CountryDropdownMenuBloc>().add(
          SelectSearchCountryEvent(selectedCountry: flagItem.countryName),
        );
    context
        .read<UniversityBloc>()
        .add(LoadUniversitiesEvent(country: flagItem.countryName));
    toggleOverlay();
  }
}

class _CountryFlagName extends StatelessWidget {
  const _CountryFlagName({required this.countryName});

  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        CountryFlagHelper.formatCountryName(countryName),
      ),
    );
  }
}
