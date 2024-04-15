part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class OnboardingPageIndexUpdate extends OnboardingEvent {
  final int pageIndex;
  OnboardingPageIndexUpdate({required this.pageIndex});
}
