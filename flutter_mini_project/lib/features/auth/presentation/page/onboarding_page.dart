import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/utils/constants/web_image_constants.dart';
import 'package:flutter_mini_project/features/auth/domain/constants/onboarding_constants.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/onboarding/onboarding_bloc.dart';
import 'package:flutter_mini_project/features/auth/presentation/page/login_modal.dart';
import 'package:flutter_mini_project/features/auth/presentation/widget/onboarding_single_page.dart';
import 'package:flutter_mini_project/features/auth/presentation/widget/onboarding_footer.dart';
import 'package:flutter_mini_project/features/auth/presentation/widget/onboarding_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [OnboardingFooter(onPress: _onIntroEnd)],
      body: BlocProvider(
        create: (context) => serviceLocator.get<OnboardingBloc>(),
        child: const _OnboardingBody(),
      ),
    );
  }

  void _onIntroEnd() {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const LoginModal();
        });
  }
}

class _OnboardingBody extends StatefulWidget {
  const _OnboardingBody();

  @override
  State<_OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<_OnboardingBody>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(
        length: OnboardingConstants.numOfOnboardingPages, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SafeArea(
              child: PageView(
                controller: _pageViewController,
                onPageChanged: (int pageIndex) =>
                    _handlePageViewChanged(pageIndex),
                children: const <Widget>[
                  _FirstOnboradingView(),
                  _SecondOnboardingView(),
                  _ThirdOnboardingView(),
                ],
              ),
            ),
            OnboardingPageIndicator(
              tabController: _tabController,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            ),
          ],
        );
      },
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    context
        .read<OnboardingBloc>()
        .add(OnboardingPageIndexUpdate(pageIndex: currentPageIndex));
    _tabController.index = currentPageIndex;
  }

  void _updateCurrentPageIndex(int index) {
    if (index > OnboardingConstants.numOfOnboardingPages - 1) return;
    if (index < 0) return;
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

class _FirstOnboradingView extends StatelessWidget {
  const _FirstOnboradingView();

  @override
  Widget build(BuildContext context) {
    return const OnboardingSinglePage(
      title: "Welcome to University",
      description: "Welcome to our official University web site.",
      imagePath: WebImageConstants.webImage1,
    );
  }
}

class _SecondOnboardingView extends StatelessWidget {
  const _SecondOnboardingView();

  @override
  Widget build(BuildContext context) {
    return const OnboardingSinglePage(
      title: "Learn as you go",
      description: "We have large database of all kinds of knowledge.",
      imagePath: WebImageConstants.webImage2,
    );
  }
}

class _ThirdOnboardingView extends StatelessWidget {
  const _ThirdOnboardingView();

  @override
  Widget build(BuildContext context) {
    return const OnboardingSinglePage(
      title: "Secured web site",
      description: "Our web site is secured with the best measures up to date",
      imagePath: WebImageConstants.webImage3,
    );
  }
}
