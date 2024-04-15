import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/country_dropdown_menu/country_dropdown_menu_bloc.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/country_dropdown_menu_helper.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/country_dropdown_menu/country_dropdown_menu_list_view_builder.dart';

class CountryDropdownMenuOverlay extends StatelessWidget {
  final double yOffset;
  final double xOffset;
  final double? height;
  final double? width;
  final Function toggleOverlay;

  const CountryDropdownMenuOverlay({
    super.key,
    this.height,
    this.width,
    required this.yOffset,
    required this.xOffset,
    required this.toggleOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ModalBarrier(
        onDismiss: () => toggleOverlay(),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(xOffset, yOffset, 0, 0),
        child: Container(
          width: _calculateOverlayWidth(context),
          height: _calculateOverlayHeight(context),
          decoration: _dropdownOverlayDecoration(),
          child: CountryDropDownMenuListViewBuilder(
            width: width,
            toggleOverlay: toggleOverlay,
          ),
        ),
      ),
    ]);
  }

  double? _calculateOverlayWidth(BuildContext context) {
    return (width != null && width! > context.width) ? context.width : width;
  }

  double? _calculateOverlayHeight(BuildContext context) {
    return CountryDropdownMenuHelper.calculateOverlayHeight(
        height,
        context.read<CountryDropdownMenuBloc>().state.filteredFlagItems.length,
        context.height);
  }

  ShapeDecoration _dropdownOverlayDecoration() {
    return const ShapeDecoration(
      color: ThemeColors.overlayColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.black26,
        ),
      ),
    );
  }
}
