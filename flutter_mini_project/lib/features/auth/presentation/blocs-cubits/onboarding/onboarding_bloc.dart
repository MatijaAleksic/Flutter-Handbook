import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitialState()) {
    on<OnboardingPageIndexUpdate>(_pageIndexUpdate);
  }

  void _pageIndexUpdate(
      OnboardingPageIndexUpdate event, Emitter<OnboardingState> emit) {
    emit(OnboardingState(pageIndex: event.pageIndex));
  }
}
