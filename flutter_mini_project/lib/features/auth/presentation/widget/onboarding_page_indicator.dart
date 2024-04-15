import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/onboarding/onboarding_bloc.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.tabController,
    required this.onUpdateCurrentPageIndex,
  });

  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _LeftArrowWidget(
            currentPageIndex: context.read<OnboardingBloc>().state.pageIndex,
            onUpdateCurrentPageIndex: onUpdateCurrentPageIndex,
          ),
          TabPageSelector(
            controller: tabController,
            color: ThemeColors.backgroundColor,
            selectedColor: ThemeColors.primaryColor,
            indicatorSize: 15,
          ),
          _RightArrowWidget(
            currentPageIndex: context.read<OnboardingBloc>().state.pageIndex,
            onUpdateCurrentPageIndex: onUpdateCurrentPageIndex,
          ),
        ],
      ),
    );
  }
}

class _LeftArrowWidget extends StatelessWidget {
  const _LeftArrowWidget(
      {required this.currentPageIndex, required this.onUpdateCurrentPageIndex});

  final int currentPageIndex;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 16.0,
      padding: EdgeInsets.zero,
      onPressed: () => onUpdateCurrentPageIndex(currentPageIndex - 1),
      icon: const Icon(
        Icons.arrow_left_rounded,
        size: 32.0,
      ),
    );
  }
}

class _RightArrowWidget extends StatelessWidget {
  const _RightArrowWidget(
      {required this.currentPageIndex, required this.onUpdateCurrentPageIndex});

  final int currentPageIndex;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 16.0,
      padding: EdgeInsets.zero,
      onPressed: () => onUpdateCurrentPageIndex(currentPageIndex + 1),
      icon: const Icon(
        Icons.arrow_right_rounded,
        size: 32.0,
      ),
    );
  }
}
