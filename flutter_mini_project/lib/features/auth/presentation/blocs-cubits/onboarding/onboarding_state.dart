part of 'onboarding_bloc.dart';

class OnboardingState {
  int pageIndex;

  OnboardingState({required this.pageIndex});
}

class OnboardingInitialState extends OnboardingState {
  OnboardingInitialState() : super(pageIndex: 0);
}
