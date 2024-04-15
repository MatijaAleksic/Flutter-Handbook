import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/country_dropdown_menu/country_dropdown_menu_bloc.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/country_dropdown_menu/country_dropdown_menu_overlay.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/country_dropdown_menu/country_dropdown_menu_text_field.dart';

class CountryDropdownMenu extends StatefulWidget {
  final double? width;
  final double? menuHeight;

  const CountryDropdownMenu({this.width, this.menuHeight, super.key});

  @override
  State<CountryDropdownMenu> createState() => _CountryDropdownMenuState();
}

class _CountryDropdownMenuState extends State<CountryDropdownMenu> {
  final OverlayPortalController _overlayController = OverlayPortalController();

  final GlobalKey dropdownMenuTextFieldKey = GlobalKey();

  double overlayYOffset = 0;
  double textFieldHeight = 0;
  double overlayXOffset = 0;

  void textFieldPositionOnScreenCallback(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    overlayYOffset = position.dy;
    overlayXOffset = position.dx;
    textFieldHeight = box.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryDropdownMenuBloc(),
      child: BlocBuilder<CountryDropdownMenuBloc, CountryDropdownMenuState>(
        builder: (context, state) {
          return SizedBox(
            width: widget.width,
            child: OverlayPortal(
              controller: _overlayController,
              overlayChildBuilder: (BuildContext context) {
                return _CountryDropdownMenuOverlay(
                  menuHeight: (widget.menuHeight != null)
                      ? widget.menuHeight!
                      : context.height,
                  width: (widget.width != null) ? widget.width! : context.width,
                  overlayXOffset: overlayXOffset,
                  overlayYOffset: overlayYOffset,
                  textFieldHeight: textFieldHeight,
                  toggleOverlay: toggleOverlay,
                );
              },
              child: CountryDropdownMenuTextField(
                key: dropdownMenuTextFieldKey,
                width: (widget.width != null) ? widget.width! : context.width,
                countryDropdownState: state,
                textFieldPositionOnScreenCallback:
                    textFieldPositionOnScreenCallback,
                toggleOverlay: toggleOverlay,
                isOverlayToggled: isOverlayToggled,
              ),
            ),
          );
        },
      ),
    );
  }

  void toggleOverlay() {
    _overlayController.toggle();
  }

  bool isOverlayToggled() {
    return _overlayController.isShowing;
  }
}

class _CountryDropdownMenuOverlay extends StatelessWidget {
  const _CountryDropdownMenuOverlay({
    required this.overlayXOffset,
    required this.overlayYOffset,
    required this.textFieldHeight,
    required this.menuHeight,
    required this.width,
    required this.toggleOverlay,
  });

  final double overlayYOffset;
  final double textFieldHeight;
  final double overlayXOffset;
  final double menuHeight;
  final double width;

  final Function toggleOverlay;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1, -1),
      child: CountryDropdownMenuOverlay(
        xOffset: overlayXOffset,
        yOffset: overlayYOffset + textFieldHeight,
        height: menuHeight,
        width: width,
        toggleOverlay: toggleOverlay,
      ),
    );
  }
}
