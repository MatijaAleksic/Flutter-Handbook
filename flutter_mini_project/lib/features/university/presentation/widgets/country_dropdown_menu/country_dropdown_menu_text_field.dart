import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/extensions/string_extension.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/country_dropdown_menu/country_dropdown_menu_bloc.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/country_flag_helper.dart';

class CountryDropdownMenuTextField extends StatefulWidget {
  final double width;
  final Function toggleOverlay;
  final Function textFieldPositionOnScreenCallback;
  final Function isOverlayToggled;
  final CountryDropdownMenuState countryDropdownState;

  const CountryDropdownMenuTextField(
      {required this.toggleOverlay,
      required this.textFieldPositionOnScreenCallback,
      required this.isOverlayToggled,
      required this.countryDropdownState,
      required this.width,
      required super.key});

  @override
  State<CountryDropdownMenuTextField> createState() =>
      _CountryDropdownMenuTextFieldState();
}

class _CountryDropdownMenuTextFieldState
    extends State<CountryDropdownMenuTextField> {
  final FocusNode _focus = FocusNode();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      if (!widget.isOverlayToggled()) {
        widget.toggleOverlay();
      }
    }
  }

  void _onEveryBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.textFieldPositionOnScreenCallback(widget.key);
    });
  }

  void _initializeControllerValue(BuildContext context) {
    textController.text =
        (widget.countryDropdownState.searchCountry.isEmptyOrNull)
            ? CountryFlagHelper.formatCountryName(
                widget.countryDropdownState.selectedCountry)
            : widget.countryDropdownState.searchCountry;
  }

  @override
  Widget build(BuildContext context) {
    _onEveryBuild();
    _initializeControllerValue(context);

    return SizedBox(
      width: widget.width,
      child: TextField(
        controller: textController,
        onTap: onPress,
        focusNode: _focus,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: _SearchIconWidge(toggleOverlay: widget.toggleOverlay),
          labelText: "Country",
          suffixIcon: _ArrowIconWidget(toggleOverlay: widget.toggleOverlay),
        ),
        onChanged: (value) => onValueChanged(value),
      ),
    );
  }

  void onPress() {
    if (!widget.isOverlayToggled()) widget.toggleOverlay();
  }

  void onValueChanged(String value) {
    if (!widget.isOverlayToggled()) widget.toggleOverlay();
    context
        .read<CountryDropdownMenuBloc>()
        .add(FilterSearchCountryEvent(searchCountry: value));
  }
}

class _SearchIconWidge extends StatelessWidget {
  const _SearchIconWidge({required this.toggleOverlay});

  final Function toggleOverlay;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () => toggleOverlay(),
    );
  }
}

class _ArrowIconWidget extends StatelessWidget {
  const _ArrowIconWidget({required this.toggleOverlay});
  final Function toggleOverlay;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_drop_down),
      onPressed: () => toggleOverlay(),
    );
  }
}
